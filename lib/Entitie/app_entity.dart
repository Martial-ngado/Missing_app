

import 'package:missing/Entitie/user_entity.dart';

class AppEntity {

  final UserEntity? currentUser;
  //final PostEntity? postEntity;

  final String? uid;
  final String? postId;

  AppEntity({this.currentUser,  this.uid, this.postId});
}