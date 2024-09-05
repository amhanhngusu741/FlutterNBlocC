part of 'new_password_bloc.dart';

abstract class NewPasswordEvent extends Equatable {
  const NewPasswordEvent();

  @override
  List<Object> get props => [];
}

class NewPasswordChanged extends NewPasswordEvent {
  final String password;

  const NewPasswordChanged({@required this.password});

  @override
  List<Object> get props => [password];
}

class NewPasswordVisibleChanged extends NewPasswordEvent {
  final bool isVisible;

  const NewPasswordVisibleChanged({@required this.isVisible});

  @override
  List<Object> get props => [isVisible];
}

class NewConfirmPasswordChanged extends NewPasswordEvent {
  final String confirmPassword;

  const NewConfirmPasswordChanged({@required this.confirmPassword});

  @override
  List<Object> get props => [confirmPassword];
}

class NewConfirmPasswordVisibleChanged extends NewPasswordEvent {
  final bool isVisible;

  const NewConfirmPasswordVisibleChanged({@required this.isVisible});

  @override
  List<Object> get props => [isVisible];
}

class NewPasswordSubmitted extends NewPasswordEvent {}
