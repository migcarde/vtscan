import 'package:local/local/core/object_box/object_box.dart';
import 'package:local/local/core/object_box/object_box_impl.dart';
import 'package:local/local/folder_path/folder_path_local_datasource.dart';
import 'package:local/local/folder_path/folder_path_local_datasource_impl.dart';
import 'package:objectbox/objectbox.dart';
import 'package:riverpod/riverpod.dart';

final _objectBoxProviderImpl = AsyncNotifierProvider<ObjectBoxImpl, Store>(
  () => ObjectBoxImpl(),
);

final objectBoxProvider =
    Provider<ObjectBox>((ref) => ref.watch(_objectBoxProviderImpl.notifier));

final folderPathLocalDatasourceProvider =
    Provider<FolderPathLocalDatasource>((ref) {
  final objectBox = ref.watch(objectBoxProvider);

  return FolderPathLocalDatasourceImpl(objectBox: objectBox);
});
