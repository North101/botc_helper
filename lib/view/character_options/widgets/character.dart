import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_restorable/flutter_riverpod_restorable.dart';

import '../page.dart';
import '/db/database.dart';
import '/providers/db.dart';
import '/view/async_value_builder.dart';

final optionItemProvider = Provider<OptionCharacterItem>((ref) => throw UnimplementedError());

final characterIdProvider = RestorableProvider<RestorableStringN>(
  (ref) => throw UnimplementedError(),
  restorationId: 'character_provider',
);

final characterProvider = StreamProvider((ref) {
  final db = ref.watch(dbProvider);
  final characterId = ref.watch(characterIdProvider).value;
  if (characterId == null) return Stream.value(null);
  return db
      .listCharacters(
        where: (character) => character.id.equals(characterId),
        orderBy: (character) => drift.OrderBy([
          drift.OrderingTerm.asc(character.position),
        ]),
      )
      .watchSingleOrNull();
}, dependencies: [
  dbProvider,
  characterIdProvider,
]);

final characterListProvider = StreamProvider((ref) {
  final db = ref.watch(dbProvider);
  final scriptId = ref.watch(scriptProvider.select((value) => value.id));
  final optionItem = ref.watch(optionItemProvider);
  return db
      .listCharacters(
        where: (character) {
          final scriptCharacter = character.id.isInQuery(db.characterIdInScript(scriptId));
          final travellerCharacter = character.type.equalsValue(CharacterType.traveller);
          final filter = buildFilter(character, optionItem.filter);
          return (scriptCharacter | travellerCharacter) & filter;
        },
        orderBy: (character) => drift.OrderBy([
          drift.OrderingTerm.asc(character.position),
        ]),
      )
      .watch();
}, dependencies: [
  dbProvider,
  scriptProvider,
  optionItemProvider,
]);

drift.Expression<bool> buildFilter(
  Character character,
  Iterable<ScriptFilter> filterList,
) {
  if (filterList.isEmpty) return const drift.Constant(true);
  return filterList
      .map<drift.Expression<bool>>((e) => e.when(
            type: (type, value) => character.type.equalsValue(value),
            character: (type, value) => character.id.equals(value),
            alignment: (type, value) => character.type.isInValues([
              for (final type in CharacterType.values)
                if (type.alignment == value) type
            ]),
          ))
      .reduce((value, element) => value | element);
}

class OptionCharacterItemWidget extends ConsumerWidget {
  const OptionCharacterItemWidget({super.key});

  static Widget withOverrides({
    required String restorationId,
    required ScriptData script,
    required OptionCharacterItem optionItem,
  }) =>
      RestorableProviderScope(
        restorationId: restorationId,
        overrides: [
          characterIdProvider.overrideWith((ref) => RestorableStringN(optionItem.value)),
          scriptProvider.overrideWithValue(script),
          optionItemProvider.overrideWithValue(optionItem),
        ],
        child: const OptionCharacterItemWidget(),
      );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final character = ref.watch(characterProvider);
    return AsyncValueBuilder(
      value: character,
      data: (character) => character != null ? CharacterCard(character: character) : const CharacterGrid(),
    );
  }
}

class CharacterGrid extends ConsumerWidget {
  const CharacterGrid({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final characterList = ref.watch(characterListProvider);
    return AsyncValueBuilder(
      value: characterList,
      data: (data) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Wrap(
          alignment: WrapAlignment.center,
          children: [
            for (final character in data)
              InkWell(
                onTap: () {
                  ref.read(characterIdProvider).value = character.id;
                },
                child: character.image(
                  height: 80,
                  width: 80,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class CharacterCard extends ConsumerWidget {
  const CharacterCard({
    required this.character,
    super.key,
  });

  final CharacterData character;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Card(
        child: InkWell(
          onTap: () {
            ref.read(characterIdProvider).value = null;
          },
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                character.image(),
                Text(
                  character.name,
                  style: Theme.of(context).textTheme.displaySmall,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
