import 'package:json_annotation/json_annotation.dart';

part 'analysis_remote_entity.g.dart';

@JsonSerializable()
class AnalysisRemoteEntity {
  const AnalysisRemoteEntity({this.data});

  final AnalysisDataRemoteEntity? data;

  factory AnalysisRemoteEntity.fromJson(Map<String, dynamic> json) =>
      _$AnalysisRemoteEntityFromJson(json);
}

@JsonSerializable()
class AnalysisDataRemoteEntity {
  const AnalysisDataRemoteEntity({this.id, this.type});

  final String? id;
  final String? type;

  factory AnalysisDataRemoteEntity.fromJson(Map<String, dynamic> json) =>
      _$AnalysisDataRemoteEntityFromJson(json);
}
