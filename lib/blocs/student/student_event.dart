part of 'student_bloc.dart';

abstract class StudentEvent extends Equatable {
  const StudentEvent();
  @override
  List<Object> get props => [];
}

class GetBrandMyList extends StudentEvent {}

class GetLookupAmazon extends StudentEvent {
  const GetLookupAmazon();
  @override
  List<Object> get props => [];
}
