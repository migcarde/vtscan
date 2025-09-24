import 'package:domain/base/base.dart';
import 'package:domain/repositories/folder_path/folder_path_repository.dart';
import 'package:domain/repositories/folder_path/models/folder_path_entity.dart';
import 'package:result/result.dart';

class GetFolderPaths implements BaseUseCase<List<FolderPathEntity>, NoParams> {
  final FolderPathRepository repository;

  GetFolderPaths({
    required this.repository,
  });

  @override
  Future<Result<List<FolderPathEntity>>> call(NoParams params) async =>
      await repository.getFolderPaths();
}
