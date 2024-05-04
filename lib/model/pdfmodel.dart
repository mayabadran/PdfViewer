import 'dart:convert';

import 'package:pdf/model/resultmodel.dart';

class PdfModel extends ResultModel {
String name;
dynamic page;
num id;
String key;
  PdfModel({
    required this.name,
    required this.page,
    required this.id,
    required this.key,
  });


  PdfModel copyWith({
    String? name,
    dynamic? page,
    num? id,
    String? key,
  }) {
    return PdfModel(
      name: name ?? this.name,
      page: page ?? this.page,
      id: id ?? this.id,
      key: key ?? this.key,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'name': name});
    result.addAll({'page': page});
    result.addAll({'id': id});
    result.addAll({'key': key});
  
    return result;
  }

  factory PdfModel.fromMap(Map<String, dynamic> map) {
    return PdfModel(
      name: map['name'] ?? '',
      page: map['page'] ?? null,
      id: map['id'] ?? 0,
      key: map['key'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory PdfModel.fromJson(String source) => PdfModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PdfModel(name: $name, page: $page, id: $id, key: $key)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is PdfModel &&
      other.name == name &&
      other.page == page &&
      other.id == id &&
      other.key == key;
  }

  @override
  int get hashCode {
    return name.hashCode ^
      page.hashCode ^
      id.hashCode ^
      key.hashCode;
  }
}
