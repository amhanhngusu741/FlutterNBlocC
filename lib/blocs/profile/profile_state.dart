part of 'profile_bloc.dart';

class ProfileState extends Equatable {
  ProfileState({
    this.accountId,
    this.createDate,
    this.companyName = '',
    this.primaryUser = '',
    this.messageStatus = '',
    this.status = FormStatus.pure,
  });
  final int accountId;
  final DateTime createDate;
  final String companyName;
  final String primaryUser;
  final FormStatus status;
  final String messageStatus;
  ProfileState copyWith({
    int accountId,
    DateTime createDate,
    String companyName,
    String primaryUser,
    FormStatus status,
    String messageStatus,
  }) {
    return ProfileState(
      accountId: accountId ?? this.accountId,
      createDate: createDate ?? this.createDate,
      companyName: companyName ?? this.companyName,
      primaryUser: primaryUser ?? this.primaryUser,
      status: status ?? this.status,
      messageStatus: messageStatus ?? this.messageStatus,
    );
  }

  @override
  List<Object> get props =>
      [accountId, createDate, companyName, primaryUser, status, messageStatus];
}
