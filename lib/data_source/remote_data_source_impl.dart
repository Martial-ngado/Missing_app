
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:missing/data_source/remote_data_source.dart';

import 'package:uuid/uuid.dart';

import '../Entitie/post/post_entity.dart';
import '../Entitie/user_entity.dart';
import '../const.dart';
import '../models/post_model.dart';
import '../models/user_model.dart';


class FirebaseRemoteDataSourceImpl implements FirebaseRemoteDataSource {
  final FirebaseFirestore firebaseFirestore;
  final FirebaseAuth firebaseAuth;
  final FirebaseStorage firebaseStorage;

  FirebaseRemoteDataSourceImpl({required this.firebaseStorage, required this.firebaseFirestore, required this.firebaseAuth});

  Future<void> createUserWithImage(UserEntity user, String profileUrl) async {
    final userCollection = firebaseFirestore.collection(FirebaseConst.users);

    final uid = await getCurrentUid();

    userCollection.doc(uid).get().then((userDoc) {
      final newUser = UserModel(
          uid: uid,

          email: user.email,
          username: user.username,


      ).toJson();

      if (!userDoc.exists) {
        userCollection.doc(uid).set(newUser);
      } else {
        userCollection.doc(uid).update(newUser);
      }
    }).catchError((error) {
      toast("Some error occur");
    });
  }

  @override
  Future<void> createUser(UserEntity user) async {
    final userCollection = firebaseFirestore.collection(FirebaseConst.users);

    final uid = await getCurrentUid();

    userCollection.doc(uid).get().then((userDoc) {
      final newUser = UserModel(
          uid: uid,

          email: user.email,


          username: user.username,
          phone: user.phone,

      ).toJson();

      if (!userDoc.exists) {
        userCollection.doc(uid).set(newUser);
      } else {
        userCollection.doc(uid).update(newUser);
      }
    }).catchError((error) {
      toast("Some error occur");
    });
  }

  @override
  Future<String> getCurrentUid() async => firebaseAuth.currentUser!.uid;


  @override
  Stream<List<UserEntity>> getSingleUser(String uid) {
    final userCollection = firebaseFirestore.collection(FirebaseConst.users).where("uid", isEqualTo: uid).limit(1);
    return userCollection.snapshots().map((querySnapshot) => querySnapshot.docs.map((e) => UserModel.fromSnapshot(e)).toList());
  }

  @override
  Stream<List<UserEntity>> getUsers(UserEntity user) {
    final userCollection = firebaseFirestore.collection(FirebaseConst.users);
    return userCollection.snapshots().map((querySnapshot) => querySnapshot.docs.map((e) => UserModel.fromSnapshot(e)).toList());
  }

  @override
  Future<bool> isSignIn() async => firebaseAuth.currentUser?.uid != null;

  @override
  Future<void> signInUser(UserEntity user)async {
    try {
      if (user.email!.isNotEmpty || user.password!.isNotEmpty) {
        await firebaseAuth.signInWithEmailAndPassword(email: user.email!, password: user.password!);
      } else {
        print("fields cannot be empty");
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        toast("user not found");
      } else if (e.code == "wrong-password") {
        toast("Invalid email or password");
      }
    }
  }

  @override
  Future<void> signOut() async {
    await firebaseAuth.signOut();
  }

  @override
  Future<void> signUpUser(UserEntity user) async {
    try {
      await firebaseAuth.createUserWithEmailAndPassword(email: user.email!, password: user.password!).then((currentUser) async{
        if (currentUser.user?.uid != null) {

        }
      });
      return;
    }
    on FirebaseAuthException catch (e) {
      if (e.code == "email-already-in-use") {
        toast("email is already taken");
      } else {
        toast("something went wrong");
      }
    }
  }

  @override
  Future<void> updateUser(UserEntity user) async {
    final userCollection = firebaseFirestore.collection(FirebaseConst.users);
    Map<String, dynamic> userInformation = Map();

    if (user.username != "" && user.username != null) userInformation['username'] = user.username;
    if (user.email != "" && user.email != null) userInformation['profileUrl'] = user.email;

    if (user.phone != "" && user.phone != null) userInformation['phone'] = user.phone;

    if (user.uid != "" && user.uid != null) userInformation['uid'] = user.uid;




    userCollection.doc(user.uid).update(userInformation);

  }

  @override
  Future<String> uploadImageToStorage(File? file, bool isPost, String childName) async {

    Reference ref = firebaseStorage.ref().child(childName).child(firebaseAuth.currentUser!.uid);

    if (isPost) {
      String id = Uuid().v1();
      ref = ref.child(id);
    }

    final uploadTask = ref.putFile(file!);

    final imageUrl = (await uploadTask.whenComplete(() {})).ref.getDownloadURL();

    return await imageUrl;
  }
  @override
  Future<void> createPost(PostEntity post) async {
    final postCollection = firebaseFirestore.collection(FirebaseConst.posts);

    final newPost = PostModel(
        userProfileUrl: post.userProfileUrl,
        username: post.username,

        totalComments: 0,
        postImageUrl: post.postImageUrl,
        postId: post.postId,

        description: post.description,
        creatorUid: post.creatorUid,
        createAt: post.createAt
    ).toJson();

    try {

      final postDocRef = await postCollection.doc(post.postId).get();

      if (!postDocRef.exists) {
        postCollection.doc(post.postId).set(newPost).then((value) {
          final userCollection = firebaseFirestore.collection(FirebaseConst.users).doc(post.creatorUid);

          userCollection.get().then((value) {
            if (value.exists) {
              final totalPosts = value.get('totalPosts');
              userCollection.update({"totalPosts": totalPosts + 1});
              return;
            }
          });
        });
      } else {
        postCollection.doc(post.postId).update(newPost);
      }
    }catch (e) {
      print("some error occured $e");
    }
  }

  @override
  Future<void> deletePost(PostEntity post) async {
    final postCollection = firebaseFirestore.collection(FirebaseConst.posts);

    try {
      postCollection.doc(post.postId).delete().then((value) {
        final userCollection = firebaseFirestore.collection(FirebaseConst.users).doc(post.creatorUid);

        userCollection.get().then((value) {
          if (value.exists) {
            final totalPosts = value.get('totalPosts');
            userCollection.update({"totalPosts": totalPosts - 1});
            return;
          }
        });
      });
    } catch (e) {
      print("some error occured $e");
    }
  }



  @override
  Stream<List<PostEntity>> readPosts(PostEntity post) {
    final postCollection = firebaseFirestore.collection(FirebaseConst.posts).orderBy("createAt", descending: true);
    return postCollection.snapshots().map((querySnapshot) => querySnapshot.docs.map((e) => PostModel.fromSnapshot(e)).toList());
  }

  @override
  Stream<List<PostEntity>> readSinglePost(String postId) {
    final postCollection = firebaseFirestore.collection(FirebaseConst.posts).orderBy("createAt", descending: true).where("postId", isEqualTo: postId);
    return postCollection.snapshots().map((querySnapshot) => querySnapshot.docs.map((e) => PostModel.fromSnapshot(e)).toList());
  }

  @override
  Future<void> updatePost(PostEntity post) async {
    final postCollection = firebaseFirestore.collection(FirebaseConst.posts);
    Map<String, dynamic> postInfo = Map();

    if (post.description != "" && post.description != null) postInfo['description'] = post.description;
    if (post.postImageUrl != "" && post.postImageUrl != null) postInfo['postImageUrl'] = post.postImageUrl;

    postCollection.doc(post.postId).update(postInfo);
  }



































  @override
  Stream<List<UserEntity>> getSingleOtherUser(String otherUid) {
    final userCollection = firebaseFirestore.collection(FirebaseConst.users).where("uid", isEqualTo: otherUid).limit(1);
    return userCollection.snapshots().map((querySnapshot) => querySnapshot.docs.map((e) => UserModel.fromSnapshot(e)).toList());
  }



}