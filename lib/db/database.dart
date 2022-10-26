import 'dart:io';

import 'package:drift/drift.dart';
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
import '/db/types/character_option.dart';
import '/db/types/character_type.dart';

export '/db/types/character_option.dart';
export '/db/types/character_type.dart';

part 'database.g.dart';

@DriftDatabase(include: {
  'sql/character_option.drift',
  'sql/character.drift',
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
  int schemaVersion = 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (m) async {
          await transaction(() async {
            await m.createAll();
            await initDatabase(this).onError((error, stackTrace) {
              print(stackTrace);
              print(error);
            });
          });
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

  Future<ScriptData> upsertScript(ScriptData script, Set<String> characterIdList) async {
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
        for (final characterId in characterIdList)
          ScriptCharacterCompanion.insert(
            scriptId: script.id,
            characterId: characterId,
          ),
      ]);
    });
    return script;
  }
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
      errorBuilder: errorBuilder ??
          (context, error, stacktrace) => SizedBox(
                width: width,
                height: height,
              ),
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
