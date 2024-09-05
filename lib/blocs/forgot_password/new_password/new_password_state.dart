part of 'new_password_bloc.dart';

class NewPasswordState extends Equatable {
  const NewPasswordState({
    this.password = '',
    this.isPasswordVisible = true,
    this.confirmPassword = '',
    this.isConfirmPasswordVisible = true,
    this.status = FormStatus.pure,
    this.messageStatus = '',
  });

  final String password;
  final bool isPasswordVisible;
  final String confirmPassword;
  final bool isConfirmPasswordVisible;
  final FormStatus status;
  final String messageStatus;

  NewPasswordState copyWith({
    String password,
    bool isPasswordVisible,
    String confirmPassword,
    bool isConfirmPasswordVisible,
    FormStatus status,
    String messageStatus,
  }) {
    return NewPasswordState(
      password: password ?? this.password,
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      isConfirmPasswordVisible:
          isConfirmPasswordVisible ?? this.isConfirmPasswordVisible,
      status: status ?? this.status,
      messageStatus: messageStatus ?? this.messageStatus,
    );
  }

  @override
  List<Object> get props => [
        password,
        isPasswordVisible,
        confirmPassword,
        isConfirmPasswordVisible,
        status,
        messageStatus
      ];
}
