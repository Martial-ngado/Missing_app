import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import '../Entitie/user_entity.dart';

class UserModel extends UserEntity {
  final String? uid;
  final String? username;
  final String? phone;
  final String? email;
  final String? password;
  final String? otherUid;

  UserModel({
    this.uid,
    this.username,
    this.phone,
    this.password,
    this.email,
    this.otherUid,
    // le mot de passe ne sera pas enregistre dans la base de donnes
  }) : super(
    uid : uid,
    email : email,
    username : username,
    phone : phone,


  );

  factory UserModel.fromSnapshot(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return UserModel(
      uid: snapshot['uid'],
      username: snapshot['username'],
      phone: snapshot['phone'],
      email: snapshot['email'],


    );
  }

  Map<String, dynamic> toJson() {
    return {
      "uid": uid,
      "username": username,
      "email" : email,
      "phone": phone,

    };
  }


}
