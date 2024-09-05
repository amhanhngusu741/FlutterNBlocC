part of 'notifications_bloc.dart';

abstract class NotificationsEvent extends Equatable {
  const NotificationsEvent();

  @override
  List<Object> get props => [];
}

class NotificationsStarted extends NotificationsEvent {}

class NotificationsMarkAsRead extends NotificationsEvent {
  final int id;
  const NotificationsMarkAsRead({@required this.id});

  @override
  List<Object> get props => [id];
}
