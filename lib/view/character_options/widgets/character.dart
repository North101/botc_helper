import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_restorable/flutter_riverpod_restorable.dart';

import '/db/database.dart';
import '/providers/db.dart';
import '/view/async_value_builder.dart';
import '/view/character_filter_page.dart';

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

class OptionCharacterItemWidget extends ConsumerStatefulWidget {
  const OptionCharacterItemWidget({
    required this.optionItem,
    required this.restorationId,
    super.key,
  });

  static Widget withOverrides({
    required String restorationId,
    required ScriptData script,
    required OptionCharacterItem optionItem,
  }) =>
      RestorableProviderScope(
        restorationId: restorationId,
        restorableOverrides: [
          characterIdProvider.overrideWithRestorable(RestorableStringN(optionItem.value)),
        ],
        overrides: [scriptProvider.overrideWithValue(script)],
        child: OptionCharacterItemWidget(
          restorationId: '${restorationId}_page',
          optionItem: optionItem,
        ),
      );

  final OptionCharacterItem optionItem;
  final String restorationId;

  @override
  OptionCharacterItemWidgetState createState() => OptionCharacterItemWidgetState();
}

class OptionCharacterItemWidgetState extends ConsumerState<OptionCharacterItemWidget> with RestorationMixin {
  late RestorableRouteFuture<CharacterData?> characterFilterRouteFuture;

  @override
  void initState() {
    super.initState();

    characterFilterRouteFuture = RestorableRouteFuture<CharacterData?>(
      onPresent: (navigator, arguments) => navigator.restorablePush(
        CharacterFilterPage.route,
        arguments: arguments,
      ),
      onComplete: (result) {
        if (result == null) return;

        ref.read(characterIdProvider).value = result.id;
      },
    );
  }

  @override
  String? get restorationId => widget.restorationId;

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(characterFilterRouteFuture, 'characterFilterRouteFuture');
  }

  @override
  Widget build(BuildContext context) {
    final script = ref.watch(scriptProvider);
    final character = ref.watch(characterProvider);
    return AsyncValueBuilder(
      value: character,
      data: (character) {
        if (character == null) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ElevatedButton(
              child: Padding(
                padding: const EdgeInsets.all(4),
                child: Center(
                  child: Text(
                    'Select Character',
                    style: Theme.of(context).textTheme.displaySmall?.copyWith(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              onPressed: () => characterFilterRouteFuture.present(
                CharacterFilterArguments(
                  script: script,
                  scriptFilterList: widget.optionItem.filter,
                ).toJson(),
              ),
            ),
          );
        }

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Card(
            child: InkWell(
              onTap: () => characterFilterRouteFuture.present(
                CharacterFilterArguments(
                  script: script,
                  scriptFilterList: widget.optionItem.filter,
                ).toJson(),
              ),
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
      },
    );
  }
}
