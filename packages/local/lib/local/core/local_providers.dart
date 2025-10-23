import 'package:local/local/core/object_box/object_box.dart';
import 'package:local/local/core/object_box/object_box_impl.dart';
import 'package:local/local/folder_path/folder_path_local_datasource.dart';
import 'package:local/local/folder_path/folder_path_local_datasource_impl.dart';
import 'package:objectbox/objectbox.dart';
import 'package:riverpod/riverpod.dart';

final objectBoxProvider = StateNotifierProvider<ObjectBox, Store?>(
  (ref) => ObjectBoxImpl(),
);

final folderPathLocalDatasourceProvider =
    Provider<FolderPathLocalDatasource>((ref) {
  final objectBox = ref.watch(objectBoxProvider.notifier);
  objectBox.init();

  return FolderPathLocalDatasourceImpl(objectBox: objectBox);
});
