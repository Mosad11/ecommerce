// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CategoriesModel {
  String name;
  String img;
  CategoriesModel({
    required this.name,
    required this.img,
  });

  CategoriesModel copyWith({
    String? name,
    String? img,
  }) {
    return CategoriesModel(
      name: name ?? this.name,
      img: img ?? this.img,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'img': img,
    };
  }

  factory CategoriesModel.fromMap(map) {
    return CategoriesModel(
      name: map['name'] as String,
      img: map['img'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoriesModel.fromJson(String source) =>
      CategoriesModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'CategoriesModel(name: $name, img: $img)';

  @override
  bool operator ==(covariant CategoriesModel other) {
    if (identical(this, other)) return true;

    return other.name == name && other.img == img;
  }

  @override
  int get hashCode => name.hashCode ^ img.hashCode;
}
