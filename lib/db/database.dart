import 'dart:io';

import 'package:drift/drift.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart'
    show
        Alignment,
        AlignmentGeometry,
        Animation,
        AssetBundle,
        BlendMode,
        BoxFit,
        Color,
        FilterQuality,
        Image,
        ImageErrorWidgetBuilder,
        ImageFrameBuilder,
        ImageRepeat,
        Key,
        Rect,
        SizedBox;
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import '/db/init.dart';
import '/db/migrations/schema_v3.dart' as v3;
import '/db/migrations/schema_v5.dart' as v5;
import '/db/types/character_option.dart';
import '/db/types/character_type.dart';
import '/db/types/night_type.dart';

export '/db/types/character_alignment.dart';
export '/db/types/character_option.dart';
export '/db/types/character_type.dart';
export '/db/types/night_type.dart';

part 'database.g.dart';

@DriftDatabase(include: {
  'sql/character_night.drift',
  'sql/character_option.drift',
  'sql/character.drift',
  'sql/script_character_night.drift',
  'sql/script_character.drift',
  'sql/script.drift',
})
class Database extends _$Database {
  Database.connect(DatabaseConnection connection) : super.connect(connection);

  static Future<File> dbFilename() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    return File(p.join(dbFolder.path, 'db5.sqlite'));
  }

  static Future<FileSystemEntity> deleteDatabase() async {
    final filename = await dbFilename();
    return filename.delete();
  }

  @override
  int schemaVersion = 5;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onUpgrade: (m, from, to) async {
          if (from < 3) {
            final db = v3.DatabaseAtV3(executor);
            await m.alterTable(TableMigration(db.character));
            await m.createTable(db.characterNight);
          }
          if (from < 5) {
            final db = v5.DatabaseAtV5(executor);
            await m.drop(db.characterNight);
            await m.createTable(db.characterNight);
            await m.createTable(db.scriptCharacterNight);
          }
        },
        beforeOpen: (details) async {
          if (details.wasCreated) {
            await initDatabase(this).onError((error, stackTrace) {
              if (kDebugMode) {
                print(error);
                print(stackTrace);
              }
            });
          } else if (details.hadUpgrade) {
            if (details.versionBefore! < 5) {
              await initDatabase(this);
            }
          }
        },
      );

  Future<void> deleteScript(ScriptData script) async {
    await batch((batch) {
      batch.delete(this.script, script);
      batch.deleteWhere(scriptCharacter, (scriptCharacter) {
        return scriptCharacter.scriptId.equals(script.id);
      });
    });
  }

  Future<ScriptData> upsertScript(ScriptData script, Iterable<String> characterIdList) async {
    await batch((batch) {
      batch.insert<Script, ScriptData>(
        this.script,
        script,
        onConflict: DoUpdate((old) => script),
      );
      batch.deleteWhere<ScriptCharacter, ScriptCharacterData>(scriptCharacter, (scriptCharacter) {
        return scriptCharacter.scriptId.equals(script.id);
      });
      batch.insertAll<ScriptCharacter, ScriptCharacterData>(scriptCharacter, [
        for (final characterId in characterIdList.toSet())
          ScriptCharacterCompanion.insert(
            scriptId: script.id,
            characterId: characterId,
          ),
      ]);
    });
    return script;
  }

  BaseSelectStatement characterIdInScript(String scriptId) => selectOnly(scriptCharacter)
    ..addColumns([scriptCharacter.characterId])
    ..where(scriptCharacter.scriptId.equals(scriptId));
}

extension BatchEx on Batch {
  void deleteAll<T extends Table, D>(TableInfo<T, D> table) {
    return deleteWhere<T, D>(table, (tbl) => const Constant(true));
  }
}

extension CharacterDataEx on CharacterData {
  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      'assets/images/$id.png',
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder ?? (context, error, stacktrace) => SizedBox(width: width, height: height),
      semanticLabel: semanticLabel ?? name,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }
}

List<T> listFromJson<T>(List<dynamic> json, T Function(Map e) fromJson) =>
    json.cast<Map>().map(fromJson).toList();
List<dynamic> listToJson<T>(List<T> json, dynamic Function(T e) toJson) => json.map(toJson).toList();

T? nullableFromJson<T>(Map? json, T Function(Map json) nullableFromJson) =>
    json != null ? nullableFromJson(json) : null;
Map? nullableToJson<T>(T? value, Map Function(T value) toJson) =>
    value != null ? toJson(value) : null;

Map scriptToJson(ScriptData script) => script.toJson();
ScriptData scriptFromJson(Map json) => ScriptData.fromJson(json.cast());

Map? scriptNToJson(ScriptData? script) => nullableToJson(script, scriptToJson);
ScriptData? scriptNFromJson(Map? json) => nullableFromJson(json, scriptFromJson);

Map characterToJson(CharacterData character) => character.toJson();
CharacterData characterFromJson(Map json) => CharacterData.fromJson(json.cast());

List<dynamic> characterOptionItemListToJson(List<OptionItem> items) => listToJson(items, (e) => e.toJson());
List<OptionItem> characterOptionItemListFromJson(List json) => listFromJson(json, OptionItem.fromJson);

Map characterOptionItemToJson(CharacterOptionItem value) => value.toJson();
CharacterOptionItem characterOptionItemFromJson(Map json) => CharacterOptionItem.fromJson(json.cast());

Map? characterOptionItemNToJson(CharacterOptionItem? data) =>
    nullableToJson(data, characterOptionItemToJson);
CharacterOptionItem? characterOptionItemNFromJson(Map? json) =>
    nullableFromJson(json, characterOptionItemFromJson);

List<dynamic> scriptFilterListToJson(List<ScriptFilter> list) => listToJson(list, (e) => e.toJson());
List<ScriptFilter> scriptFilterListFromJson(List<dynamic> json) => listFromJson(json, ScriptFilter.fromJson);
