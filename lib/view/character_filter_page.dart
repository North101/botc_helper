import 'package:collection/collection.dart';
import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_restorable/flutter_riverpod_restorable.dart';

import '/db/database.dart';
import '/providers/db.dart';
import '/view/async_value_builder.dart';
import '/view/character_grid.dart';

final scriptProvider = Provider<ScriptData>((ref) => throw UnimplementedError());
final filterListProvider = Provider<List<ScriptFilter>>((ref) => throw UnimplementedError());

final characterListProvider = StreamProvider((ref) {
  final db = ref.watch(dbProvider);
  final scriptId = ref.watch(scriptProvider.select((value) => value.id));
  final filterList = ref.watch(filterListProvider);
  return db
      .listScriptCharacter(
        where: (script, scriptCharacter, character) =>
            script.id.equals(scriptId) & buildFilter(script, scriptCharacter, character, filterList),
      )
      .watch()
      .map((e) => e.groupListsBy((e) => e.type).entries.toList());
}, dependencies: [
  dbProvider,
  scriptProvider,
  filterListProvider,
]);

drift.Expression<bool> buildFilter(
  Script script,
  ScriptCharacter scriptCharacter,
  Character character,
  List<ScriptFilter> filterList,
) {
  if (filterList.isEmpty) return const drift.Constant(true);
  return filterList
      .map<drift.Expression<bool>>((e) => e.when(
            type: (type, value) => character.type.equalsValue(value),
            character: (type, value) => character.id.equals(value),
            alignment: (type, value) => character.type.isIn([
              for (final type in CharacterType.values)
                if (type.alignment == value || type.alignment == null) const CharacterTypeConverter().toSql(type)
            ]),
          ))
      .reduce((value, element) => value | element);
}

class CharacterFilterArgument {
  const CharacterFilterArgument({
    required this.script,
    required this.scriptFilterList,
  });

  CharacterFilterArgument.fromJson(Map<String, dynamic> data)
      : this(
          script: ScriptData.fromJson(data['script']),
          scriptFilterList: (data['script_filters'] as List).map((e) => ScriptFilter.fromJson(e)).toList(),
        );

  final ScriptData script;
  final List<ScriptFilter> scriptFilterList;

  Map<String, dynamic> toJson() => {
        'script': script.toJson(),
        'script_filters': scriptFilterList.map((e) => e.toJson()).toList(),
      };
}

class CharacterFilterPage extends ConsumerWidget {
  const CharacterFilterPage({super.key});

  static Route<CharacterData> route(BuildContext context, Object? args) {
    final data = CharacterFilterArgument.fromJson((args as Map).cast());
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
      body: AsyncValueBuilder<List<MapEntry<CharacterType, List<CharacterData>>>>(
        value: characterList,
        data: (data) => CharacterGrid(
          data: data,
          onTap: (character) => Navigator.of(context).pop(character),
        ),
      ),
    );
  }
}
