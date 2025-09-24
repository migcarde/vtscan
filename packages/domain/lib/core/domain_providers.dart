import 'package:domain/domain.dart';
import 'package:domain/repositories/folder_path/folder_path_repository.dart';
import 'package:domain/repositories/folder_path/folder_path_repository_impl.dart';
import 'package:domain/repositories/virus_total/virus_total_repository.dart';
import 'package:domain/repositories/virus_total/virus_total_repository_impl.dart';
import 'package:domain/use_cases/folder_path/get_folder_paths.dart';
import 'package:domain/use_cases/virus_total/post_file/post_file.dart';
import 'package:local/local/core/local_providers.dart';
import 'package:riverpod/riverpod.dart';
import 'package:remote/remote.dart';

final _folderPathRepositoryProvider = Provider<FolderPathRepository>((ref) {
  final localDatasource = ref.watch(folderPathLocalDatasourceProvider);

  return FolderPathRepositoryImpl(localDatasource: localDatasource);
});

final getFolderPathsProvider = Provider<GetFolderPaths>(
  (ref) => GetFolderPaths(
    repository: ref.read(_folderPathRepositoryProvider),
  ),
);

final saveFolderPathProvider = Provider<SaveFolderPath>(
  (ref) => SaveFolderPath(
    repository: ref.read(
      _folderPathRepositoryProvider,
    ),
  ),
);

final deleteFolderPathProvider = Provider<DeleteFolderPath>(
  (ref) => DeleteFolderPath(
    repository: ref.read(
      _folderPathRepositoryProvider,
    ),
  ),
);

final _virusTotalRepositoryProvider = Provider<VirusTotalRepository>((ref) {
  final remoteDataSource = ref.read(
    virusTotalRemoteDataSourceProvider(
      Domain.instance.apiKey,
    ),
  );

  return VirusTotalRepositoryImpl(dataSource: remoteDataSource);
});

final postFile = Provider<PostFile>(
  (ref) => PostFile(
    repository: ref.read(_virusTotalRepositoryProvider),
  ),
);
