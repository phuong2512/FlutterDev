import 'package:province/addressInfo.dart';
class UserInfo {
  String? name;
  String? email;
  String? phoneNumber;
  String? birthDate;
  AddressInfo? address;


  UserInfo(
      {this.name, this.email, this.phoneNumber, this.birthDate, this.address});

  Map<String, dynamic> toMap() {
    return {
      'name': this.name,
      'email': this.email,
      'phoneNumber': this.phoneNumber,
      'birthDate': this.birthDate,
      'address': this.address
    };
  }

  factory UserInfo.fromMap(Map<String, dynamic> map) {
    return UserInfo(
      name: map['name'] != null ? map['name'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      phoneNumber: map['phoneNumber'] != null
          ? map['phoneNumber'] as String
          : null,
      birthDate: map['birthDate'] != null ? map['birthDate'] as String : null,
      address: map['address'] != null ? AddressInfo.fromMap(
          map['address'] as Map<String, dynamic>) : null,
    );
  }
}
