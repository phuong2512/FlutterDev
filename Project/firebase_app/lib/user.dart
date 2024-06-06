import 'dart:convert';

class User {
  String name;
  int age;
  String email;

  User({required this.name, required this.age, required this.email});

  @override
  String toString() {
    return 'User{name: $name, age: $age, email: $email}';
  }

  Map<String, dynamic> toMap() {
    return {
      'name': this.name,
      'age': this.age,
      'email': this.email,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      name: map['name'] as String,
      age: map['age'] as int,
      email: map['email'] as String,
    );
  }

  User copyWith({
    String? name,
    int? age,
    String? email,
  }) {
    return User(
      name: name ?? this.name,
      age: age ?? this.age,
      email: email ?? this.email,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is User &&
              runtimeType == other.runtimeType &&
              name == other.name &&
              age == other.age &&
              email == other.email;

  @override
  int get hashCode => name.hashCode ^ age.hashCode ^ email.hashCode;

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json["name"],
      age: int.parse(json["age"]),
      email: json["email"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": this.name,
      "age": this.age,
      "email": this.email,
    };
  }
}
