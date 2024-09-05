part of 'billing_bloc.dart';

abstract class BillingEvent extends Equatable {
  const BillingEvent();
  @override
  List<Object> get props => [];
}

class GetProfile extends BillingEvent {}

class EditProfileClick extends BillingEvent {}

class SaveProfileClick extends BillingEvent {}

class UploadImageEvent extends BillingEvent {
  final String imageBase64;
  const UploadImageEvent({@required this.imageBase64});

  @override
  List<Object> get props => [imageBase64];
}

class CancelProfileClick extends BillingEvent {}

class UpdateSelectedSkillProfileClick extends BillingEvent {
  final List<dynamic> value;
  const UpdateSelectedSkillProfileClick({@required this.value});

  @override
  List<Object> get props => [value];
}

class ProfileFirstNameChangeEvent extends BillingEvent {
  final String firstName;
  const ProfileFirstNameChangeEvent({@required this.firstName});

  @override
  List<Object> get props => [firstName];
}

class ProfileLastNameChangeEvent extends BillingEvent {
  final String lastName;
  const ProfileLastNameChangeEvent({@required this.lastName});

  @override
  List<Object> get props => [lastName];
}

class ProfileAddressFullChangeEvent extends BillingEvent {
  final String addrFull;
  const ProfileAddressFullChangeEvent({@required this.addrFull});

  @override
  List<Object> get props => [addrFull];
}

class ProfilePhoneChangeEvent extends BillingEvent {
  final String phone;
  const ProfilePhoneChangeEvent({@required this.phone});

  @override
  List<Object> get props => [phone];
}

class ProfileEmailChangeEvent extends BillingEvent {
  final String email;
  const ProfileEmailChangeEvent({@required this.email});

  @override
  List<Object> get props => [email];
}

class ProfileLocationChanged extends BillingEvent {
  final dynamic location;

  const ProfileLocationChanged({@required this.location});

  @override
  List<Object> get props => [location];
}

class DeleteExperienceProfileClick extends BillingEvent {
  final int id;
  const DeleteExperienceProfileClick({@required this.id});

  @override
  List<Object> get props => [id];
}

class CreateExperienceProfileClick extends BillingEvent {
  final dynamic newExp;
  const CreateExperienceProfileClick({@required this.newExp});

  @override
  List<Object> get props => [newExp];
}

class UpdateExperienceProfileClick extends BillingEvent {
  final int id;
  final dynamic newExp;
  const UpdateExperienceProfileClick(
      {@required this.id, @required this.newExp});

  @override
  List<Object> get props => [id, newExp];
}

class ResumeChangeEvent extends BillingEvent {
  final File file;
  const ResumeChangeEvent({@required this.file});

  @override
  List<Object> get props => [file];
}

class DescriptionChangeEvent extends BillingEvent {
  final String description;
  const DescriptionChangeEvent({@required this.description});

  @override
  List<Object> get props => [description];
}

class YearsExpsChangeEvent extends BillingEvent {
  final String yearsExpSelected;
  const YearsExpsChangeEvent({@required this.yearsExpSelected});

  @override
  List<Object> get props => [yearsExpSelected];
}

class AddEducationEvent extends BillingEvent {
  final dynamic education;
  const AddEducationEvent({@required this.education});

  @override
  List<Object> get props => [education];
}

class UpdateEducationEvent extends BillingEvent {
  final int id;
  final dynamic education;
  const UpdateEducationEvent({@required this.id, @required this.education});

  @override
  List<Object> get props => [id, education];
}

class DeleteEducationEvent extends BillingEvent {
  final int id;
  const DeleteEducationEvent({@required this.id});

  @override
  List<Object> get props => [id];
}

class AddCertificateEvent extends BillingEvent {
  final File file;
  const AddCertificateEvent({@required this.file});

  @override
  List<Object> get props => [file];
}

class DeleteCertificateEvent extends BillingEvent {
  final int id;
  const DeleteCertificateEvent({@required this.id});

  @override
  List<Object> get props => [id];
}

class DeleteAffiliationEvent extends BillingEvent {
  final int id;
  final String status;
  const DeleteAffiliationEvent({@required this.id, @required this.status});

  @override
  List<Object> get props => [id];
}

class AddAffiliationEvent extends BillingEvent {
  final dynamic affiliate;
  const AddAffiliationEvent({@required this.affiliate});

  @override
  List<Object> get props => [affiliate];
}
