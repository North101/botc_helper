import 'package:collection/collection.dart';
import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_restorable/flutter_riverpod_restorable.dart';

import '/db/database.dart';
import '/providers.dart';
import '/view/async_value_builder.dart';
import '/view/edit_script_page.dart';
import '/view/character_grid.dart';
import '/view/character_page.dart';

final currentTabProvider = RestorableProvider<RestorableInt>(
  (ref) => throw UnimplementedError(),
  restorationId: 'currentTabProvider',
);

final scriptIdProvider = Provider<String>((ref) => throw UnimplementedError());

final scriptProvider = StreamProvider<ScriptData>((ref) {
  final db = ref.watch(dbProvider);
  final scriptId = ref.watch(scriptIdProvider);
  return db.listScripts(where: (script) => script.id.equals(scriptId)).watchSingle();
}, dependencies: [
  dbProvider,
  scriptIdProvider,
]);

final characterListProvider = StreamProvider((ref) {
  final db = ref.watch(dbProvider);
  final scriptId = ref.watch(scriptIdProvider);
  return db
      .listScriptCharacter(where: (script, scriptCharacter, character) => script.id.equals(scriptId))
      .watch()
      .map((e) => e.groupListsBy((e) => e.type).entries.toList());
}, dependencies: [
  dbProvider,
  scriptIdProvider,
]);

final nightListProvider = StreamProvider.family.autoDispose<List<CharacterData>, bool>((ref, state) {
  final db = ref.watch(dbProvider);
  final scriptId = ref.watch(scriptIdProvider);
  nightColumn(Character character) => state ? character.firstNight : character.otherNight;
  return db
      .listCharacters(
        where: (character) =>
            (character.id.isInQuery(db.selectOnly(db.scriptCharacter)
                  ..addColumns([db.scriptCharacter.characterId])
                  ..where(db.scriptCharacter.scriptId.equals(scriptId))) |
                character.type.equalsValue(CharacterType.info)) &
            nightColumn(character).isNotNull(),
        orderBy: (character) => drift.OrderBy([
          drift.OrderingTerm.asc(
            nightColumn(character),
          )
        ]),
      )
      .watch();
}, dependencies: [
  dbProvider,
  scriptIdProvider,
]);

class RestorableSet<E> extends RestorableValue<Set<E>> {
  RestorableSet(this._defaultValue);

  final Set<E> _defaultValue;

  @override
  Set<E> createDefaultValue() => _defaultValue;

  @override
  void didUpdateValue(Set<E>? oldValue) => notifyListeners();

  @override
  Set<E> fromPrimitives(Object? data) => (data as List).toSet().cast();

  @override
  Object? toPrimitives() => value.toList();
}

final firstNightSelectedProvider = RestorableProvider<RestorableSet<String>>(
  (ref) => throw UnimplementedError(),
  restorationId: 'firstNightSelectedProvider',
);

final otherNightSelectedProvider = RestorableProvider<RestorableSet<String>>(
  (ref) => throw UnimplementedError(),
  restorationId: 'otherNightSelectedProvider',
);

class ScriptPage extends ConsumerStatefulWidget {
  const ScriptPage({super.key});

  static Route<void> route(BuildContext context, Object? args) {
    return MaterialPageRoute(builder: (context) {
      return ScriptPage.withOverrides(
        scriptId: args as String,
      );
    });
  }

  static withOverrides({
    required String scriptId,
  }) =>
      RestorableProviderScope(
        restorationId: 'script_page',
        overrides: [
          scriptIdProvider.overrideWithValue(scriptId),
        ],
        restorableOverrides: [
          currentTabProvider.overrideWithRestorable(RestorableInt(0)),
          firstNightSelectedProvider.overrideWithRestorable(RestorableSet({})),
          otherNightSelectedProvider.overrideWithRestorable(RestorableSet({})),
        ],
        child: const ScriptPage(),
      );

  @override
  ScriptPageState createState() => ScriptPageState();
}

class ScriptPageState extends ConsumerState<ScriptPage> with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();

    final currentTab = ref.read(currentTabProvider);
    tabController = TabController(
      initialIndex: currentTab.value,
      length: 3,
      vsync: this,
    );
    tabController.addListener(() {
      currentTab.value = tabController.index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentTab = ref.watch(currentTabProvider).value;
    final script = ref.watch(scriptProvider);
    return AsyncValueBuilder(
      value: script,
      data: (script) => Scaffold(
        appBar: AppBar(
          title: Text(script.name),
          bottom: TabBar(
            controller: tabController,
            tabs: const [
              Tab(text: 'First Night'),
              Tab(text: 'Other Night'),
              Tab(text: 'Characters'),
            ],
          ),
          actions: [
            if (script.custom) const EditButton(),
            if (script.custom) const DeleteButton(),
            if (currentTab == 0) const SelectButton(firstNight: true),
            if (currentTab == 1) const SelectButton(firstNight: false),
          ],
        ),
        body: TabBarView(
          controller: tabController,
          children: const [
            NightView(firstNight: true),
            NightView(firstNight: false),
            CharacterListView(),
          ],
        ),
      ),
    );
  }
}

class EditButton extends ConsumerWidget {
  const EditButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
      tooltip: 'Edit',
      onPressed: () async {
        final navigator = Navigator.of(context);
        final script = await ref.read(scriptProvider.future);
        final characterList = await ref.read(characterListProvider.future);
        navigator.restorablePush(
          EditScriptPage.route,
          arguments: EditScriptArguments(
            script: script,
            characterIdList: characterList.map((e) => e.value).flattened.map((e) => e.id).toSet(),
          ).toJson(),
        );
      },
      icon: const Icon(Icons.edit),
    );
  }
}

class DeleteButton extends ConsumerWidget {
  const DeleteButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
      tooltip: 'Delete',
      onPressed: () async {
        final navigator = Navigator.of(context);
        final scope = ProviderScope.containerOf(context);
        final delete = await showDialog<bool>(
          context: context,
          builder: (context) => ProviderScope(
            parent: scope,
            child: const ConfirmDeleteScriptDialog(),
          ),
        );
        if (delete != true) return;

        final result = await showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => ProviderScope(
            parent: scope,
            child: const DeleteScriptDialog(),
          ),
        );
        if (result == null) return;

        navigator.pop();
      },
      icon: const Icon(Icons.delete),
    );
  }
}

class ConfirmDeleteScriptDialog extends ConsumerWidget {
  const ConfirmDeleteScriptDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final script = ref.watch(scriptProvider);
    return script.when(
      data: (data) => AlertDialog(
        title: const Text('Delete?'),
        content: Text('Are you sure you want to delete ${data.name}?'),
        actions: [
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Delete'),
          ),
        ],
      ),
      loading: () => AlertDialog(
        title: const Text('Delete?'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Center(child: CircularProgressIndicator()),
          ],
        ),
      ),
      error: (error, stackTrace) => AlertDialog(
        title: const Text('Unable to Delete'),
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

final deleteScriptProvider = FutureProvider.autoDispose((ref) async {
  final db = ref.read(dbProvider);
  final script = await ref.read(scriptProvider.future);
  await db.deleteScript(script);
}, dependencies: [
  dbProvider,
  scriptProvider.future,
]);

class DeleteScriptDialog extends ConsumerWidget {
  const DeleteScriptDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deleteScript = ref.watch(deleteScriptProvider);
    ref.listen(deleteScriptProvider, (previous, next) {
      next.whenData((value) => Navigator.of(context).pop(true));
    });
    return deleteScript.maybeWhen(
      error: (error, stackTrace) => AlertDialog(
        title: const Text('Delete Failed'),
        actions: [
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Close'),
          ),
        ],
      ),
      orElse: () => AlertDialog(
        title: const Text('Deleting...'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Center(child: CircularProgressIndicator()),
          ],
        ),
      ),
    );
  }
}

class SelectButton extends ConsumerWidget {
  const SelectButton({
    required this.firstNight,
    super.key,
  });

  final bool firstNight;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedProvider = firstNight ? firstNightSelectedProvider : otherNightSelectedProvider;
    final hasSelected = ref.watch(selectedProvider.select((value) => value.value.isNotEmpty));
    if (hasSelected) {
      return IconButton(
        tooltip: 'Select None',
        onPressed: () async {
          final nightSelected = ref.read(selectedProvider);
          nightSelected.value = {};
        },
        icon: const Icon(Icons.deselect),
      );
    }

    return IconButton(
      tooltip: 'Select All',
      onPressed: () async {
        final characterList = await ref.read(nightListProvider(firstNight).future);
        final nightSelected = ref.read(selectedProvider);
        nightSelected.value = characterList.map((e) => e.id).toSet();
      },
      icon: const Icon(Icons.select_all),
    );
  }
}

class NightView extends ConsumerWidget {
  const NightView({
    required this.firstNight,
    super.key,
  });

  final bool firstNight;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = ref.watch(nightListProvider(firstNight));
    return AsyncValueBuilder(
      value: items,
      data: (data) => ListView.separated(
        padding: const EdgeInsets.only(top: 8),
        itemBuilder: (context, index) => CharacterNightTile(
          firstNight: firstNight,
          character: data[index],
        ),
        separatorBuilder: (context, index) => const Divider(),
        itemCount: data.length,
      ),
    );
  }
}

class CharacterNightTile extends ConsumerWidget {
  const CharacterNightTile({
    required this.firstNight,
    required this.character,
    super.key,
  });

  final bool firstNight;
  final CharacterData character;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nightSelectedProvider = firstNight ? firstNightSelectedProvider : otherNightSelectedProvider;
    final selected = ref.watch(nightSelectedProvider.select((value) {
      return value.value.contains(character.id);
    }));
    return ListTile(
      leading: character.image(
        width: 48,
        height: 48,
      ),
      title: Text(character.name),
      subtitle: Text(firstNight ? character.firstNightReminder : character.otherNightReminder),
      trailing: Checkbox(
        value: selected,
        onChanged: (value) {
          final selectedItems = ref.read(nightSelectedProvider);
          selectedItems.value = {
            ...selectedItems.value.whereNot((e) => e == character.id),
            if (value == true) character.id,
          };
        },
      ),
      onTap: character.type != CharacterType.info
          ? () {
              final script = ref.read(scriptProvider).value!;
              Navigator.of(context).restorablePush(
                CharacterPage.route,
                arguments: CharacterPageArgument(
                  script: script,
                  character: character,
                ).toJson(),
              );
            }
          : null,
    );
  }
}

class CharacterListView extends ConsumerWidget {
  const CharacterListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final characterList = ref.watch(characterListProvider);
    return AsyncValueBuilder<List<MapEntry<CharacterType, List<CharacterData>>>>(
      value: characterList,
      data: (data) => CharacterGrid(
        data: data,
        onTap: (character) {
          final script = ref.read(scriptProvider).value!;
          Navigator.of(context).restorablePush(
            CharacterPage.route,
            arguments: CharacterPageArgument(
              script: script,
              character: character,
            ).toJson(),
          );
        },
      ),
    );
  }
}
