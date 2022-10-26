import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:uuid/uuid.dart';

import '/db/database.dart';
import '/providers.dart';
import '/view/async_value_builder.dart';
import '/view/edit_script_page.dart';
import '/view/header_list_tile.dart';
import '/view/script_page.dart';

final scriptListProvider = StreamProvider((ref) {
  final db = ref.read(dbProvider);
  return db.listScripts().watch().map((e) => e.groupListsBy((e) => e.custom).entries.toList());
});

class MainPage extends ConsumerWidget {
  const MainPage({super.key});

  static Route<void> route(BuildContext context, Object? argument) {
    return MaterialPageRoute(builder: (context) {
      return const MainPage();
    });
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scriptList = ref.watch(scriptListProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Scripts')),
      body: AsyncValueBuilder<List<MapEntry<bool, List<ScriptData>>>>(
        value: scriptList,
        data: (data) => CustomScrollView(
          slivers: [
            for (final custom in data)
              SliverStickyHeader(
                header: HeaderListTile.title(title: custom.key ? 'Custom' : 'Official'),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) => ScriptTile(item: custom.value[index]),
                    childCount: custom.value.length,
                  ),
                ),
              )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => Navigator.of(context).restorablePush(
          EditScriptPage.route,
          arguments: EditScriptArguments(
            script: ScriptData(
              id: const Uuid().v4(),
              name: 'New Script',
              custom: true,
            ),
            characterIdList: {},
          ).toJson(),
        ),
      ),
    );
  }
}

class ScriptTile extends StatelessWidget {
  const ScriptTile({
    required this.item,
    super.key,
  });

  final ScriptData item;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(item.name),
      onTap: () => Navigator.of(context).restorablePush(
        ScriptPage.route,
        arguments: item.id,
      ),
    );
  }
}
