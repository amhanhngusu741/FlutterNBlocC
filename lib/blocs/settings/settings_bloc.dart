import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:childcaresoftware/constants/form_status.dart';
import 'package:childcaresoftware/models/models.dart';
import 'package:childcaresoftware/models/settings_response.dart';
import 'package:childcaresoftware/repositories/repositories.dart';
import 'package:childcaresoftware/service_locator.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc() : super(SettingsState()) {
    on<SettingsLoaded>(_mapSettingsLoadedToState);
    on<SettingsSavedSoundNotification>(
        _mapSettingsSavedSoundNotificationToState);
    on<SettingsSavedStartScreen>(_mapSettingsSavedStartScreenToState);
  }

  Future<FutureOr<void>> _mapSettingsLoadedToState(
      SettingsLoaded event, Emitter<SettingsState> emit) async {
    emit(SettingsState(status: FormStatus.submissionInProgress));
    try {
      final SettingsResponse result =
          await locator<SettingsRepository>().getSettings();
      final startScreen = await locator<SettingsRepository>().getStartScreen();
      emit(SettingsState(
        startScreen: startScreen,
        settingsResponse: result,
        status: FormStatus.submissionSuccess,
      ));
    } on APIException catch (e) {
      emit(SettingsState(
          status: FormStatus.submissionFailure, messageStatus: e.error));
    } catch (e) {
      emit(SettingsState(
          status: FormStatus.submissionFailure,
          messageStatus: "An error occurred. Please try again!"));
    }
  }

  Future<FutureOr<void>> _mapSettingsSavedSoundNotificationToState(
      SettingsSavedSoundNotification event, Emitter<SettingsState> emit) async {
    emit(SettingsState(status: FormStatus.submissionInProgress));
    try {
      if (event.soundMode == SoundMode.custom) {
        await locator<SettingsRepository>()
            .muteNotificationByPeriod(event.fromDate, event.toDate);
      } else {
        await locator<SettingsRepository>().muteNotification(event.soundMode);
      }
      final SettingsResponse result =
          await locator<SettingsRepository>().getSettings();

      emit(SettingsState(
        settingsResponse: result,
        status: FormStatus.submissionSuccess,
      ));
    } on APIException catch (e) {
      emit(SettingsState(
          status: FormStatus.submissionFailure, messageStatus: e.error));
    } catch (e) {
      emit(SettingsState(
          status: FormStatus.submissionFailure,
          messageStatus: "An error occurred. Please try again!"));
    }
  }

  Future<FutureOr<void>> _mapSettingsSavedStartScreenToState(
      SettingsSavedStartScreen event, Emitter<SettingsState> emit) async {
    emit(SettingsState(status: FormStatus.submissionInProgress));
    try {
      await locator<SettingsRepository>().saveStartScreen(event.startScreen);
      emit(SettingsState(
        startScreen: event.startScreen,
        status: FormStatus.submissionSuccess,
      ));
    } catch (e) {
      emit(SettingsState(
          status: FormStatus.submissionFailure,
          messageStatus: "An error occurred. Please try again!"));
    }
  }
}
