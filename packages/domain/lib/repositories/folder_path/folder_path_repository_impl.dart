import 'package:domain/repositories/folder_path/folder_path_repository.dart';
import 'package:domain/repositories/folder_path/models/folder_path_entity.dart';
import 'package:local/local/folder_path/folder_path_local_datasource.dart';
import 'package:local/local/folder_path/models/folder_path_local_entity.dart';
import 'package:result/result.dart';

class FolderPathRepositoryImpl implements FolderPathRepository {
  final FolderPathLocalDatasource localDatasource;

  FolderPathRepositoryImpl({
    required this.localDatasource,
  });

  @override
  Future<Result<void>> deleteFolderPath(int id) async {
    try {
      await localDatasource.deleteFolderPath(id);

      return Result.success(null);
    } catch (e) {
      return Result.failure(e);
    }
  }

  @override
  Future<Result<List<FolderPathEntity>>> getFolderPaths() async {
    try {
      final localEntities = await localDatasource.getFolderPaths();

      return Result.success(localEntities.map((e) => e.entity).toList());
    } catch (e) {
      return Result.failure(e);
    }
  }

  @override
  Future<Result<void>> saveFolderPath(String folderPath) async {
    try {
      await localDatasource.saveFolderPath(
        FolderPathLocalEntity(
          path: folderPath,
        ),
      );

      return Result.success(null);
    } catch (e) {
      return Result.failure(e);
    }
  }
}
