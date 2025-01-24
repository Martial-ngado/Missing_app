part of 'auth_cubit.dart';

abstract class AuthStates extends Equatable {
  const AuthStates();
}

class AuthInitial extends AuthStates {
  @override
  List<Object> get props => [];
}

class Authenticated extends AuthStates {
  final String uid;

  Authenticated({required this.uid});
  @override
  List<Object> get props => [uid];
}

class UnAuthenticated extends AuthStates {
  @override
  List<Object> get props => [];
}