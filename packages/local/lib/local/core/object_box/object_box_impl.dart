import 'dart:async';

import 'package:local/local/core/object_box/object_box.dart';
import 'package:local/objectbox.g.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

class ObjectBoxImpl extends ObjectBox {
  ObjectBoxImpl() : super();

  static const _database = 'voice_diary';

  @override
  Future<void> init() async {
    final docs = await getApplicationDocumentsDirectory();
    final openedStore = await openStore(
      directory: p.join(docs.path, _database),
    );

    state = openedStore;
  }

  @override
  Future<void> save<T>(T localEntity) async {
    final box = state?.box<T>();

    await box?.putAsync(localEntity);
  }

  @override
  Future<List<T>> getAll<T>() async {
    final box = state?.box<T>();
    final result = await box?.getAllAsync();

    return result ?? [];
  }

  @override
  Future<void> removeAll<T>() async {
    final box = state?.box<T>();

    await box?.removeAllAsync();
  }

  @override
  Future<T?> get<T>(int id) async {
    final box = state?.box<T>();
    final result = await box?.getAsync(id);

    return result;
  }

  @override
  Future<void> remove<T>(int id) async {
    final box = state?.box<T>();

    await box?.removeAsync(id);
  }
}
