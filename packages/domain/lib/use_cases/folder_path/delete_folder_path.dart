import 'package:domain/domain.dart';
import 'package:domain/repositories/folder_path/folder_path_repository.dart';
import 'package:result/result.dart';

class DeleteFolderPath implements BaseUseCase<void, int> {
  final FolderPathRepository repository;

  DeleteFolderPath({
    required this.repository,
  });

  @override
  Future<Result<void>> call(int params) async =>
      repository.deleteFolderPath(params);
}
