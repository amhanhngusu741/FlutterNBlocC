part of 'change_password_bloc.dart';

class ChangePasswordState extends Equatable {
  const ChangePasswordState({
    this.oldPassword = '',
    this.isOldPasswordVisible = true,
    this.password = '',
    this.isPasswordVisible = true,
    this.confirmPassword = '',
    this.isConfirmPasswordVisible = true,
    this.status = FormStatus.pure,
    this.messageStatus = '',
  });

  final String oldPassword;
  final bool isOldPasswordVisible;
  final String password;
  final bool isPasswordVisible;
  final String confirmPassword;
  final bool isConfirmPasswordVisible;
  final FormStatus status;
  final String messageStatus;

  ChangePasswordState copyWith({
    String oldPassword,
    bool isOldPasswordVisible,
    String password,
    bool isPasswordVisible,
    String confirmPassword,
    bool isConfirmPasswordVisible,
    FormStatus status,
    String messageStatus,
  }) {
    return ChangePasswordState(
      oldPassword: oldPassword ?? this.oldPassword,
      isOldPasswordVisible: isOldPasswordVisible ?? this.isOldPasswordVisible,
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
        oldPassword,
        isOldPasswordVisible,
        password,
        isPasswordVisible,
        confirmPassword,
        isConfirmPasswordVisible,
        status,
        messageStatus
      ];
}
