import 'package:collection/collection.dart';
import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_restorable/flutter_riverpod_restorable.dart';
import 'package:json_annotation/json_annotation.dart';

import '/db/database.dart';
import '/providers/db.dart';
import '/view/async_value_builder.dart';
import '/view/character_list.dart';

part 'character_filter_page.g.dart';

final scriptProvider = Provider<ScriptData>((ref) => throw UnimplementedError());
final filterListProvider = Provider<List<ScriptFilter>>((ref) => throw UnimplementedError());

final characterListProvider = StreamProvider((ref) {
  final db = ref.watch(dbProvider);
  final scriptId = ref.watch(scriptProvider.select((value) => value.id));
  final filterList = ref.watch(filterListProvider);
  return db
      .listCharacters(
        where: (character) =>
            character.id.isInQuery(db.characterIdInScript(scriptId)) & buildFilter(character, filterList),
        orderBy: (character) => drift.OrderBy([
          drift.OrderingTerm.asc(character.position),
        ]),
      )
      .watch()
      .map((e) => e.groupListsBy((e) => e.type).entries.toList());
}, dependencies: [
  dbProvider,
  scriptProvider,
  filterListProvider,
]);

drift.Expression<bool> buildFilter(
  Character character,
  List<ScriptFilter> filterList,
) {
  if (filterList.isEmpty) return const drift.Constant(true);
  return filterList
      .map<drift.Expression<bool>>((e) => e.when(
            type: (type, value) => character.type.equalsValue(value),
            character: (type, value) => character.id.equals(value),
            alignment: (type, value) => character.type.isInValues([
              for (final type in CharacterType.values)
                if (type.alignment == value || type.alignment == null) type
            ]),
          ))
      .reduce((value, element) => value | element);
}

@JsonSerializable()
class CharacterFilterArguments {
  const CharacterFilterArguments({
    required this.script,
    required this.scriptFilterList,
  });

  factory CharacterFilterArguments.fromJson(Map<String, dynamic> json) => _$CharacterFilterArgumentsFromJson(json);

  @JsonKey(fromJson: scriptFromJson, toJson: scriptToJson)
  final ScriptData script;
  @JsonKey(fromJson: scriptFilterListFromJson, toJson: scriptFilterListToJson)
  final List<ScriptFilter> scriptFilterList;

  Map<String, dynamic> toJson() => _$CharacterFilterArgumentsToJson(this);
}

class CharacterFilterPage extends ConsumerWidget {
  const CharacterFilterPage({super.key});

  static Route<CharacterData> route(BuildContext context, Object? args) {
    final data = CharacterFilterArguments.fromJson((args as Map).cast());
    return MaterialPageRoute(builder: (context) {
      return CharacterFilterPage.withOverrides(
        script: data.script,
        scriptFilterList: data.scriptFilterList,
      );
    });
  }

  static Widget withOverrides({
    required ScriptData script,
    required List<ScriptFilter> scriptFilterList,
  }) =>
      RestorableProviderScope(
        restorationId: 'character_filter_page',
        restorableOverrides: const [],
        overrides: [
          scriptProvider.overrideWithValue(script),
          filterListProvider.overrideWithValue(scriptFilterList),
        ],
        child: const CharacterFilterPage(),
      );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final characterList = ref.watch(characterListProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Select a Character')),
      body: AsyncValueBuilder(
        value: characterList,
        data: (data) => CharacterList(
          data: data,
          onTap: (character) => Navigator.of(context).pop(character),
        ),
      ),
    );
  }
}
