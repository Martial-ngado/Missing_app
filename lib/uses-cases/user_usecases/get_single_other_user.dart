
import '../../Entitie/user_entity.dart';
import '../../repositores/firebase_repository.dart';

class GetSingleOtherUserUseCase {
  final FirebaseRepository repository;

  GetSingleOtherUserUseCase({required this.repository});

  Stream<List<UserEntity>> call(String otherUid) {
    return repository.getSingleOtherUser(otherUid);
  }
}