import 'package:domain/repositories/folder_path/models/folder_path_entity.dart';
import 'package:equatable/equatable.dart';

enum HomeStatus {
  none,
  saveFolderSuccess,
  saveFolderFailure,
  deleteFolderSuccess,
  deleteFolderFailure,
  loading,
}

class HomeViewModel extends Equatable {
  final List<FolderPathEntity> folderPaths;
  final HomeStatus status;

  const HomeViewModel({
    this.folderPaths = const [],
    this.status = HomeStatus.none,
  });

  @override
  List<Object?> get props => [folderPaths, status];

  HomeViewModel copyWith({
    List<FolderPathEntity>? folderPaths,
    HomeStatus? toastState,
  }) {
    return HomeViewModel(
      folderPaths: folderPaths ?? this.folderPaths,
      status: toastState ?? this.status,
    );
  }
}
