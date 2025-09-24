import 'dart:io';

import 'package:remote/remote/virus_total/models/analisys_remote_entity/analysis_remote_entity.dart';

abstract class VirusTotalRemoteDataSource {
  Future<AnalysisRemoteEntity> getFileReport(File file);
}
