part of 'profile_bloc.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();
  @override
  List<Object> get props => [];
}

class GetProfile extends ProfileEvent {}

class UploadImageEvent extends ProfileEvent {
  final String imageBase64;
  const UploadImageEvent({@required this.imageBase64});

  @override
  List<Object> get props => [imageBase64];
}
