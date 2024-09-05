part of 'verify_code_bloc.dart';

abstract class VerifyCodeRegisterEvent extends Equatable {
  const VerifyCodeRegisterEvent();
  @override
  List<Object> get props => [];
}

class VerifyCodeRegisterOTPChanged extends VerifyCodeRegisterEvent {
  final String otp;

  const VerifyCodeRegisterOTPChanged({@required this.otp});

  @override
  List<Object> get props => [otp];
}

class VerifyCodeRegisterSubmitted extends VerifyCodeRegisterEvent {}
