
import '../../Entitie/post/post_entity.dart';
import '../../repositores/firebase_repository.dart';

class UpdatePostUseCase {
  final FirebaseRepository repository;

  UpdatePostUseCase({required this.repository});

  Future<void> call(PostEntity post) {
    return repository.updatePost(post);
  }
}