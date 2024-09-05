part of 'forgot_password_bloc.dart';

class ForgotPasswordState extends Equatable {
  const ForgotPasswordState({
    this.email = '',
    this.status = FormStatus.pure,
    this.messageStatus = '',
  });

  final email;
  final FormStatus status;
  final String messageStatus;

  ForgotPasswordState copyWith({
    String email,
    FormStatus status,
    String messageStatus,
  }) {
    return ForgotPasswordState(
      email: email ?? this.email,
      status: status ?? this.status,
      messageStatus: messageStatus ?? this.messageStatus,
    );
  }

  @override
  List<Object> get props => [email, status, messageStatus];
}
