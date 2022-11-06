import 'package:botc_helper/util/restorable.dart';
import 'package:collection/collection.dart';
import 'package:drift/drift.dart' as drift hide JsonKey;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_restorable/flutter_riverpod_restorable.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:json_annotation/json_annotation.dart';

import '/db/database.dart';
import '/providers.dart';
import '/view/async_value_builder.dart';
import '/view/header_list_tile.dart';
import '/view/util.dart';

part 'hide_character_page.g.dart';

final scriptProvider = Provider<ScriptData>((ref) => throw UnimplementedError());

final characterListProvider = StreamProvider((ref) {
  final db = ref.watch(dbProvider);
  final script = ref.watch(scriptProvider);
  return db
      .listCharacters(
        where: (character) => character.id.isInQuery(db.characterIdInScript(script.id)),
        orderBy: (character) => drift.OrderBy([
          drift.OrderingTerm.asc(character.position),
        ]),
      )
      .watch()
      .map((e) => e.groupListsBy((e) => e.type).entries.toList());
}, dependencies: [
  dbProvider,
  scriptProvider,
]);

final hiddenCharacterProvider = RestorableProvider<RestorableSet<String>>(
  (ref) => throw UnimplementedError(),
  restorationId: 'hiddenCharacterProvider',
);

@JsonSerializable()
class HideCharacterArgument {
  const HideCharacterArgument({
    required this.script,
    required this.characterIdList,
  });

  factory HideCharacterArgument.fromJson(Map<String, dynamic> json) => _$HideCharacterArgumentFromJson(json);

  @JsonKey(fromJson: scriptFromJson, toJson: scriptToJson)
  final ScriptData script;
  final Set<String> characterIdList;

  Map<String, dynamic> toJson() => _$HideCharacterArgumentToJson(this);
}

class HideCharacterPage extends ConsumerWidget {
  const HideCharacterPage({
    super.key,
  });

  static Route<Set<String>> route(BuildContext context, Object? args) {
    final data = HideCharacterArgument.fromJson((args as Map).cast());
    return MaterialPageRoute(builder: (context) {
      return HideCharacterPage.withOverrides(
        script: data.script,
        characterIdList: data.characterIdList,
      );
    });
  }

  static Widget withOverrides({
    required ScriptData script,
    required Set<String> characterIdList,
  }) =>
      RestorableProviderScope(
        restorationId: 'hide_character_page',
        overrides: [
          scriptProvider.overrideWithValue(script),
        ],
        restorableOverrides: [
          hiddenCharacterProvider.overrideWithRestorable(RestorableSet(characterIdList)),
        ],
        child: const HideCharacterPage(),
      );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final characterList = ref.watch(characterListProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hide Characters'),
        actions: [
          IconButton(
              tooltip: 'Done',
              onPressed: () => Navigator.of(context).pop<Set<String>>(ref.read(hiddenCharacterProvider).value),
              icon: const Icon(Icons.done)),
        ],
      ),
      body: AsyncValueBuilder(
        value: characterList,
        data: (data) => CustomScrollView(
          slivers: [
            for (final characterByType in data)
              SliverStickyHeader(
                header: HeaderListTile.title(title: characterByType.key.title),
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
    );
  }
}

class HideCharacterTile extends ConsumerWidget {
  const HideCharacterTile({
    required this.character,
    super.key,
  });

  final CharacterData character;

  void onChange(WidgetRef ref, bool? value) {
    final nightHidden = ref.read(hiddenCharacterProvider);
    nightHidden.value = {
      ...nightHidden.value.where((e) => e != character.id),
      if (value == true) character.id,
    };
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hidden = ref.watch(hiddenCharacterProvider.select((value) => value.value.contains(character.id)));
    return ListTile(
      title: Text(character.name),
      leading: character.image(width: 40, height: 40),
      onTap: () => onChange(ref, !hidden),
      trailing: Checkbox(
        value: hidden,
        onChanged: (value) => onChange(ref, value),
      ),
    );
  }
}
