part of 'notifications_bloc.dart';

class NotificationsState extends Equatable {
  const NotificationsState({
    this.notificationList = const [],
    this.status = FormStatus.pure,
    this.messageStatus = '',
    this.total = 0,
    this.unread = 0,
  });

  final List<NotificationItem> notificationList;
  final FormStatus status;
  final String messageStatus;
  final int total;
  final int unread;

  NotificationsState copyWith({
    List<NotificationItem> notificationList,
    FormStatus status,
    String messageStatus,
    int total,
    int unread,
  }) {
    return NotificationsState(
      notificationList: notificationList ?? this.notificationList,
      status: status ?? this.status,
      messageStatus: messageStatus ?? this.messageStatus,
      total: total ?? this.total,
      unread: unread ?? this.unread,
    );
  }

  @override
  List<Object> get props =>
      [notificationList, status, messageStatus, total, unread];
}
