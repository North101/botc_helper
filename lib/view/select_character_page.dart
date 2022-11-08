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

final invertProvider = Provider<bool>((ref) => throw UnimplementedError());

final characterListProvider = StreamProvider((ref) {
  final db = ref.watch(dbProvider);
  final script = ref.watch(scriptProvider);
  return db
      .listCharacters(
        where: (character) {
          if (script != null) {
            return character.id.isInQuery(db.characterIdInScript(script.id)) |
                character.type.equalsValue(CharacterType.traveller);
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

final selectedCharacterIdProvider = RestorableProvider<RestorableSet<String>>(
  (ref) => throw UnimplementedError(),
  restorationId: 'selectedCharacterIdProvider',
);

@JsonSerializable()
class SelectCharacterArgument {
  const SelectCharacterArgument({
    required this.script,
    required this.characterIdList,
    required this.invert,
  });

  factory SelectCharacterArgument.fromJson(Map<String, dynamic> json) => _$SelectCharacterArgumentFromJson(json);

  @JsonKey(fromJson: scriptNFromJson, toJson: scriptNToJson)
  final ScriptData? script;
  final Iterable<String> characterIdList;
  final bool invert;

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
        restorationId: 'hide_character_page',
        overrides: [
          scriptProvider.overrideWithValue(args.script),
          invertProvider.overrideWithValue(args.invert),
        ],
        restorableOverrides: [
          selectedCharacterIdProvider.overrideWithRestorable(RestorableSet(args.characterIdList)),
        ],
        child: const SelectCharacterPage(),
      );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final characterList = ref.watch(characterListProvider);
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pop(ref.read(selectedCharacterIdProvider).value);
        return false;
      },
      child: Scaffold(
        appBar: AppBar(title: const Text('Select Characters')),
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

  bool get isTraveller => character.type == CharacterType.traveller;

  bool isSelected(bool value, bool invert) => value ^ isTraveller ^ invert;

  void onChange(WidgetRef ref, bool value) {
    final invert = ref.read(invertProvider);
    final nightHidden = ref.read(selectedCharacterIdProvider);
    nightHidden.value = {
      ...nightHidden.value.where((e) => e != character.id),
      if (isSelected(value, invert)) character.id,
    };
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final invert = ref.watch(invertProvider);
    final selected = ref.watch(selectedCharacterIdProvider.select((value) {
      return isSelected(value.value.contains(character.id), invert);
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
