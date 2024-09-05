import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:childcaresoftware/commons/validator.dart';
import 'package:childcaresoftware/constants/form_status.dart';
import 'package:childcaresoftware/models/models.dart';
import 'package:childcaresoftware/repositories/user_repository.dart';
import 'package:childcaresoftware/service_locator.dart';
part 'billing_event.dart';
part 'billing_state.dart';

class BillingBloc extends Bloc<BillingEvent, BillingState> {
  BillingBloc() : super(BillingState());

  @override
  Stream<BillingState> mapEventToState(
    BillingEvent event,
  ) async* {
    if (event is EditProfileClick) {
      yield _mapEditProfileClick(event, state);
    }
    if (event is GetProfile) {
      yield* _mapGetProfileToState(event, state);
    }
    if (event is SaveProfileClick) {
      yield* _mapSaveProfileToState(event, state);
    }
    if (event is UploadImageEvent) {
      yield* _mapUploadImageToState(event, state);
    }
    if (event is CancelProfileClick) {
      yield* _mapCancelProfileClick(event, state);
    }
    if (event is UpdateSelectedSkillProfileClick) {
      yield _mapUpdateSelectedSkillProfileClick(event, state);
    }
    if (event is ProfileFirstNameChangeEvent) {
      yield _mapProfileFirstNameChanged(event, state);
    }
    if (event is ProfileLastNameChangeEvent) {
      yield _mapProfileLastNameChanged(event, state);
    }
    if (event is ProfileAddressFullChangeEvent) {
      yield _mapProfileAddressFullChanged(event, state);
    }
    if (event is ProfilePhoneChangeEvent) {
      yield _mapProfilePhoneChanged(event, state);
    }
    if (event is ProfileEmailChangeEvent) {
      yield _mapProfileEmailChanged(event, state);
    }
    if (event is ProfileLocationChanged) {
      yield _mapLocationChangedToState(event, state);
    }
  }

  BillingState _mapEditProfileClick(
    EditProfileClick event,
    BillingState state,
  ) {
    final isEditing = !state.isEditing;
    return state.copyWith(
      isEditing: isEditing,
      status: FormStatus.pure,
    );
  }

  Stream<BillingState> _mapGetProfileToState(
    GetProfile event,
    BillingState state,
  ) async* {
    yield state.copyWith(status: FormStatus.submissionInProgress);
    try {
      final result = await locator<UserRepository>().getProfile();
      await locator<UserRepository>().saveProfileLocal(json.encode(result));
      final selectedItem = [];
      String yearsExpSelected = '';
      for (var item in result['skills']) {
        if (item['selected'] == 1) {
          selectedItem.add(item['id']);
        }
      }
      for (var item in result['years_exps']) {
        if (item['selected'] == 1) {
          yearsExpSelected = item['value'].toString();
          break;
        }
      }
      yield state.copyWith(
        status: FormStatus.submissionSuccess,
        firstName: result['info']['first_name'],
        description: result['info']['description'],
        lastName: result['info']['last_name'],
        addrFull: result['info']['addr_full'],
        phone: result['info']['phone'],
        email: result['info']['email'],
        avatar: result['info']['avatar'],
        allSkills: result['skills'],
        skillSelected: selectedItem,
        firstNameAvatar: result['info']['first_name'],
        lastNameAvatar: result['info']['last_name'],
        exps: result['exps'],
        resume: result['resume'],
        yearsExps: result['years_exps'],
        yearsExpSelected: yearsExpSelected,
        edus: result['edus'],
        certs: result['certs'],
        affs: result['branches_aff'],
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

  Stream<BillingState> _mapSaveProfileToState(
    SaveProfileClick event,
    BillingState state,
  ) async* {
    yield state.copyWith(status: FormStatus.submissionInProgress);
    try {
      final result = await locator<UserRepository>().saveProfile(
        state.firstName,
        state.lastName,
        state.phone,
        state.description,
        state.yearsExpSelected,
        state.notify,
        state.headline,
        state.addrFull,
        state.addrStreet,
        state.addrDistrict,
        state.addrState,
        state.addrLat,
        state.addrLng,
        state.types,
        state.skillSelected,
      );
      await locator<UserRepository>().saveProfileLocal(json.encode(result));
      final selectedItem = [];
      for (var item in result['skills']) {
        if (item['selected'] == 1) {
          selectedItem.add(item['id']);
        }
      }
      final isEditing = !state.isEditing;
      yield state.copyWith(
        status: FormStatus.submissionSuccess,
        firstName: result['info']['first_name'],
        lastName: result['info']['last_name'],
        addrFull: result['info']['addr_full'],
        phone: result['info']['phone'],
        email: result['info']['email'],
        firstNameAvatar: result['info']['first_name'],
        lastNameAvatar: result['info']['last_name'],
        skillSelected: selectedItem,
        isEditing: isEditing,
        isUpdateSuccess: true,
        messageStatus: result['message'],
        description: result['info']['description'],
        yearsExpSelected: state.yearsExpSelected,
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

  Stream<BillingState> _mapUploadImageToState(
    UploadImageEvent event,
    BillingState state,
  ) async* {
    yield state.copyWith(status: FormStatus.submissionInProgress);
    try {
      final result =
          await locator<UserRepository>().uploadImage(event.imageBase64);
      final resultLocal = await locator<UserRepository>().getProfileLocal();
      var resultData = json.decode(resultLocal);
      resultData['info']['avatar'] = result['url'];
      await locator<UserRepository>().saveProfileLocal(json.encode(resultData));
      yield state.copyWith(
        status: FormStatus.submissionSuccess,
        avatar: result['url'],
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

  Stream<BillingState> _mapCancelProfileClick(
    CancelProfileClick event,
    BillingState state,
  ) async* {
    yield state.copyWith(status: FormStatus.pure);
    try {
      var result;
      final resultLocal = await locator<UserRepository>().getProfileLocal();
      if (resultLocal == null) {
        result = await locator<UserRepository>().getProfile();
        await locator<UserRepository>().saveProfileLocal(json.encode(result));
      } else {
        result = json.decode(resultLocal);
      }
      final selectedItem = [];
      String yearsExpSelected = '';
      for (var item in result['skills']) {
        if (item['selected'] == 1) {
          selectedItem.add(item['id']);
        }
      }
      for (var item in result['years_exps']) {
        if (item['selected'] == 1) {
          yearsExpSelected = item['value'].toString();
          break;
        }
      }
      final isEditing = !state.isEditing;
      yield state.copyWith(
        status: FormStatus.pure,
        isEditing: isEditing,
        firstName: result['info']['first_name'],
        lastName: result['info']['last_name'],
        addrFull: result['info']['addr_full'] ?? '',
        phone: result['info']['phone'] ?? '',
        skillSelected: selectedItem,
        description: result['info']['description'],
        yearsExpSelected: yearsExpSelected,
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

  BillingState _mapUpdateSelectedSkillProfileClick(
    UpdateSelectedSkillProfileClick event,
    BillingState state,
  ) {
    final value = event.value;
    return state.copyWith(
      skillSelected: value,
      skills: value,
      status: FormStatus.pure,
    );
  }

  BillingState _mapProfileFirstNameChanged(
    ProfileFirstNameChangeEvent event,
    BillingState state,
  ) {
    final firstName = event.firstName;
    return state.copyWith(
      firstName: firstName,
      isFirstNameValid: Validators.isRequiredField(firstName),
      status: FormStatus.pure,
    );
  }

  BillingState _mapProfileLastNameChanged(
    ProfileLastNameChangeEvent event,
    BillingState state,
  ) {
    final lastName = event.lastName;
    return state.copyWith(
      lastName: lastName,
      isLastNameValid: Validators.isRequiredField(lastName),
      status: FormStatus.pure,
    );
  }

  BillingState _mapProfileAddressFullChanged(
    ProfileAddressFullChangeEvent event,
    BillingState state,
  ) {
    final addrFull = event.addrFull;
    return state.copyWith(
      addrFull: addrFull,
      status: FormStatus.pure,
    );
  }

  BillingState _mapProfilePhoneChanged(
    ProfilePhoneChangeEvent event,
    BillingState state,
  ) {
    final phone = event.phone;
    return state.copyWith(
      phone: phone,
      status: FormStatus.pure,
    );
  }

  BillingState _mapProfileEmailChanged(
    ProfileEmailChangeEvent event,
    BillingState state,
  ) {
    final email = event.email;
    return state.copyWith(
      email: email,
      status: FormStatus.pure,
    );
  }

  BillingState _mapLocationChangedToState(
      ProfileLocationChanged event, BillingState state) {
    final location = event.location['addrFull'];
    return state.copyWith(
      location: location,
      addrFull: location,
      addrStreet: event.location['addrStreet'],
      addrDistrict: event.location['addrDistrict'],
      addrState: event.location['addrState'],
      addrLat: event.location['addrLat'].toString(),
      addrLng: event.location['addrLng'].toString(),
      status: FormStatus.pure,
    );
  }
}
