

import '../../Entitie/post/post_entity.dart';
import '../../repositores/firebase_repository.dart';

class CreatePostUseCase {
  final FirebaseRepository repository;

  CreatePostUseCase({required this.repository});

  Future<void> call(PostEntity post) {
    return repository.createPost(post);
  }
}