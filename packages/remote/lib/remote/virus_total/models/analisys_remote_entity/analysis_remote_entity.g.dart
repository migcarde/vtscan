// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'analysis_remote_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnalysisRemoteEntity _$AnalysisRemoteEntityFromJson(
  Map<String, dynamic> json,
) => AnalysisRemoteEntity(
  data: json['data'] == null
      ? null
      : AnalysisDataRemoteEntity.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$AnalysisRemoteEntityToJson(
  AnalysisRemoteEntity instance,
) => <String, dynamic>{'data': instance.data};

AnalysisDataRemoteEntity _$AnalysisDataRemoteEntityFromJson(
  Map<String, dynamic> json,
) => AnalysisDataRemoteEntity(
  id: json['id'] as String?,
  type: json['type'] as String?,
);

Map<String, dynamic> _$AnalysisDataRemoteEntityToJson(
  AnalysisDataRemoteEntity instance,
) => <String, dynamic>{'id': instance.id, 'type': instance.type};
