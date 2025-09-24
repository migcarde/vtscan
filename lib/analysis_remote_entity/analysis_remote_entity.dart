import 'data.dart';

class AnalysisRemoteEntity {
  Data? data;

  AnalysisRemoteEntity({this.data});

  factory AnalysisRemoteEntity.fromJson(Map<String, dynamic> json) {
    return AnalysisRemoteEntity(
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {'data': data?.toJson()};
}
