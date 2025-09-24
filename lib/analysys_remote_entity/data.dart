import 'package:equatable/equatable.dart';

class Data extends Equatable {
  final String? type;
  final String? id;

  const Data({this.type, this.id});

  factory Data.fromJson(Map<String, dynamic> json) =>
      Data(type: json['type'] as String?, id: json['id'] as String?);

  Map<String, dynamic> toJson() => {'type': type, 'id': id};

  @override
  List<Object?> get props => [type, id];
}
