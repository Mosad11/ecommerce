import 'dart:convert';

import 'package:ecommerce/models/cart_product_model.dart';
import 'package:flutter/foundation.dart';

class OrderModel {
  String deliveryType;
  String address;
  bool isDeliverd;
  List<CartProductModel> products;
  String userId;
  OrderModel({
    required this.deliveryType,
    required this.address,
    required this.isDeliverd,
    required this.products,
    required this.userId,
  });

  OrderModel copyWith({
    String? deliveryType,
    String? address,
    bool? isDelverd,
    List<CartProductModel>? prudcts,
    String? userId,
  }) {
    return OrderModel(
      deliveryType: deliveryType ?? this.deliveryType,
      address: address ?? this.address,
      isDeliverd: isDelverd ?? this.isDeliverd,
      products: prudcts ?? this.products,
      userId: userId ?? this.userId,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'deliveryType': deliveryType,
      'address': address,
      'isDelverd': isDeliverd,
      'prudcts': products.map((x) => x.toMap()).toList(),
      'userId': userId,
    };
  }

  factory OrderModel.fromMap(map) {
    return OrderModel(
      deliveryType: map['deliveryType'] ?? '',
      address: map['address'] ?? '',
      isDeliverd: map['isDelverd'] ?? false,
      products: List<CartProductModel>.from(
          map['prudcts']?.map((x) => CartProductModel.fromMap(x))),
      userId: map['userId'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderModel.fromJson(String source) =>
      OrderModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'OrderModel(deliveryType: $deliveryType, address: $address, isDelverd: $isDeliverd, prudcts: $products, userId: $userId)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is OrderModel &&
        other.deliveryType == deliveryType &&
        other.address == address &&
        other.isDeliverd == isDeliverd &&
        listEquals(other.products, products) &&
        other.userId == userId;
  }

  @override
  int get hashCode {
    return deliveryType.hashCode ^
        address.hashCode ^
        isDeliverd.hashCode ^
        products.hashCode ^
        userId.hashCode;
  }
}
