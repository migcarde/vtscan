import 'package:domain/base/base_use_case.dart';
import 'package:domain/repositories/folder_path/folder_path_repository.dart';
import 'package:result/result.dart';

class SaveFolderPath extends BaseUseCase<void, String> {
  final FolderPathRepository repository;

  SaveFolderPath({
    required this.repository,
  });

  @override
  Future<Result<void>> call(String params) async =>
      repository.saveFolderPath(params);
}
