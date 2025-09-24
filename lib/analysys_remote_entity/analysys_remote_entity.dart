import 'package:equatable/equatable.dart';

import 'data.dart';

class AnalysysRemoteEntity extends Equatable {
  final Data? data;

  const AnalysysRemoteEntity({this.data});

  factory AnalysysRemoteEntity.fromJson(Map<String, dynamic> json) {
    return AnalysysRemoteEntity(
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {'data': data?.toJson()};

  @override
  List<Object?> get props => [data];
}
