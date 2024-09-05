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

class VerifyCodeRegisterBloc
    extends Bloc<VerifyCodeRegisterEvent, VerifyCodeRegisterState> {
  final email;
  VerifyCodeRegisterBloc({this.email}) : super(VerifyCodeRegisterState());

  @override
  Stream<VerifyCodeRegisterState> mapEventToState(
    VerifyCodeRegisterEvent event,
  ) async* {
    if (event is VerifyCodeRegisterOTPChanged) {
      yield _mapOTPChangedToState(event, state);
    } else if (event is VerifyCodeRegisterSubmitted) {
      yield* _mapVerifyCodeSubmittedToState(event, state);
    }
  }

  VerifyCodeRegisterState _mapOTPChangedToState(
      VerifyCodeRegisterOTPChanged event, VerifyCodeRegisterState state) {
    final otp = event.otp;
    return state.copyWith(
      otp: otp,
      status: FormStatus.pure,
    );
  }

  Stream<VerifyCodeRegisterState> _mapVerifyCodeSubmittedToState(
      VerifyCodeRegisterSubmitted event, VerifyCodeRegisterState state) async* {
    yield state.copyWith(status: FormStatus.submissionInProgress);
    try {
      // final result =
      //     await locator<UserRepository>().activate(this.email, state.otp);
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
