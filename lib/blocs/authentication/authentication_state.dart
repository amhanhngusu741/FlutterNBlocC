part of 'authentication_bloc.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();
  @override
  List<Object> get props => [];
}

class Uninitialized extends AuthenticationState {}

class Authenticated extends AuthenticationState {
  // final String displayName;

  const Authenticated();

  @override
  List<Object> get props => [];
}

class Unauthenticated extends AuthenticationState {
  const Unauthenticated({
    this.isFirstTime = false,
  });

  final bool isFirstTime;

  @override
  List<Object> get props => [isFirstTime];
}
