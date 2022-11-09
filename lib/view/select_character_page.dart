import 'package:collection/collection.dart';
import 'package:drift/drift.dart' as drift hide JsonKey;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_restorable/flutter_riverpod_restorable.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:json_annotation/json_annotation.dart';

import '/db/database.dart';
import '/providers.dart';
import '/util/restorable.dart';
import '/view/async_value_builder.dart';
import '/view/header_list_tile.dart';
import '/view/util.dart';

part 'select_character_page.g.dart';

final scriptProvider = Provider<ScriptData?>((ref) => throw UnimplementedError());

final characterListProvider = StreamProvider((ref) {
  final db = ref.watch(dbProvider);
  final script = ref.watch(scriptProvider);
  return db
      .listCharacters(
        where: (character) {
          if (script != null) {
            final scriptCharacter = character.id.isInQuery(db.characterIdInScript(script.id));
            final travellerCharacter = character.type.equalsValue(CharacterType.traveller);
            return scriptCharacter | travellerCharacter;
          }

          return character.type.isInValues(const {
            CharacterType.townsfolk,
            CharacterType.outsider,
            CharacterType.minion,
            CharacterType.demon,
            CharacterType.fabled,
          });
        },
        orderBy: (character) => drift.OrderBy([
          drift.OrderingTerm.asc(character.position),
        ]),
      )
      .watch()
      .map((e) => e.groupListsBy((e) => e.type).entries);
}, dependencies: [
  dbProvider,
  scriptProvider,
]);

final selectedIdListProvider = RestorableProvider<RestorableSet<String>>(
  (ref) => throw UnimplementedError(),
  restorationId: 'selectedIdListProvider',
);

@JsonSerializable()
class SelectCharacterArgument {
  const SelectCharacterArgument({
    required this.script,
    required this.characterIdList,
  });

  factory SelectCharacterArgument.fromJson(Map<String, dynamic> json) => _$SelectCharacterArgumentFromJson(json);

  @JsonKey(fromJson: scriptNFromJson, toJson: scriptNToJson)
  final ScriptData? script;
  final Iterable<String> characterIdList;

  Map<String, dynamic> toJson() => _$SelectCharacterArgumentToJson(this);
}

class SelectCharacterPage extends ConsumerWidget {
  const SelectCharacterPage({
    super.key,
  });

  static Route<Iterable<String>> route(BuildContext context, Object? arguments) {
    final args = SelectCharacterArgument.fromJson((arguments as Map).cast());
    return MaterialPageRoute(builder: (context) {
      return SelectCharacterPage.withOverrides(args);
    });
  }

  static Widget withOverrides(SelectCharacterArgument args) => RestorableProviderScope(
        restorationId: 'select_character_page',
        overrides: [
          scriptProvider.overrideWithValue(args.script),
          selectedIdListProvider.overrideWith((ref) => RestorableSet(args.characterIdList)),
        ],
        child: const SelectCharacterPage(),
      );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final characterList = ref.watch(characterListProvider);
    return WillPopScope(
      onWillPop: () async {
        final selectedIdList = ref.read(selectedIdListProvider).value;
        Navigator.of(context).pop<Iterable<String>>(selectedIdList);
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Characters'),
          actions: const [
            SelectButton(),
          ],
        ),
        body: AsyncValueBuilder(
          value: characterList,
          data: (data) => CustomScrollView(
            slivers: [
              for (final characterByType in data)
                SliverStickyHeader(
                  header: HeaderListTile.titleCount(
                    title: characterByType.key.title,
                    count: characterByType.value.length,
                  ),
                  sliver: SliverList(
                    delegate: SliverChildSeperatedBuilderDelegate(
                      (context, index) => HideCharacterTile(character: characterByType.value[index]),
                      (context, index) => const Divider(),
                      childCount: characterByType.value.length,
                    ),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}

class HideCharacterTile extends ConsumerWidget {
  const HideCharacterTile({
    required this.character,
    super.key,
  });

  final CharacterData character;

  void onChange(WidgetRef ref, bool value) {
    final selectedIdList = ref.read(selectedIdListProvider);
    selectedIdList.value = {
      ...selectedIdList.value.where((e) => e != character.id),
      if (value) character.id,
    };
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selected = ref.watch(selectedIdListProvider.select((value) {
      return value.value.contains(character.id);
    }));
    return ListTile(
      title: Text(character.name),
      leading: character.image(width: 40, height: 40),
      onTap: () => onChange(ref, !selected),
      trailing: Checkbox(
        value: selected,
        onChanged: (value) => onChange(ref, value == true),
      ),
    );
  }
}

class SelectButton extends ConsumerWidget {
  const SelectButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hasSelected = ref.watch(selectedIdListProvider.select((value) => value.value.isNotEmpty));
    if (hasSelected) {
      return IconButton(
        tooltip: 'Select None',
        onPressed: () {
          final selectedIdList = ref.read(selectedIdListProvider);
          selectedIdList.value = {};
        },
        icon: const Icon(Icons.deselect),
      );
    }

    return IconButton(
      tooltip: 'Select All',
      onPressed: () async {
        final characterList = await ref.read(characterListProvider.future);
        final selectedIdList = ref.read(selectedIdListProvider);
        selectedIdList.value = {
          for (final characterByType in characterList)
            if (characterByType.key.alignment != null)
              for (final character in characterByType.value) character.id,
        };
      },
      icon: const Icon(Icons.select_all),
    );
  }
}
