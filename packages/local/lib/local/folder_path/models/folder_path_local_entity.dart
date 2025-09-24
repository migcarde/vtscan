import 'package:objectbox/objectbox.dart';

@Entity()
class FolderPathLocalEntity {
  @Id()
  int id;
  String path;

  FolderPathLocalEntity({
    this.id = 0,
    required this.path,
  });
}
