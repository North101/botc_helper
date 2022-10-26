import 'dart:io';
import 'dart:isolate';

import 'package:drift/drift.dart';
import 'package:drift/isolate.dart';
import 'package:drift/native.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/db/database.dart';

Future<DriftIsolate> _createDriftIsolate(Future<File> future) async {
  final filename = await future;
  final receivePort = ReceivePort();

  await Isolate.spawn(
    _startBackground,
    _IsolateStartRequest(receivePort.sendPort, filename),
  );
  return await receivePort.first as DriftIsolate;
}

void _startBackground(_IsolateStartRequest request) {
  final executor = NativeDatabase(
    request.filename,
  );
  final driftIsolate = DriftIsolate.inCurrent(
    () => DatabaseConnection(executor),
  );
  request.sendDriftIsolate.send(driftIsolate);
}

class _IsolateStartRequest {
  const _IsolateStartRequest(this.sendDriftIsolate, this.filename);

  final SendPort sendDriftIsolate;
  final File filename;
}

DatabaseConnection _createDriftIsolateAndConnect(Future<File> future) {
  return DatabaseConnection.delayed(() async {
    final isolate = await _createDriftIsolate(future);
    return await isolate.connect();
  }());
}

final dbProvider = Provider<Database>((ref) {
  final filename = Database.dbFilename();
  final db = Database.connect(DatabaseConnection.delayed(_createDriftIsolateAndConnect(filename)));
  ref.onDispose(db.close);
  return db;
});
