import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:childcaresoftware/constants/form_status.dart';
import 'package:childcaresoftware/models/models.dart';
import 'package:childcaresoftware/repositories/repositories.dart';
import 'package:childcaresoftware/service_locator.dart';

part 'new_password_event.dart';
part 'new_password_state.dart';

class NewPasswordBloc extends Bloc<NewPasswordEvent, NewPasswordState> {
  final email;
  NewPasswordBloc({this.email}) : super(NewPasswordState());

  @override
  Stream<NewPasswordState> mapEventToState(
    NewPasswordEvent event,
  ) async* {
    if (event is NewPasswordChanged) {
      yield _mapNewPasswordChangedToState(event, state);
    } else if (event is NewPasswordVisibleChanged) {
      yield _mapPasswordVisibleChangedToState(event, state);
    } else if (event is NewConfirmPasswordChanged) {
      yield _mapNewConfirmPasswordChangedToState(event, state);
    } else if (event is NewConfirmPasswordVisibleChanged) {
      yield _mapConfirmPasswordVisibleChangedToState(event, state);
    } else if (event is NewPasswordSubmitted) {
      yield* _mapNewPasswordSubmittedToState(event, state);
    }
  }

  NewPasswordState _mapNewPasswordChangedToState(
      NewPasswordChanged event, NewPasswordState state) {
    final password = event.password;
    return state.copyWith(
      password: password,
      status: FormStatus.pure,
    );
  }

  NewPasswordState _mapNewConfirmPasswordChangedToState(
      NewConfirmPasswordChanged event, NewPasswordState state) {
    final confirmPassword = event.confirmPassword;
    return state.copyWith(
      confirmPassword: confirmPassword,
      status: FormStatus.pure,
    );
  }

  Stream<NewPasswordState> _mapNewPasswordSubmittedToState(
      NewPasswordSubmitted event, NewPasswordState state) async* {
    yield state.copyWith(status: FormStatus.submissionInProgress);
    try {
      final result = await locator<UserRepository>()
          .resetPassword(this.email, state.password, state.confirmPassword);
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

  NewPasswordState _mapPasswordVisibleChangedToState(
      NewPasswordVisibleChanged event, NewPasswordState state) {
    final isPasswordVisible = event.isVisible;
    return state.copyWith(
      isPasswordVisible: isPasswordVisible,
      status: FormStatus.pure,
    );
  }

  NewPasswordState _mapConfirmPasswordVisibleChangedToState(
      NewConfirmPasswordVisibleChanged event, NewPasswordState state) {
    final isConfirmPasswordVisible = event.isVisible;
    return state.copyWith(
      isConfirmPasswordVisible: isConfirmPasswordVisible,
      status: FormStatus.pure,
    );
  }
}
