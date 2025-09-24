import 'package:equatable/equatable.dart';
import 'package:local/local.dart';

class FolderPathEntity extends Equatable {
  final int id;
  final String path;

  const FolderPathEntity({
    required this.id,
    required this.path,
  });

  @override
  List<Object?> get props => [id, path];

  FolderPathLocalEntity get localEntity => FolderPathLocalEntity(
        id: id,
        path: path,
      );
}

extension FolderPathEntityExtensions on FolderPathLocalEntity {
  FolderPathEntity get entity => FolderPathEntity(
        id: id,
        path: path,
      );
}
