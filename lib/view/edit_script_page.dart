import 'package:collection/collection.dart';
import 'package:drift/drift.dart' as drift;
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_restorable/flutter_riverpod_restorable.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

import '/db/database.dart';
import '/providers/db.dart';
import '/util/restorable.dart';
import '/util/script_data.dart';
import '/view/async_value_builder.dart';
import '/view/header_list_tile.dart';

part 'edit_script_page.g.dart';

final collapseProvider = RestorableProvider<RestorableBool>(
  (ref) => throw UnimplementedError(),
  restorationId: 'collapse_provider',
);

final scriptProvider = RestorableProvider<RestorableScriptData>(
  (ref) => throw UnimplementedError(),
  restorationId: 'script_provider',
);

final characterIdListProvider = RestorableProvider<RestorableSet<String>>(
  (ref) => throw UnimplementedError(),
  restorationId: 'character_id_list_provider',
);

final characterListProvider = StreamProvider((ref) {
  final db = ref.watch(dbProvider);
  final collapsed = ref.watch(collapseProvider).value;
  final characterIdList = ref.watch(characterIdListProvider).value;
  return db
      .listCharacters(
        where: (character) => character.type.isNotInValues([
          CharacterType.info,
          CharacterType.traveler,
        ]),
        orderBy: (character) => drift.OrderBy([
          drift.OrderingTerm.asc(character.position),
        ]),
      )
      .watch()
      .map((e) => e.where((e) => !collapsed || characterIdList.contains(e.id)).groupListsBy((e) => e.type).entries);
}, dependencies: [
  dbProvider,
  characterIdListProvider,
  collapseProvider,
]);

@JsonSerializable()
class EditScriptArguments {
  const EditScriptArguments({
    required this.script,
    required this.characterIdList,
  });

  factory EditScriptArguments.fromJson(Map<String, dynamic> json) => _$EditScriptArgumentsFromJson(json);

  @JsonKey(fromJson: scriptFromJson, toJson: scriptToJson)
  final ScriptData script;
  final Iterable<String> characterIdList;

  Map<String, dynamic> toJson() => _$EditScriptArgumentsToJson(this);
}

class EditScriptPage extends ConsumerWidget {
  const EditScriptPage({super.key});

  static Route<void> route(BuildContext context, Object? args) {
    final data = EditScriptArguments.fromJson((args as Map).cast());
    return MaterialPageRoute(builder: (context) {
      return EditScriptPage.withOverrides(
        script: data.script,
        characterIdList: data.characterIdList,
      );
    });
  }

  static Widget withOverrides({
    required ScriptData script,
    required Iterable<String> characterIdList,
  }) =>
      RestorableProviderScope(
        restorationId: 'edit_script_page',
        restorableOverrides: [
          scriptProvider.overrideWithRestorable(RestorableScriptData(script)),
          collapseProvider.overrideWithRestorable(RestorableBool(characterIdList.isNotEmpty)),
          characterIdListProvider.overrideWithRestorable(RestorableSet(characterIdList)),
        ],
        child: const EditScriptPage(),
      );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final characterList = ref.watch(characterListProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Script'),
        actions: const [
          CollapseButton(),
          ImportButton(),
          SaveButton(),
        ],
      ),
      body: Column(
        children: [
          const ScriptNameField(),
          Expanded(
            child: AsyncValueBuilder(
              value: characterList,
              data: (data) => CustomScrollView(
                slivers: [
                  for (final characterByType in data)
                    SliverStickyHeader(
                      header: HeaderListTile.title(title: characterByType.key.title),
                      sliver: SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) => CharacterTile(character: characterByType.value[index]),
                          childCount: characterByType.value.length,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ScriptNameField extends ConsumerStatefulWidget {
  const ScriptNameField({super.key});

  @override
  ScriptNameFieldState createState() => ScriptNameFieldState();
}

class ScriptNameFieldState extends ConsumerState<ScriptNameField> {
  final controller = TextEditingController();

  @override
  void initState() {
    super.initState();

    setName(ref.read(scriptProvider).value.name);
  }

  void setName(String name) {
    if (controller.text == name) return;

    controller.text = name;
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<String>(
      scriptProvider.select((value) => value.value.name),
      (prevValue, value) => setName(value),
    );
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextFormField(
        controller: controller,
        decoration: const InputDecoration(labelText: 'Script Name'),
        onChanged: (value) {
          final script = ref.read(scriptProvider);
          script.value = script.value.copyWith(
            name: value,
          );
        },
      ),
    );
  }
}

class CharacterTile extends ConsumerWidget {
  const CharacterTile({
    required this.character,
    super.key,
  });

  final CharacterData character;

  void onChange(WidgetRef ref, bool? value) {
    final characterIdList = ref.read(characterIdListProvider);
    characterIdList.value = {
      ...characterIdList.value.where((e) => e != character.id),
      if (value == true) character.id,
    };
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final collapsed = ref.watch(collapseProvider).value;
    final selected = ref.watch(characterIdListProvider.select((value) => value.value.contains(character.id)));
    return ListTile(
      leading: character.image(
        width: 48,
        height: 48,
      ),
      title: Text(character.name),
      onTap: () => onChange(ref, !selected),
      trailing: !collapsed
          ? Checkbox(
              value: selected,
              onChanged: (value) => onChange(ref, value),
            )
          : null,
    );
  }
}

class CollapseButton extends ConsumerWidget {
  const CollapseButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final collapsed = ref.watch(collapseProvider).value;
    return IconButton(
      tooltip: collapsed ? 'Uncollapse' : 'Collapse',
      onPressed: () {
        final collapse = ref.read(collapseProvider);
        collapse.value = !collapse.value;
      },
      icon: collapsed ? const Icon(Icons.unfold_more) : const Icon(Icons.unfold_less),
    );
  }
}

class ImportButton extends ConsumerWidget {
  const ImportButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
      tooltip: 'Import',
      onPressed: () async {
        final data = await showDialog<ScriptImportData>(
          context: context,
          barrierDismissible: false,
          builder: (context) => const ImportScriptDialog(),
        );
        if (data == null) return;

        final script = ref.read(scriptProvider);
        script.value = ScriptData(
          id: const Uuid().v4(),
          name: data.name,
          custom: true,
        );

        final characterIdList = ref.read(characterIdListProvider);
        characterIdList.value = data.characterIdList;

        final collapsed = ref.read(collapseProvider);
        collapsed.value = true;
      },
      icon: const Icon(Icons.download),
    );
  }
}

final importScriptProvider = FutureProvider.autoDispose((ref) async {
  final result = await FilePicker.platform.pickFiles(
    dialogTitle: 'Import Script',
    type: FileType.custom,
    allowedExtensions: ['json'],
  );
  final file = result?.files.single;
  if (file == null) return null;

  return await importScriptData(file);
});

class ImportScriptDialog extends ConsumerWidget {
  const ImportScriptDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final importScript = ref.watch(importScriptProvider);
    ref.listen(importScriptProvider, (previous, next) {
      next.whenData((value) => Navigator.of(context).pop(value));
    });
    return AsyncValueBuilder(
      value: importScript,
      loading: () => AlertDialog(
        title: const Text('Importing...'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Center(child: CircularProgressIndicator()),
          ],
        ),
      ),
      data: (data) => AlertDialog(
        title: const Text('Importing...'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Center(child: CircularProgressIndicator()),
          ],
        ),
      ),
      error: (error, stackTrace) => AlertDialog(
        title: const Text('Import Failed'),
        actions: [
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }
}

class SaveButton extends ConsumerWidget {
  const SaveButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
      tooltip: 'Save',
      onPressed: () {
        final scope = ProviderScope.containerOf(context);
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => ProviderScope(
            parent: scope,
            child: const SaveScriptDialog(),
          ),
        );
      },
      icon: const Icon(Icons.save),
    );
  }
}

final saveScriptProvider = FutureProvider.autoDispose((ref) async {
  final db = ref.read(dbProvider);
  final script = ref.read(scriptProvider);
  final characterIdList = ref.read(characterIdListProvider);
  return await db.upsertScript(script.value, characterIdList.value);
}, dependencies: [
  dbProvider,
  scriptProvider,
  characterIdListProvider,
]);

class SaveScriptDialog extends ConsumerWidget {
  const SaveScriptDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final saveScript = ref.watch(saveScriptProvider);
    ref.listen(saveScriptProvider, (previous, next) {
      next.whenData((value) => Navigator.of(context).pop());
    });
    return AsyncValueBuilder(
      value: saveScript,
      loading: () => AlertDialog(
        title: const Text('Saving...'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Center(child: CircularProgressIndicator()),
          ],
        ),
      ),
      data: (data) => AlertDialog(
        title: const Text('Saving...'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Center(child: CircularProgressIndicator()),
          ],
        ),
      ),
      error: (error, stackTrace) {
        return AlertDialog(
          title: const Text('Save Failed'),
          actions: [
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }
}
