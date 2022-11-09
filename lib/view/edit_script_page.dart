import 'package:botc_helper/view/select_character_page.dart';
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

final scriptProvider = RestorableProvider<RestorableScriptData>(
  (ref) => throw UnimplementedError(),
  restorationId: 'script_provider',
);

final characterIdListProvider = RestorableProvider<RestorableSet<String>>(
  (ref) => throw UnimplementedError(),
  restorationId: 'character_id_list_provider',
);

const characterTypes = [
  CharacterType.townsfolk,
  CharacterType.outsider,
  CharacterType.minion,
  CharacterType.demon,
  CharacterType.fabled,
];

final characterListProvider = StreamProvider((ref) {
  final db = ref.watch(dbProvider);
  final characterIdList = ref.watch(characterIdListProvider).value;
  return db
      .listCharacters(
        where: (character) => character.id.isIn(characterIdList),
        orderBy: (character) => drift.OrderBy([
          drift.OrderingTerm.asc(character.position),
        ]),
      )
      .watch()
      .map((e) => e.groupListsBy((e) => e.type))
      .map((data) => characterTypes.map((e) => MapEntry(e, data[e] ?? [])));
}, dependencies: [
  dbProvider,
  characterIdListProvider,
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

class EditScriptPage extends ConsumerStatefulWidget {
  const EditScriptPage({super.key});

  static Route<void> route(BuildContext context, Object? arguments) {
    final args = EditScriptArguments.fromJson((arguments as Map).cast());
    return MaterialPageRoute(builder: (context) {
      return EditScriptPage.withOverrides(args);
    });
  }

  static Widget withOverrides(EditScriptArguments args) => RestorableProviderScope(
        restorationId: 'edit_script_scope',
        restorableOverrides: [
          scriptProvider.overrideWithRestorable(RestorableScriptData(args.script)),
          characterIdListProvider.overrideWithRestorable(RestorableSet(args.characterIdList)),
        ],
        child: const EditScriptPage(),
      );

  @override
  EditScriptPageState createState() => EditScriptPageState();
}

class EditScriptPageState extends ConsumerState<EditScriptPage> with RestorationMixin {
  late RestorableRouteFuture<Iterable<String>?> selectCharacterRouteFuture;

  @override
  void initState() {
    super.initState();

    selectCharacterRouteFuture = RestorableRouteFuture(
      onPresent: (navigator, arguments) => navigator.restorablePush(
        SelectCharacterPage.route,
        arguments: arguments,
      ),
      onComplete: (result) {
        if (result == null) return;

        final characterIdList = ref.read(characterIdListProvider);
        characterIdList.value = result;
      },
    );
  }

  @override
  String restorationId = 'edit_script_page';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(selectCharacterRouteFuture, 'selectCharacterRouteFuture');
  }

  @override
  Widget build(BuildContext context) {
    final characterList = ref.watch(characterListProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Script'),
        actions: const [
          ImportButton(),
          SaveButton(),
        ],
      ),
      body: AsyncValueBuilder(
        value: characterList,
        data: (data) => CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(child: ScriptNameField()),
            for (final characterByType in data)
              SliverStickyHeader(
                header: HeaderListTile.titleCount(
                  title: characterByType.key.title,
                  count: characterByType.value.length,
                ),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () => selectCharacterRouteFuture.present(SelectCharacterArgument(
          script: null,
          characterIdList: ref.read(characterIdListProvider).value,
          invert: false,
        ).toJson()),
        child: const Icon(Icons.edit),
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
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
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
    return ListTile(
      leading: character.image(
        width: 48,
        height: 48,
      ),
      title: Text(character.name),
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
          TextButton(
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
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }
}
