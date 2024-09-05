part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();
  @override
  List<Object> get props => [];
}

class RegisterFirstNameChangeEvent extends RegisterEvent {
  final String firstName;
  const RegisterFirstNameChangeEvent({@required this.firstName});

  @override
  List<Object> get props => [firstName];
}

class RegisterLastNameChangeEvent extends RegisterEvent {
  final String lastName;
  const RegisterLastNameChangeEvent({@required this.lastName});

  @override
  List<Object> get props => [lastName];
}

class RegisterSubmitEvent extends RegisterEvent {
  const RegisterSubmitEvent();
}

class EmailRegisterChanged extends RegisterEvent {
  final String email;

  const EmailRegisterChanged({@required this.email});

  @override
  List<Object> get props => [email];
}

class PasswordRegisterChanged extends RegisterEvent {
  final String password;

  const PasswordRegisterChanged({@required this.password});

  @override
  List<Object> get props => [password];
}

class ConfirmPasswordRegisterChanged extends RegisterEvent {
  final String confirmPassword;
  final String password;
  const ConfirmPasswordRegisterChanged(
      {@required this.confirmPassword, @required this.password});

  @override
  List<Object> get props => [confirmPassword, password];
}

class ActivateCodeRegisterChanged extends RegisterEvent {
  final String activateCode;

  const ActivateCodeRegisterChanged({@required this.activateCode});

  @override
  List<Object> get props => [activateCode];
}

class RegisterSubmitted extends RegisterEvent {}

class ActivateSubmitted extends RegisterEvent {}

class ReferralCodeChanged extends RegisterEvent {
  final String referralCode;
  const ReferralCodeChanged({@required this.referralCode});

  @override
  List<Object> get props => [referralCode];
}

class PhoneNumberChanged extends RegisterEvent {
  final String phoneNumber;
  const PhoneNumberChanged({@required this.phoneNumber});

  @override
  List<Object> get props => [phoneNumber];
}
