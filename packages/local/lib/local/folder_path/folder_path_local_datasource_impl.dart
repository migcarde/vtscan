import 'package:local/local/core/object_box/object_box.dart';
import 'package:local/local/folder_path/folder_path_local_datasource.dart';
import 'package:local/local/folder_path/models/folder_path_local_entity.dart';

class FolderPathLocalDatasourceImpl extends FolderPathLocalDatasource {
  final ObjectBox objectBox;

  @override
  void build() {}

  FolderPathLocalDatasourceImpl({
    required this.objectBox,
  }) : super();

  @override
  Future<void> saveFolderPath(FolderPathLocalEntity folderPath) async =>
      await objectBox.save(folderPath);

  @override
  Future<void> deleteFolderPath(int id) async =>
      await objectBox.remove<FolderPathLocalEntity>(id);

  @override
  Future<List<FolderPathLocalEntity>> getFolderPaths() async =>
      await objectBox.getAll<FolderPathLocalEntity>();
}
