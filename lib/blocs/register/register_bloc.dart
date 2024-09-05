import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:childcaresoftware/commons/validator.dart';
import 'package:childcaresoftware/constants/form_status.dart';
import 'package:childcaresoftware/models/models.dart';
import 'package:childcaresoftware/repositories/user_repository.dart';
import 'package:childcaresoftware/service_locator.dart';
part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterState());

  @override
  Stream<RegisterState> mapEventToState(
    RegisterEvent event,
  ) async* {
    if (event is RegisterFirstNameChangeEvent) {
      yield _mapRegisterFirstNameChanged(event, state);
    } else if (event is EmailRegisterChanged) {
      yield _mapEmailChangedToState(event, state);
    } else if (event is RegisterSubmitted) {
      yield* _mapRegisterSubmittedToState(event, state);
    } else if (event is ReferralCodeChanged) {
      yield _mapReferralCodeChanged(event, state);
    } else if (event is RegisterLastNameChangeEvent) {
      yield _mapRegisterLastNameChanged(event, state);
    } else if (event is PasswordRegisterChanged) {
      yield _mapRegisterPasswordChanged(event, state);
    } else if (event is ConfirmPasswordRegisterChanged) {
      yield _mapRegisterConfirmPasswordChanged(event, state);
    } else if (event is ActivateSubmitted) {
      yield* _mapActivateSubmittedToState(event, state);
    } else if (event is PhoneNumberChanged) {
      yield _mapPhoneNumberChanged(event, state);
    }
  }
}

RegisterState _mapReferralCodeChanged(
  ReferralCodeChanged event,
  RegisterState state,
) {
  return state.copyWith(
    referralCode: event.referralCode,
  );
}

RegisterState _mapPhoneNumberChanged(
  PhoneNumberChanged event,
  RegisterState state,
) {
  return state.copyWith(
    phone: event.phoneNumber,
  );
}

RegisterState _mapEmailChangedToState(
  EmailRegisterChanged event,
  RegisterState state,
) {
  final email = event.email;
  return state.copyWith(
    email: email,
    isEmailValid: Validators.isValidEmail(email),
    status: FormStatus.pure,
  );
}

Stream<RegisterState> _mapRegisterSubmittedToState(
  RegisterSubmitted event,
  RegisterState state,
) async* {
  yield state.copyWith(status: FormStatus.submissionInProgress);
  try {
    await locator<UserRepository>().register(
        state.firstName,
        state.lastName,
        state.email,
        state.password,
        state.confirmPassword,
        state.referralCode,
        state.phone);
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

RegisterState _mapRegisterFirstNameChanged(
  RegisterFirstNameChangeEvent event,
  RegisterState state,
) {
  return state.copyWith(
    firstName: event.firstName,
    isFirstNameValid: Validators.isRequiredField(event.firstName),
    status: FormStatus.pure,
  );
}

RegisterState _mapRegisterLastNameChanged(
  RegisterLastNameChangeEvent event,
  RegisterState state,
) {
  final lastName = event.lastName;
  return state.copyWith(
    isLastNameValid: Validators.isRequiredField(lastName),
    lastName: lastName,
    status: FormStatus.pure,
  );
}

RegisterState _mapRegisterPasswordChanged(
  PasswordRegisterChanged event,
  RegisterState state,
) {
  final password = event.password;
  return state.copyWith(
    password: password,
    isPasswordValid: Validators.isRequiredField(password),
    status: FormStatus.pure,
  );
}

RegisterState _mapRegisterConfirmPasswordChanged(
  ConfirmPasswordRegisterChanged event,
  RegisterState state,
) {
  final confirmPassword = event.confirmPassword;
  final password = event.password;
  return state.copyWith(
    confirmPassword: confirmPassword,
    isConfirmPasswordValid: Validators.isMatchText(confirmPassword, password),
    status: FormStatus.pure,
  );
}

Stream<RegisterState> _mapActivateSubmittedToState(
  ActivateSubmitted event,
  RegisterState state,
) async* {
  yield state.copyWith(status: FormStatus.submissionInProgress);
  try {
    // final result = await locator<UserRepository>()
    //     .activate(state.email, state.activateCode);
    yield state.copyWith(status: FormStatus.submissionSuccess);
  } on APIException catch (e) {
    yield state.copyWith(
        status: FormStatus.submissionFailure, messageStatus: e.error);
  } catch (e) {
    yield state.copyWith(
        status: FormStatus.submissionFailure,
        messageStatus: "An error occurred. Please try again!");
  }
  // }
}
