import 'dart:io';

import 'package:remote/remote/virus_total/models/analisys_remote_entity/analysis_remote_entity.dart';
import 'package:remote/remote/virus_total/virus_total_api.dart';
import 'package:remote/remote/virus_total/virus_total_remote_datasource.dart';

class VirusTotalRemoteDatasourceImpl implements VirusTotalRemoteDataSource {
  final VirusTotalApi api;

  VirusTotalRemoteDatasourceImpl(this.api);

  @override
  Future<AnalysisRemoteEntity> getFileReport(File file) {
    return api.postFile(file);
  }
}
