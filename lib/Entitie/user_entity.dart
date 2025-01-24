
import 'dart:io';

import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String? uid;
  final String? username;
  final String? email;
  final String? phone;


  // will not going to store in DB

  final String? password;
  final String? otherUid;

  UserEntity({
        this.password,
        this.otherUid,
        this.email,
      this.phone,
      this.uid,
    this.username,

  });

  @override
  List<Object?> get props => [
    uid,
    username,
    email,
    password,
    otherUid,
    phone,


  ];
}