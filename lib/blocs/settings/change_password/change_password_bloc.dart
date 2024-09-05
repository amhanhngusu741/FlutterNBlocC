import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:childcaresoftware/constants/form_status.dart';
import 'package:childcaresoftware/models/models.dart';
import 'package:childcaresoftware/repositories/repositories.dart';
import 'package:childcaresoftware/service_locator.dart';

part 'change_password_event.dart';
part 'change_password_state.dart';

class ChangePasswordBloc
    extends Bloc<ChangePasswordEvent, ChangePasswordState> {
  ChangePasswordBloc() : super(ChangePasswordState());

  @override
  Stream<ChangePasswordState> mapEventToState(
    ChangePasswordEvent event,
  ) async* {
    if (event is OldPasswordChanged) {
      yield _mapOldPasswordChangedToState(event, state);
    } else if (event is OldPasswordVisibleChanged) {
      yield _mapOldPasswordVisibleChangedToState(event, state);
    } else if (event is NewPasswordChanged) {
      yield _mapNewPasswordChangedToState(event, state);
    } else if (event is NewPasswordVisibleChanged) {
      yield _mapPasswordVisibleChangedToState(event, state);
    } else if (event is NewConfirmPasswordChanged) {
      yield _mapNewConfirmPasswordChangedToState(event, state);
    } else if (event is NewConfirmPasswordVisibleChanged) {
      yield _mapConfirmPasswordVisibleChangedToState(event, state);
    } else if (event is ChangePasswordSubmitted) {
      yield* _mapChangePasswordSubmittedToState(event, state);
    }
  }

  ChangePasswordState _mapOldPasswordChangedToState(
      OldPasswordChanged event, ChangePasswordState state) {
    final oldPassword = event.password;
    return state.copyWith(
      oldPassword: oldPassword,
      status: FormStatus.pure,
    );
  }

  ChangePasswordState _mapNewPasswordChangedToState(
      NewPasswordChanged event, ChangePasswordState state) {
    final password = event.password;
    return state.copyWith(
      password: password,
      status: FormStatus.pure,
    );
  }

  ChangePasswordState _mapNewConfirmPasswordChangedToState(
      NewConfirmPasswordChanged event, ChangePasswordState state) {
    final confirmPassword = event.confirmPassword;
    return state.copyWith(
      confirmPassword: confirmPassword,
      status: FormStatus.pure,
    );
  }

  Stream<ChangePasswordState> _mapChangePasswordSubmittedToState(
      ChangePasswordSubmitted event, ChangePasswordState state) async* {
    yield state.copyWith(status: FormStatus.submissionInProgress);
    try {
      final result = await locator<UserRepository>().changePassword(
          state.oldPassword, state.password, state.confirmPassword);
      yield state.copyWith(status: FormStatus.submissionSuccess);
    } on APIException catch (e) {
      yield state.copyWith(
          status: FormStatus.submissionFailure, messageStatus: e.error);
    } catch (e) {
      yield state.copyWith(
          status: FormStatus.submissionFailure,
          messageStatus: "An error occurred. Please try again!");
    }
  }

  ChangePasswordState _mapOldPasswordVisibleChangedToState(
      OldPasswordVisibleChanged event, ChangePasswordState state) {
    final isOldPasswordVisible = event.isVisible;
    return state.copyWith(
      isOldPasswordVisible: isOldPasswordVisible,
      status: FormStatus.pure,
    );
  }

  ChangePasswordState _mapPasswordVisibleChangedToState(
      NewPasswordVisibleChanged event, ChangePasswordState state) {
    final isPasswordVisible = event.isVisible;
    return state.copyWith(
      isPasswordVisible: isPasswordVisible,
      status: FormStatus.pure,
    );
  }

  ChangePasswordState _mapConfirmPasswordVisibleChangedToState(
      NewConfirmPasswordVisibleChanged event, ChangePasswordState state) {
    final isConfirmPasswordVisible = event.isVisible;
    return state.copyWith(
      isConfirmPasswordVisible: isConfirmPasswordVisible,
      status: FormStatus.pure,
    );
  }
}
