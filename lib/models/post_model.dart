

import 'package:cloud_firestore/cloud_firestore.dart';


import '../Entitie/post/post_entity.dart';

class PostModel extends PostEntity {

  final String? postId;
  final String? creatorUid;
  final String? username;
  final String? description;
  final String? postImageUrl;

  final num? totalComments;
  final Timestamp? createAt;
  final String? userProfileUrl;

  PostModel({
    this.postId,
    this.creatorUid,
    this.username,
    this.description,
    this.postImageUrl,

    this.totalComments,
    this.createAt,
    this.userProfileUrl,
  }) : super(
    createAt: createAt,
    creatorUid: creatorUid,
    description: description,

    postId: postId,
    postImageUrl: postImageUrl,
    totalComments: totalComments,

    username: username,
    userProfileUrl: userProfileUrl,
  );

  factory PostModel.fromSnapshot(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return PostModel(
      createAt: snapshot['createAt'],
      creatorUid: snapshot['creatorUid'],
      description: snapshot['description'],
      userProfileUrl: snapshot['userProfileUrl'],

      totalComments: snapshot['totalComments'],
      postImageUrl: snapshot['postImageUrl'],
      postId: snapshot['postId'],
      username: snapshot['username'],

    );
  }

  Map<String, dynamic> toJson() => {
    "createAt": createAt,
    "creatorUid": creatorUid,
    "description": description,
    "userProfileUrl": userProfileUrl,

    "totalComments": totalComments,
    "postImageUrl": postImageUrl,
    "postId": postId,

    "username": username,
  };
}
