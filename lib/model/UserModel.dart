import 'dart:core';

class UserModel {
  String? userName;
  String? email;
  String? profileImage;


  UserModel({required this.userName, required this.email, required this.profileImage});


  factory UserModel.fromMap(Map<String, dynamic> map){
    return UserModel(userName: map['name'],
        email: map['email'],
        profileImage: map['profileImage']);
  }


}