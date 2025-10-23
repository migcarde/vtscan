import 'package:objectbox/objectbox.dart';
import 'package:riverpod/riverpod.dart';

abstract class ObjectBox extends StateNotifier<Store?> {
  ObjectBox() : super(null);

  Future<void> init();
  Future<void> save<T>(T localEntity);
  Future<List<T>> getAll<T>();
  Future<T?> get<T>(int id);
  Future<void> removeAll<T>();
  Future<void> remove<T>(int id);
}
