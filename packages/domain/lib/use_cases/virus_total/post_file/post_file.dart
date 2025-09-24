import 'dart:io';

import 'package:domain/base/base_use_case.dart';
import 'package:domain/repositories/virus_total/virus_total_repository.dart';
import 'package:result/result.dart';

class PostFile implements BaseUseCase<String, File> {
  const PostFile({required this.repository});

  final VirusTotalRepository repository;

  @override
  Future<Result<String>> call(File params) async =>
      await repository.postFile(params);
}
