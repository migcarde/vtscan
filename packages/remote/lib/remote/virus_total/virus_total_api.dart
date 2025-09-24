import 'dart:io';

import 'package:dio/dio.dart';
import 'package:remote/remote/virus_total/models/analisys_remote_entity/analysis_remote_entity.dart';
import 'package:retrofit/retrofit.dart';

part 'virus_total_api.g.dart';

@RestApi(baseUrl: 'https://www.virustotal.com/api/v3/')
abstract class VirusTotalApi {
  factory VirusTotalApi(Dio dio, {String baseUrl}) = _VirusTotalApi;

  @POST('/files')
  @MultiPart()
  Future<AnalysisRemoteEntity> postFile(@Part(name: 'file') File file);

  @GET('analyses/{id}')
  // TODO: Cange return type
  Future<AnalysisRemoteEntity> getAnalysis(@Path('id') String id);
}
