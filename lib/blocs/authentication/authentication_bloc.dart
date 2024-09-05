import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:childcaresoftware/commons/utils.dart';
import 'package:childcaresoftware/constants/api.dart';
import 'package:childcaresoftware/repositories/repositories.dart';
import 'package:childcaresoftware/service_locator.dart';
import 'package:childcaresoftware/services/local/local_pref.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(Uninitialized()) {
    on<AppStarted>(_mapAppStartedToState);
    on<LoggedIn>(_mapLoggedInToState);
    on<LoggedOut>(_mapLoggedOutToState);
  }

  Future<FutureOr<void>> _mapAppStartedToState(
      AppStarted event, Emitter<AuthenticationState> emit) async {
    try {
      final token = await locator<UserRepository>().getToken();
      final role = await locator<UserRepository>().getRole();
      final userProfile = await locator<UserRepository>().getProfileLocal();
      // var resultData = json.decode(userProfile);
      // final mwsDbServer = resultData['accounts'][0]['mws_db_server'];
      // final curId = resultData['accounts'][0]['id'];
      // final userId = resultData['user']['id'];
      // API.MWS_DB_SERVER = mwsDbServer;
      // API.CURRENT_ACCOUNT_ID = curId.toString();
      // API.CURRENT_USER_ID = userId.toString();
      API.TOKEN = token;
      final isFirstTime = await locator<SettingsRepository>().getFirstTime();
      await Future.delayed(const Duration(milliseconds: 3000));
      if (token != null) {
        emit(Authenticated());
      } else {
        print(isFirstTime);
        emit(Unauthenticated(isFirstTime: isFirstTime));
      }
    } catch (_) {
      emit(Uninitialized()); // Uninitialized
    }
  }

  Future<FutureOr<void>> _mapLoggedInToState(
      LoggedIn event, Emitter<AuthenticationState> emit) async {
    emit(Authenticated());
  }

  Future<FutureOr<void>> _mapLoggedOutToState(
      LoggedOut event, Emitter<AuthenticationState> emit) async {
    try {
      await locator<UserRepository>().logOut();
      emit(Unauthenticated(isFirstTime: false));
    } catch (e) {
      print(e);
    } finally {
      await LocalPref.clearAll();
      await Utils.deleteCacheDir();
      await Utils.deleteAppDir();
      // FirebaseMessaging.instance.deleteToken();
      await locator<SettingsRepository>().saveFirstTime(false);
      emit(Unauthenticated());
    }
  }
}
