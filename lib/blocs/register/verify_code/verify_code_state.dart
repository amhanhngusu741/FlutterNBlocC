part of 'verify_code_bloc.dart';

class VerifyCodeRegisterState extends Equatable {
  const VerifyCodeRegisterState({
    this.otp = '',
    this.status = FormStatus.pure,
    this.messageStatus = '',
  });

  final String otp;
  final FormStatus status;
  final String messageStatus;

  VerifyCodeRegisterState copyWith({
    String otp,
    String email,
    FormStatus status,
    String messageStatus,
  }) {
    return VerifyCodeRegisterState(
      otp: otp ?? this.otp,
      status: status ?? this.status,
      messageStatus: messageStatus ?? this.messageStatus,
    );
  }

  @override
  List<Object> get props => [otp, status, messageStatus];
}
