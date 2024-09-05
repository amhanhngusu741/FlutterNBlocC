part of 'login_bloc.dart';

class LoginState extends Equatable {
  const LoginState({
    this.email = '',
    this.password = '',
    this.isPasswordVisible = true,
    this.status = FormStatus.pure,
    this.messageStatus = '',
    this.isTeacher = false,
  });

  final String email;
  final String password;
  final bool isPasswordVisible;
  final FormStatus status;
  final String messageStatus;
  final bool isTeacher;

  LoginState copyWith({
    String email,
    bool isEmailValid,
    String password,
    bool isPasswordValid,
    bool isPasswordVisible,
    FormStatus status,
    String messageStatus,
    bool isTeacher,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
      status: status ?? this.status,
      messageStatus: messageStatus ?? this.messageStatus,
      isTeacher: isTeacher ?? this.isTeacher,
    );
  }

  @override
  List<Object> get props =>
      [email, password, isPasswordVisible, status, messageStatus, isTeacher];
}
