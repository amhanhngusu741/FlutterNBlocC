part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class EmailChanged extends LoginEvent {
  final String email;

  const EmailChanged({@required this.email});

  @override
  List<Object> get props => [email];
}

class PasswordChanged extends LoginEvent {
  final String password;

  const PasswordChanged({@required this.password});

  @override
  List<Object> get props => [password];
}

class PasswordVisibleChanged extends LoginEvent {
  final bool isVisible;

  const PasswordVisibleChanged({@required this.isVisible});

  @override
  List<Object> get props => [isVisible];
}

class LoginSubmitted extends LoginEvent {}

class IsTeacherChanged extends LoginEvent {
  final bool isTeacher;
  const IsTeacherChanged({@required this.isTeacher});

  @override
  List<Object> get props => [isTeacher];
}
