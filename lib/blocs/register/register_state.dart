part of 'register_bloc.dart';

class RegisterState extends Equatable {
  RegisterState({
    this.firstName = '',
    this.isFirstNameValid = false,
    this.lastName = '',
    this.isLastNameValid = false,
    this.email = '',
    this.phone = '',
    this.status = FormStatus.pure,
    this.isEmailValid = false,
    this.password = '',
    this.isPasswordValid = false,
    this.confirmPassword = '',
    this.isConfirmPasswordValid = false,
    this.messageStatus = '',
    this.activateCode = '',
    this.referralCode = '',
  });
  final String firstName;
  final bool isFirstNameValid;
  final String lastName;
  final bool isLastNameValid;
  final String email;
  final String phone;
  final FormStatus status;
  final bool isEmailValid;
  final String password;
  final bool isPasswordValid;
  final String confirmPassword;
  final bool isConfirmPasswordValid;
  final String messageStatus;
  final String activateCode;
  final String referralCode;
  RegisterState copyWith({
    String firstName,
    String lastName,
    String email,
    String phone,
    FormStatus status,
    bool isEmailValid,
    String password,
    bool isPasswordValid,
    String confirmPassword,
    bool isConfirmPasswordValid,
    String messageStatus,
    bool isFirstNameValid,
    bool isLastNameValid,
    String activateCode,
    String referralCode,
  }) {
    return RegisterState(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      isEmailValid: isEmailValid ?? this.isEmailValid,
      status: status ?? this.status,
      password: password ?? this.password,
      isPasswordValid: isPasswordValid ?? this.isPasswordValid,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      isConfirmPasswordValid:
          isConfirmPasswordValid ?? this.isConfirmPasswordValid,
      messageStatus: messageStatus ?? this.messageStatus,
      isFirstNameValid: isFirstNameValid ?? this.isFirstNameValid,
      isLastNameValid: isLastNameValid ?? this.isLastNameValid,
      activateCode: activateCode ?? this.activateCode,
      referralCode: referralCode ?? this.referralCode,
    );
  }

  @override
  List<Object> get props => [
        firstName,
        lastName,
        email,
        phone,
        isEmailValid,
        status,
        password,
        isPasswordValid,
        confirmPassword,
        isConfirmPasswordValid,
        messageStatus,
        isFirstNameValid,
        isLastNameValid,
        activateCode,
        referralCode,
      ];
}
