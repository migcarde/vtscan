import 'package:domain/repositories/folder_path/models/folder_path_entity.dart';
import 'package:result/result.dart';

abstract class FolderPathRepository {
  Future<Result<void>> saveFolderPath(String folderPath);
  Future<Result<void>> deleteFolderPath(int id);
  Future<Result<List<FolderPathEntity>>> getFolderPaths();
}
