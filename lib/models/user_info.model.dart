import 'package:cloud_firestore/cloud_firestore.dart';

class UserInfoModel {
  final String id;
  final String password;
  final String birthday;
  final String address;
  final String postalCode;
  final String city;

  UserInfoModel({
    required this.id,
    required this.password,
    required this.birthday,
    required this.address,
    required this.postalCode,
    required this.city,
  });

  factory UserInfoModel.fromMap(Map<String, dynamic> data) {
    return UserInfoModel(
      id: data['id'],
      password: data['password'],
      birthday: data['birthday'],
      address: data['address'],
      postalCode: data['postalCode'],
      city: data['city'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'password': password,
      'birthday': birthday,
      'address': address,
      'postalCode': postalCode,
      'city': city,
    };
  }

  UserInfoModel copyWith({
    String? id,
    String? password,
    String? birthday,
    String? address,
    String? postalCode,
    String? city,
  }) {
    return UserInfoModel(
      id: id ?? this.id,
      password: password ?? this.password,
      birthday: birthday ?? this.birthday,
      address: address ?? this.address,
      postalCode: postalCode ?? this.postalCode,
      city: city ?? this.city,
    );
  }

  // ajout d'une méthode getUserInfoById qui prend en paramètre user.id et retourne l'objet userInfo correspondant dans la base de donnée users
  static Future<UserInfoModel> getUserInfoById(String id) async {
  final snapshot = await FirebaseFirestore.instance.collection('users').doc(id).get();
  if (snapshot.exists && snapshot.data() != null) {
    return UserInfoModel.fromMap(snapshot.data() as Map<String, dynamic>);
  } else {
    print('User not found');
    return UserInfoModel(id: '', password: '', birthday: '', address: '', postalCode: '', city: '');
  }
}
}