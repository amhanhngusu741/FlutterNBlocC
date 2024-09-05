import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:childcaresoftware/constants/form_status.dart';
import 'package:childcaresoftware/models/models.dart';
import 'package:childcaresoftware/repositories/repositories.dart';
import 'package:childcaresoftware/service_locator.dart';

part 'notifications_event.dart';
part 'notifications_state.dart';

class NotificationsBloc extends Bloc<NotificationsEvent, NotificationsState> {
  NotificationsBloc() : super(NotificationsState());

  @override
  Stream<NotificationsState> mapEventToState(
    NotificationsEvent event,
  ) async* {
    if (event is NotificationsStarted) {
      yield* _mapNotificationsStartedToState(event, state);
    }
    if (event is NotificationsMarkAsRead) {
      yield* _mapNotificationsMarkAsRead(event, state);
    }
  }

  Stream<NotificationsState> _mapNotificationsStartedToState(
    NotificationsStarted event,
    NotificationsState state,
  ) async* {
    yield state.copyWith(status: FormStatus.submissionInProgress);
    try {
      final NotificationsResponse result =
          await locator<NotificationRepository>().getNotificationList();
      yield state.copyWith(
        status: FormStatus.submissionSuccess,
        notificationList: List.from(result.items),
        total: result.total,
        unread: result.unread,
      );
    } on APIException catch (e) {
      yield state.copyWith(
          status: FormStatus.submissionFailure, messageStatus: e.error);
    } catch (e) {
      yield state.copyWith(
          status: FormStatus.submissionFailure,
          messageStatus: "An error occurred. Please try again!");
    }
  }

  Stream<NotificationsState> _mapNotificationsMarkAsRead(
    NotificationsMarkAsRead event,
    NotificationsState state,
  ) async* {
    try {
      await locator<NotificationRepository>()
          .putNotificationMarkAsRead(event.id);
      final newNotifcationList = [...state.notificationList];
      if (event.id == -1) {
        newNotifcationList.map((item) {
          item.read = 1;
          return item;
        }).toList();
      } else {
        newNotifcationList.map((item) {
          if (item.id == event.id) {
            item.read = 1;
          }
          return item;
        }).toList();
      }

      yield state.copyWith(
        status: FormStatus.submissionSuccess,
        notificationList: newNotifcationList,
        unread: event.id == -1 ? 0 : state.unread - 1,
      );
    } on APIException catch (e) {
      yield state.copyWith(
          status: FormStatus.submissionFailure, messageStatus: e.error);
    } catch (e) {
      yield state.copyWith(
          status: FormStatus.submissionFailure,
          messageStatus: "An error occurred. Please try again!");
    }
  }
}
