import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:childcaresoftware/commons/validator.dart';
import 'package:childcaresoftware/constants/form_status.dart';
import 'package:childcaresoftware/models/models.dart';
import 'package:childcaresoftware/repositories/user_repository.dart';
import 'package:childcaresoftware/service_locator.dart';
part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileState());

  @override
  Stream<ProfileState> mapEventToState(
    ProfileEvent event,
  ) async* {
    if (event is GetProfile) {
      yield* _mapGetProfileToState(event, state);
    }
  }

  Stream<ProfileState> _mapGetProfileToState(
    GetProfile event,
    ProfileState state,
  ) async* {
    yield state.copyWith(status: FormStatus.submissionInProgress);
    try {
      final UserResponse result = await locator<UserRepository>().getProfile();
      // await locator<UserRepository>().saveProfileLocal(json.encode(result));
      yield state.copyWith(
        accountId: result.accounntId,
        createDate: result.createDate,
        companyName: result.companyName,
        primaryUser: result.primaryUser,
        status: FormStatus.submissionSuccess,
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
