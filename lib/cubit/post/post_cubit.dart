import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../Entitie/post/post_entity.dart';
import '../../uses-cases/post_usecases/create_post.dart';
import '../../uses-cases/post_usecases/delete_post.dart';
import '../../uses-cases/post_usecases/read_post.dart';
import '../../uses-cases/post_usecases/update_post.dart';

part 'post_state.dart';

class PostCubit extends Cubit<PostState> {
  final CreatePostUseCase createPostUseCase;
  final DeletePostUseCase deletePostUseCase;

  final ReadPostsUseCase readPostUseCase;
  final UpdatePostUseCase updatePostUseCase;
  PostCubit({
    required this.updatePostUseCase,
    required this.deletePostUseCase,

    required this.createPostUseCase,
    required this.readPostUseCase
  }) : super(PostInitial());

  Future<void> getPosts({required PostEntity post}) async {
    emit(PostLoading());
    try {
      final streamResponse = readPostUseCase.call(post);
      streamResponse.listen((posts) {
        emit(PostLoaded(posts: posts));
      });
    } on SocketException catch(_) {
      emit(PostFailure());
    } catch (_) {
      emit(PostFailure());
    }
  }



  Future<void> deletePost({required PostEntity post}) async {
    try {
      await deletePostUseCase.call(post);
    } on SocketException catch(_) {
      emit(PostFailure());
    } catch (_) {
      emit(PostFailure());
    }
  }

  Future<void> createPost({required PostEntity post}) async {
    try {
      await createPostUseCase.call(post);
    } on SocketException catch(_) {
      emit(PostFailure());
    } catch (_) {
      emit(PostFailure());
    }
  }

  Future<void> updatePost({required PostEntity post}) async {
    try {
      await updatePostUseCase.call(post);
    } on SocketException catch(_) {
      emit(PostFailure());
    } catch (_) {
      emit(PostFailure());
    }
  }
}