part of 'change_password_bloc.dart';

abstract class ChangePasswordEvent extends Equatable {
  const ChangePasswordEvent();

  @override
  List<Object> get props => [];
}

class OldPasswordChanged extends ChangePasswordEvent {
  final String password;

  const OldPasswordChanged({@required this.password});

  @override
  List<Object> get props => [password];
}

class OldPasswordVisibleChanged extends ChangePasswordEvent {
  final bool isVisible;

  const OldPasswordVisibleChanged({@required this.isVisible});

  @override
  List<Object> get props => [isVisible];
}

class NewPasswordChanged extends ChangePasswordEvent {
  final String password;

  const NewPasswordChanged({@required this.password});

  @override
  List<Object> get props => [password];
}

class NewPasswordVisibleChanged extends ChangePasswordEvent {
  final bool isVisible;

  const NewPasswordVisibleChanged({@required this.isVisible});

  @override
  List<Object> get props => [isVisible];
}

class NewConfirmPasswordChanged extends ChangePasswordEvent {
  final String confirmPassword;

  const NewConfirmPasswordChanged({@required this.confirmPassword});

  @override
  List<Object> get props => [confirmPassword];
}

class NewConfirmPasswordVisibleChanged extends ChangePasswordEvent {
  final bool isVisible;

  const NewConfirmPasswordVisibleChanged({@required this.isVisible});

  @override
  List<Object> get props => [isVisible];
}

class ChangePasswordSubmitted extends ChangePasswordEvent {}
