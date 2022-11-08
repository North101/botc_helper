import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_restorable/flutter_riverpod_restorable.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:json_annotation/json_annotation.dart';

import '/db/database.dart';
import '/providers/db.dart';
import '/view/character_options/page.dart';
import '/view/header_list_tile.dart';
import '/view/util.dart';

part 'character_page.g.dart';

final scriptProvider = Provider<ScriptData>((ref) => throw UnimplementedError());
final characterProvider = Provider<CharacterData>((ref) => throw UnimplementedError());
final characterOptionListProvider = StreamProvider((ref) {
  final db = ref.watch(dbProvider);
  final characterId = ref.watch(characterProvider).id;
  return db
      .listCharacterOptions(
        where: (characerOption) => characerOption.characterId.equals(characterId),
      )
      .watch();
}, dependencies: [
  dbProvider,
  characterProvider,
]);
final genericOptionListProvider = StreamProvider((ref) {
  final db = ref.watch(dbProvider);
  return db
      .listCharacterOptions(
        where: (characerOption) => characerOption.characterId.isNull(),
      )
      .watch();
}, dependencies: [
  dbProvider,
]);

@JsonSerializable()
class CharacterPageArguments {
  const CharacterPageArguments({
    required this.script,
    required this.character,
  });

  factory CharacterPageArguments.fromJson(Map<String, dynamic> json) => _$CharacterPageArgumentsFromJson(json);

  @JsonKey(fromJson: scriptFromJson, toJson: scriptToJson)
  final ScriptData script;
  @JsonKey(fromJson: characterFromJson, toJson: characterToJson)
  final CharacterData character;

  Map<String, dynamic> toJson() => _$CharacterPageArgumentsToJson(this);
}

class CharacterPage extends ConsumerWidget {
  const CharacterPage({super.key});

  static Route<void> route(BuildContext context, Object? arguments) {
    final args = CharacterPageArguments.fromJson((arguments as Map).cast());
    return MaterialPageRoute(builder: (context) {
      return CharacterPage.withOverrides(args);
    });
  }

  static Widget withOverrides(CharacterPageArguments args) => RestorableProviderScope(
        restorationId: 'character_page',
        overrides: [
          scriptProvider.overrideWithValue(args.script),
          characterProvider.overrideWithValue(args.character),
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
            data: (data) {
              if (data.isEmpty) return const SliverToBoxAdapter(child: SizedBox.shrink());

              return SliverStickyHeader(
                header: HeaderListTile.title(
                  title: '${character.name} Info',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                sliver: SliverList(
                  delegate: SliverChildSeperatedBuilderDelegate(
                    (context, index) => CharacterOptionTile(option: data[index]),
                    (context, index) => const Divider(),
                    childCount: data.length,
                  ),
                ),
              );
            },
            error: (error, stackTrace) => SliverToBoxAdapter(child: Text(error.toString())),
          ),
          const SliverToBoxAdapter(child: OptionsDivider()),
          genericOptionList.when(
            loading: () => const SliverToBoxAdapter(child: Center(child: CircularProgressIndicator())),
            data: (data) {
              if (data.isEmpty) return const SliverToBoxAdapter(child: SizedBox.shrink());

              return SliverStickyHeader(
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
              );
            },
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

    return Column(children: [
      character.image(
        frameBuilder: (context, child, frame, wasSynchronouslyLoaded) => Padding(
          padding: const EdgeInsets.all(8),
          child: child,
        ),
      ),
      if (character.description.isNotEmpty)
        Padding(
          padding: const EdgeInsets.all(8),
          child: Text(
            character.description,
            style: Theme.of(context).textTheme.titleMedium,
            textAlign: TextAlign.center,
          ),
        ),
    ]);
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

class OptionsDivider extends ConsumerWidget {
  const OptionsDivider({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hasCharacterOptionData = ref.watch(characterOptionListProvider.select((value) => value.when(
          loading: () => false,
          data: (data) => data.isNotEmpty,
          error: (error, stackTrace) => true,
        )));
    final hasGenericOptionData = ref.watch(genericOptionListProvider.select((value) => value.when(
          loading: () => false,
          data: (data) => data.isNotEmpty,
          error: (error, stackTrace) => true,
        )));

    return hasCharacterOptionData && hasGenericOptionData ? const SizedBox(height: 8) : const SizedBox.shrink();
  }
}
