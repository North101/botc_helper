import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_restorable/flutter_riverpod_restorable.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';

import '/db/database.dart';
import '/providers/db.dart';
import '/view/character_options/page.dart';
import '/view/header_list_tile.dart';
import '/view/util.dart';

final scriptProvider = Provider<ScriptData>((ref) => throw UnimplementedError());
final characterProvider = Provider<CharacterData>((ref) => throw UnimplementedError());
final characterOptionListProvider = StreamProvider((ref) {
  final db = ref.watch(dbProvider);
  final characterId = ref.watch(characterProvider).id;
  return db.listCharacterOptions(where: (characerOption) => characerOption.characterId.equals(characterId)).watch();
}, dependencies: [
  dbProvider,
  characterProvider,
]);
final genericOptionListProvider = StreamProvider((ref) {
  final db = ref.watch(dbProvider);
  return db.listCharacterOptions(where: (characerOption) => characerOption.characterId.isNull()).watch();
}, dependencies: [
  dbProvider,
]);

class CharacterPageArgument {
  const CharacterPageArgument({
    required this.script,
    required this.character,
  });

  CharacterPageArgument.fromJson(Map<String, dynamic> data)
      : this(
          script: ScriptData.fromJson((data['script'] as Map).cast()),
          character: CharacterData.fromJson((data['character'] as Map).cast()),
        );

  final ScriptData script;
  final CharacterData character;

  Map<String, dynamic> toJson() => {
        'script': script.toJson(),
        'character': character.toJson(),
      };
}

class CharacterPage extends ConsumerWidget {
  const CharacterPage({super.key});

  static Route<void> route(BuildContext context, Object? arg) {
    final arguments = CharacterPageArgument.fromJson((arg as Map).cast());
    return MaterialPageRoute(builder: (context) {
      return CharacterPage.withOverrides(
        script: arguments.script,
        character: arguments.character,
      );
    });
  }

  static Widget withOverrides({
    required ScriptData script,
    required CharacterData character,
  }) =>
      RestorableProviderScope(
        restorationId: 'character_page',
        overrides: [
          scriptProvider.overrideWithValue(script),
          characterProvider.overrideWithValue(character),
        ],
        restorableOverrides: const [],
        child: const CharacterPage(),
      );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final character = ref.watch(characterProvider);
    final characterOptionList = ref.watch(characterOptionListProvider);
    final genericOptionList = ref.watch(genericOptionListProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(character.name),
        backgroundColor: character.type.alignment?.color,
      ),
      body: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(child: CharacterHeader()),
          characterOptionList.when(
            loading: () => const SliverToBoxAdapter(child: Center(child: CircularProgressIndicator())),
            data: (data) => SliverStickyHeader(
              header: HeaderListTile.title(
                title: 'Character Info',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              sliver: SliverList(
                delegate: SliverChildSeperatedBuilderDelegate(
                  (context, index) => CharacterOptionTile(option: data[index]),
                  (context, index) => const Divider(),
                  childCount: data.length,
                ),
              ),
            ),
            error: (error, stackTrace) => SliverToBoxAdapter(child: Text(error.toString())),
          ),
          genericOptionList.when(
            loading: () => const SliverToBoxAdapter(child: Center(child: CircularProgressIndicator())),
            data: (data) => SliverStickyHeader(
              header: HeaderListTile.title(
                title: 'Generic Info',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              sliver: SliverList(
                delegate: SliverChildSeperatedBuilderDelegate(
                  (context, index) => CharacterOptionTile(option: data[index]),
                  (context, index) => const Divider(),
                  childCount: data.length,
                ),
              ),
            ),
            error: (error, stackTrace) => SliverToBoxAdapter(child: Text(error.toString())),
          ),
        ],
      ),
    );
  }
}

class CharacterHeader extends ConsumerWidget {
  const CharacterHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final character = ref.watch(characterProvider);
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(children: [
        character.image(),
        const SizedBox(height: 8),
        Text(character.description, style: Theme.of(context).textTheme.titleMedium),
      ]),
    );
  }
}

class CharacterOptionTile extends ConsumerWidget {
  const CharacterOptionTile({
    required this.option,
    super.key,
  });

  final CharacterOptionData option;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final script = ref.watch(scriptProvider);
    final character = ref.watch(characterProvider);
    return ListTile(
      title: Text(
        option.title,
        style: Theme.of(context).textTheme.headlineSmall,
      ),
      onTap: () => Navigator.of(context).restorablePush(
        CharacterOptionPage.route,
        arguments: CharacterOptionArguments(
          script: script,
          character: character,
          characterOption: option.item,
        ).toJson(),
      ),
    );
  }
}
