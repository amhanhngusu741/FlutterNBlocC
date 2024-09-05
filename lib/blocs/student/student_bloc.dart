import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:childcaresoftware/constants/form_status.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
part 'student_event.dart';
part 'student_state.dart';

class StudentBloc extends Bloc<StudentEvent, StudentState> {
  StudentBloc() : super(StudentState()) {
    on<GetBrandMyList>(_mapEmailChangedToState);
  }

  Future<FutureOr<void>> _mapEmailChangedToState(
      GetBrandMyList event, Emitter<StudentState> emit) async {
    emit(StudentState(
      status: FormStatus.pure,
    ));
  }
}
