part of 'verify_code_bloc.dart';

abstract class VerifyCodeEvent extends Equatable {
  const VerifyCodeEvent();
  @override
  List<Object> get props => [];
}

class VerifyCodeOTPChanged extends VerifyCodeEvent {
  final String otp;

  const VerifyCodeOTPChanged({@required this.otp});

  @override
  List<Object> get props => [otp];
}

class VerifyCodeSubmitted extends VerifyCodeEvent {}
