import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../Entitie/user_entity.dart';
import '../../uses-cases/user_usecases/get_users.dart';
import '../../uses-cases/user_usecases/update_user.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final UpdateUserUseCase updateUserUseCase;
  final GetUsersUseCase getUsersUseCase;

  UserCubit({ required this.updateUserUseCase, required this.getUsersUseCase}) : super(UserInitial());

  Future<void> getUsers({required UserEntity user}) async {
    emit(UserLoading());
    try {
      final streamResponse = getUsersUseCase.call(user);
      streamResponse.listen((users) {
        emit(UserLoaded(users: users));
      });
    } on SocketException catch(_) {
      emit(UserFailure());
    } catch (_) {
      emit(UserFailure());
    }
  }

  Future<void> updateUser({required UserEntity user}) async {
    try {
      await updateUserUseCase.call(user);
    } on SocketException catch(_) {
      emit(UserFailure());
    } catch (_) {
      emit(UserFailure());
    }
  }


}