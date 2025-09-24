import 'package:domain/repositories/folder_path/models/folder_path_entity.dart';
import 'package:equatable/equatable.dart';

enum HomeToastState {
  none,
  saveFolderSuccess,
  saveFolderFailure,
  deleteFolderSuccess,
  deleteFolderFailure,
}

class HomeViewModel extends Equatable {
  final List<FolderPathEntity> folderPaths;
  final HomeToastState toastState;

  const HomeViewModel({
    this.folderPaths = const [],
    this.toastState = HomeToastState.none,
  });

  @override
  List<Object?> get props => [folderPaths, toastState];

  HomeViewModel copyWith({
    List<FolderPathEntity>? folderPaths,
    HomeToastState? toastState,
  }) {
    return HomeViewModel(
      folderPaths: folderPaths ?? this.folderPaths,
      toastState: toastState ?? this.toastState,
    );
  }
}
