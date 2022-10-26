// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class userModel {
  String id;
  String name;
  String password;
  String email;
  userModel({
    required this.id,
    required this.name,
    required this.password,
    required this.email,
  });

  userModel copyWith({
    String? id,
    String? name,
    String? password,
    String? email,
  }) {
    return userModel(
      id: id ?? this.id,
      name: name ?? this.name,
      password: password ?? this.password,
      email: email ?? this.email,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'password': password,
      'email': email,
    };
  }

  factory userModel.fromMap(map) {
    return userModel(
      id: map['id'] as String,
      name: map['name'] as String,
      password: map['password'] as String,
      email: map['email'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory userModel.fromJson(String source) =>
      userModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'userModel(id: $id, name: $name, password: $password, email: $email)';
  }

  @override
  bool operator ==(covariant userModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.password == password &&
        other.email == email;
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ password.hashCode ^ email.hashCode;
  }
}
