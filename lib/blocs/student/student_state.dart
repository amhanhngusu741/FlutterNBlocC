part of 'student_bloc.dart';

class StudentState extends Equatable {
  const StudentState({
    this.status = FormStatus.pure,
  });

  final FormStatus status;

  StudentState copyWith({
    FormStatus status,
  }) {
    return StudentState(
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [
        status,
      ];
}
