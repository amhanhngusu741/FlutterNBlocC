part of 'verify_code_bloc.dart';

class VerifyCodeState extends Equatable {
  const VerifyCodeState({
    this.otp = '',
    this.status = FormStatus.pure,
    this.messageStatus = '',
  });

  final String otp;
  final FormStatus status;
  final String messageStatus;

  VerifyCodeState copyWith({
    String otp,
    FormStatus status,
    String messageStatus,
  }) {
    return VerifyCodeState(
      otp: otp ?? this.otp,
      status: status ?? this.status,
      messageStatus: messageStatus ?? this.messageStatus,
    );
  }

  @override
  List<Object> get props => [otp, status, messageStatus];
}
