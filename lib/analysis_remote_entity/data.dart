class Data {
  String? type;
  String? id;

  Data({this.type, this.id});

  factory Data.fromJson(Map<String, dynamic> json) =>
      Data(type: json['type'] as String?, id: json['id'] as String?);

  Map<String, dynamic> toJson() => {'type': type, 'id': id};
}
