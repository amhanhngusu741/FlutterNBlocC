import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:childcaresoftware/constants/form_status.dart';
import 'package:childcaresoftware/models/models.dart';
import 'package:childcaresoftware/repositories/repositories.dart';
import 'package:childcaresoftware/service_locator.dart';

part 'forgot_password_event.dart';
part 'forgot_password_state.dart';

class ForgotPasswordBloc
    extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  ForgotPasswordBloc() : super(ForgotPasswordState());

  @override
  Stream<ForgotPasswordState> mapEventToState(
    ForgotPasswordEvent event,
  ) async* {
    if (event is ForgotPasswordEmailChanged) {
      yield _mapEmailChangedToState(event, state);
    } else if (event is ForgotPasswordSubmitted) {
      yield* _mapForgotPasswordSubmittedToState(event, state);
    }
  }

  ForgotPasswordState _mapEmailChangedToState(
      ForgotPasswordEmailChanged event, ForgotPasswordState state) {
    final email = event.email;
    return state.copyWith(
      email: email,
      status: FormStatus.pure,
    );
  }

  Stream<ForgotPasswordState> _mapForgotPasswordSubmittedToState(
      ForgotPasswordSubmitted event, ForgotPasswordState state) async* {
    yield state.copyWith(status: FormStatus.submissionInProgress);
    try {
      final result =
          await locator<UserRepository>().forgotPassword(state.email);
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
}
