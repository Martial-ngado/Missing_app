
import 'dart:io';


import '../Entitie/post/post_entity.dart';
import '../Entitie/user_entity.dart';
import '../data_source/remote_data_source.dart';
import 'firebase_repository.dart';

class FirebaseRepositoryImpl implements FirebaseRepository {
  final FirebaseRemoteDataSource remoteDataSource;

  FirebaseRepositoryImpl({required this.remoteDataSource});

  @override
  Future<void> createUser(UserEntity user) async => remoteDataSource.createUser(user);

  @override
  Future<String> getCurrentUid() async => remoteDataSource.getCurrentUid();

  @override
  Stream<List<UserEntity>> getSingleUser(String uid) => remoteDataSource.getSingleUser(uid);

  @override
  Stream<List<UserEntity>> getUsers(UserEntity user) => remoteDataSource.getUsers(user);

  @override
  Future<bool> isSignIn() async => remoteDataSource.isSignIn();

  @override
  Future<void> signInUser(UserEntity user) async =>remoteDataSource.signInUser(user);

  @override
  Future<void> signOut() async => remoteDataSource.signOut();

  @override
  Future<void> signUpUser(UserEntity user) async => remoteDataSource.signUpUser(user);

  @override
  Future<void> updateUser(UserEntity user) async => remoteDataSource.updateUser(user);
  @override
  Stream<List<UserEntity>> getSingleOtherUser(String otherUid) => remoteDataSource.getSingleOtherUser(otherUid);
  
  
  //post implementation
  @override
  Future<void> createPost(PostEntity post) async => remoteDataSource.createPost(post);
  @override
  Future<void> deletePost(PostEntity post) async => remoteDataSource.deletePost(post);

 

  @override
  Stream<List<PostEntity>> readPosts(PostEntity post) => remoteDataSource.readPosts(post);


  @override
  Future<void> updatePost(PostEntity post) async => remoteDataSource.updatePost(post);

  @override
  Stream<List<PostEntity>> readSinglePost(String postId) => remoteDataSource.readSinglePost(postId);



}