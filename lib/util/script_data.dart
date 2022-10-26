import 'dart:convert';
import 'dart:io';

import 'package:collection/collection.dart';
import 'package:file_picker/file_picker.dart';

const metaId = '_meta';

class ScriptImportData {
  const ScriptImportData(this.name, this.characterIdList);

  factory ScriptImportData.fromJson(List<dynamic> json, String filename) {
    final meta = json.firstWhereOrNull((e) => e['id'] == metaId) as Map?;
    final name = meta?['name'] as String?;
    final characterIdList = json.map((e) => e['id'] as String).where((e) => e != metaId);
    return ScriptImportData(name ?? filename, characterIdList);
  }

  final String name;
  final Iterable<String> characterIdList;

  List<dynamic> toJson() => [
        {
          'id': '_meta',
          'name': name,
        },
        for (final characterId in characterIdList)
          {
            'id': characterId,
          }
      ];
}

Future<ScriptImportData> importScriptData(PlatformFile file) async {
  final data = jsonDecode(await File(file.path!).readAsString()) as List;
  final filename = file.name.substring(0, file.name.length - (file.extension?.length ?? -1) - 1);
  return ScriptImportData.fromJson(data, filename);
}

Future<void> exportScriptData(String path, ScriptImportData data) async {
  await File(path).writeAsString(jsonEncode(data.toJson()));
}
