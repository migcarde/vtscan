import 'dart:io';

import 'package:domain/repositories/virus_total/virus_total_repository.dart';
import 'package:remote/remote/virus_total/virus_total_remote_datasource.dart';
import 'package:result/result.dart';

class VirusTotalRepositoryImpl implements VirusTotalRepository {
  final VirusTotalRemoteDataSource dataSource;

  const VirusTotalRepositoryImpl({required this.dataSource});

  @override
  Future<Result<String>> postFile(File file) async {
    try {
      final result = await dataSource.getFileReport(file);

      return Result.success(result.data?.id ?? '');
    } catch (e) {
      return Result.failure(Exception(e));
    }
  }
}
