import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:childcaresoftware/constants/form_status.dart';
import 'package:childcaresoftware/models/models.dart';
import 'package:childcaresoftware/repositories/user_repository.dart';
import 'package:childcaresoftware/service_locator.dart';
import 'package:childcaresoftware/constants/api.dart';

import '../../commons/variables.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState()) {
    on<EmailChanged>(_mapEmailChangedToState);
    on<PasswordChanged>(_mapPasswordChangedToState);
    on<PasswordVisibleChanged>(_mapPasswordVisibleChangedToState);
    on<LoginSubmitted>(_mapLoginSubmittedToState);
    on<IsTeacherChanged>(_mapIsTeacherChangedToState);
  }

  Future<FutureOr<void>> _mapEmailChangedToState(
      EmailChanged event, Emitter<LoginState> emit) async {
    final email = event.email;
    print(state.isTeacher);
    emit(LoginState(
      email: email,
      isTeacher: state.isTeacher,
      isPasswordVisible: state.isPasswordVisible,
      status: FormStatus.pure,
    ));
  }

  Future<FutureOr<void>> _mapPasswordChangedToState(
      PasswordChanged event, Emitter<LoginState> emit) async {
    final password = event.password;
    emit(LoginState(
      password: password,
      isTeacher: state.isTeacher,
      isPasswordVisible: state.isPasswordVisible,
      status: FormStatus.pure,
    ));
  }

  Future<FutureOr<void>> _mapPasswordVisibleChangedToState(
      PasswordVisibleChanged event, Emitter<LoginState> emit) async {
    final isVisible = event.isVisible;
    emit(LoginState(
      isPasswordVisible: isVisible,
      isTeacher: state.isTeacher,
      status: FormStatus.pure,
    ));
  }

  Future<FutureOr<void>> _mapLoginSubmittedToState(
      LoginSubmitted event, Emitter<LoginState> emit) async {
    emit(LoginState(
      status: FormStatus.submissionInProgress,
    ));
    try {
      // final result =
      //     await locator<UserRepository>().logIn(state.email, state.password);
      // final token = '${result.token}';
      API.TOKEN = "token";
      await locator<UserRepository>().saveToken("token");

      // await locator<UserRepository>().saveProfileLocal(json.encode(result));
      // final mwsDbServer = "${result.accounts[0].mwsDbServer}";
      // final curId = ("${result.accounts[0].id}");
      // final curUserId = ("${result.user.userId}");
      // API.MWS_DB_SERVER = mwsDbServer;
      // API.CURRENT_ACCOUNT_ID = curId;
      // API.CURRENT_USER_ID = curUserId;
      emit(LoginState(status: FormStatus.submissionSuccess));
    } on APIException catch (e) {
      emit(LoginState(
          status: FormStatus.submissionFailure, messageStatus: e.error));
    } catch (e) {
      emit(LoginState(
          status: FormStatus.submissionFailure,
          messageStatus: "An error occurred. Please try again!"));
    }
  }

  Future<FutureOr<void>> _mapIsTeacherChangedToState(
      IsTeacherChanged event, Emitter<LoginState> emit) async {
    final isTeacher = event.isTeacher;
    Variables.isTeacher = isTeacher;
    await locator<UserRepository>()
        .saveRole(!state.isTeacher ? "true" : "false");
    emit(LoginState(
      isTeacher: isTeacher,
      isPasswordVisible: state.isPasswordVisible,
      status: FormStatus.pure,
    ));
  }
}
