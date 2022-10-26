import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_restorable/flutter_riverpod_restorable.dart';

import '/db/database.dart';
import '/view/character_options/widgets/alignment.dart';
import '/view/character_options/widgets/character.dart';
import '/view/character_options/widgets/label.dart';
import '/view/character_options/widgets/number.dart';
import '/view/character_options/widgets/select.dart';
import '/view/character_options/widgets/text.dart';

final scriptProvider = Provider<ScriptData>((ref) => throw UnimplementedError());
final characterProvider = Provider<CharacterData>((ref) => throw UnimplementedError());
final characterOptionProvider = Provider<CharacterOptionItem>((ref) => throw UnimplementedError());

class CharacterOptionArguments {
  const CharacterOptionArguments({
    required this.script,
    required this.character,
    required this.characterOption,
  });

  CharacterOptionArguments.fromJson(Map<String, dynamic> data)
      : this(
          script: ScriptData.fromJson((data['script'] as Map).cast()),
          character: CharacterData.fromJson((data['character'] as Map).cast()),
          characterOption: CharacterOptionItem.fromJson((data['character_option'] as Map).cast()),
        );

  final ScriptData script;
  final CharacterData character;
  final CharacterOptionItem characterOption;

  Map<String, dynamic> toJson() => {
        'script': script.toJson(),
        'character': character.toJson(),
        'character_option': characterOption.toJson(),
      };
}

class CharacterOptionPage extends ConsumerWidget {
  const CharacterOptionPage({super.key});

  static Route<void> route(BuildContext context, Object? args) {
    final data = CharacterOptionArguments.fromJson((args as Map).cast());
    return MaterialPageRoute(builder: (context) {
      return CharacterOptionPage.withOverrides(
        script: data.script,
        character: data.character,
        characterOption: data.characterOption,
      );
    });
  }

  static Widget withOverrides({
    required ScriptData script,
    required CharacterData character,
    required CharacterOptionItem characterOption,
  }) =>
      RestorableProviderScope(
        restorationId: 'character_option_page',
        restorableOverrides: const [],
        overrides: [
          scriptProvider.overrideWithValue(script),
          characterProvider.overrideWithValue(character),
          characterOptionProvider.overrideWithValue(characterOption),
        ],
        child: const CharacterOptionPage(),
      );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final script = ref.watch(scriptProvider);
    final character = ref.watch(characterProvider);
    final characterOption = ref.watch(characterOptionProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Blood on the Clocktower')),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Flexible(
            child: Center(
              child: ListView.builder(
                shrinkWrap: true,
                itemBuilder: (context, index) => OptionItemWidget(
                  optionItem: characterOption.items[index],
                  index: index,
                ),
                itemCount: characterOption.items.length,
              ),
            ),
          ),
          if (characterOption.next != null)
            Padding(
              padding: const EdgeInsets.all(8),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Navigator.of(context).restorablePush(
                    CharacterOptionPage.route,
                    arguments: CharacterOptionArguments(
                      script: script,
                      character: character,
                      characterOption: characterOption.next!,
                    ).toJson(),
                  ),
                  child: const Text('Next'),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class OptionItemWidget extends ConsumerWidget {
  const OptionItemWidget({
    required this.optionItem,
    required this.index,
    super.key,
  });

  final OptionItem optionItem;
  final int index;

  String get restorationId => 'option_item_$index';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final script = ref.watch(scriptProvider);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: optionItem.map(
        label: (item) => OptionLabelItemWidget(optionItem: item),
        character: (item) => OptionCharacterItemWidget.withOverrides(
          restorationId: restorationId,
          script: script,
          optionItem: item,
        ),
        alignment: (item) => OptionAlignmentItemWidget.withOverrides(
          restorationId: restorationId,
          optionItem: item,
        ),
        select: (item) => OptionSelectItemWidget.withOverrides(
          restorationId: restorationId,
          optionItem: item,
        ),
        number: (item) => OptionNumberItemWidget.withOverrides(
          restorationId: restorationId,
          optionItem: item,
        ),
        text: (item) => OptionTextItemWidget.withOverrides(
          restorationId: restorationId,
          optionItem: item,
        ),
      ),
    );
  }
}
