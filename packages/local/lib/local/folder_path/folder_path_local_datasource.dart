import 'package:local/local/folder_path/models/folder_path_local_entity.dart';
import 'package:riverpod/riverpod.dart';

abstract class FolderPathLocalDatasource extends Notifier {
  Future<void> saveFolderPath(FolderPathLocalEntity folderPath);
  Future<void> deleteFolderPath(int id);
  Future<List<FolderPathLocalEntity>> getFolderPaths();
}
