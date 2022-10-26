// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ProductModel {
  String name;
  String category;
  String img;
  int price;
  String color;
  String size;
  String brand;
  String details;
  ProductModel({
    required this.name,
    required this.category,
    required this.img,
    required this.price,
    required this.color,
    required this.size,
    required this.brand,
    required this.details,
  });

  ProductModel copyWith({
    String? name,
    String? category,
    String? img,
    int? price,
    String? color,
    String? size,
    String? brand,
    String? details,
  }) {
    return ProductModel(
      name: name ?? this.name,
      category: category ?? this.category,
      img: img ?? this.img,
      price: price ?? this.price,
      color: color ?? this.color,
      size: size ?? this.size,
      brand: brand ?? this.brand,
      details: details ?? this.details,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'category': category,
      'img': img,
      'price': price,
      'color': color,
      'size': size,
      'brand': brand,
      'details': details,
    };
  }

  factory ProductModel.fromMap(map) {
    return ProductModel(
      name: map['name'] as String,
      category: map['category'] as String,
      img: map['img'] as String,
      price: map['price'] as int,
      color: map['color'] as String,
      size: map['size'] as String,
      brand: map['brand'] as String,
      details: map['details'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'product_model(name: $name, category: $category, img: $img, price: $price, color: $color, size: $size, brand: $brand, details: $details)';
  }

  @override
  bool operator ==(covariant ProductModel other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.category == category &&
        other.img == img &&
        other.price == price &&
        other.color == color &&
        other.size == size &&
        other.brand == brand &&
        other.details == details;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        category.hashCode ^
        img.hashCode ^
        price.hashCode ^
        color.hashCode ^
        size.hashCode ^
        brand.hashCode ^
        details.hashCode;
  }
}
