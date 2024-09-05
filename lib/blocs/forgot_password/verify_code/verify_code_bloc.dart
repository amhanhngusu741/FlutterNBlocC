import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:childcaresoftware/constants/form_status.dart';
import 'package:childcaresoftware/models/models.dart';
import 'package:childcaresoftware/repositories/repositories.dart';
import 'package:childcaresoftware/service_locator.dart';

part 'verify_code_event.dart';
part 'verify_code_state.dart';

class VerifyCodeBloc extends Bloc<VerifyCodeEvent, VerifyCodeState> {
  final email;
  VerifyCodeBloc({this.email}) : super(VerifyCodeState());

  @override
  Stream<VerifyCodeState> mapEventToState(
    VerifyCodeEvent event,
  ) async* {
    if (event is VerifyCodeOTPChanged) {
      yield _mapOTPChangedToState(event, state);
    } else if (event is VerifyCodeSubmitted) {
      yield* _mapVerifyCodeSubmittedToState(event, state);
    }
  }

  VerifyCodeState _mapOTPChangedToState(
      VerifyCodeOTPChanged event, VerifyCodeState state) {
    final otp = event.otp;
    return state.copyWith(
      otp: otp,
      status: FormStatus.pure,
    );
  }

  Stream<VerifyCodeState> _mapVerifyCodeSubmittedToState(
      VerifyCodeSubmitted event, VerifyCodeState state) async* {
    yield state.copyWith(status: FormStatus.submissionInProgress);
    try {
      // final result = await locator<UserRepository>()
      //     .forgotPasswordCode(this.email, state.otp);
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
