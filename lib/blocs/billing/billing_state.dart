part of 'billing_bloc.dart';

class BillingState extends Equatable {
  BillingState({
    this.firstName = '',
    this.isFirstNameValid = true,
    this.firstNameValidMsg = '',
    this.lastName = '',
    this.isLastNameValid = true,
    this.email = '',
    this.phone = '',
    this.status = FormStatus.pure,
    this.isEmailValid = false,
    this.password = '',
    this.isPasswordValid = false,
    this.confirmPassword = '',
    this.isConfirmPasswordValid = false,
    this.messageStatus = '',
    this.middleName = '',
    this.address = '',
    this.highestEducation = '',
    this.degreeName = '',
    this.schoolName = '',
    this.isEditing = false,
    this.experience = '',
    this.avatar = '',
    this.allSkills,
    this.skillSelected,
    this.description = '',
    this.yearsExps = const [],
    this.notify = true,
    this.headline = '',
    this.addrFull = '',
    this.addrStreet = '',
    this.addrDistrict = '',
    this.addrState = '',
    this.addrLat = '',
    this.addrLng = '',
    this.types = const [],
    this.skills = const [],
    this.isUpdateSuccess = false,
    this.firstNameAvatar = '',
    this.lastNameAvatar = '',
    this.location,
    this.exps,
    this.resume,
    this.yearsExpSelected = '0',
    this.edus,
    this.certs,
    this.affs,
  });
  final String firstName;
  final bool isFirstNameValid;
  final String lastName;
  final bool isLastNameValid;
  final String email;
  final String phone;
  final FormStatus status;
  final bool isEmailValid;
  final String password;
  final bool isPasswordValid;
  final String confirmPassword;
  final bool isConfirmPasswordValid;
  final String messageStatus;
  final String middleName;
  final String address;
  final String highestEducation;
  final String degreeName;
  final String schoolName;
  final bool isEditing;
  final String experience;
  final String avatar;
  final List<dynamic> allSkills;
  final List<dynamic> skillSelected;
  final String description;
  final List<dynamic> yearsExps;
  final bool notify;
  final String headline;
  final String addrFull;
  final String addrStreet;
  final String addrDistrict;
  final String addrState;
  final String addrLat;
  final String addrLng;
  final List<dynamic> types;
  final List<dynamic> skills;
  final bool isUpdateSuccess;
  final String firstNameAvatar;
  final String lastNameAvatar;
  final String firstNameValidMsg;
  final dynamic location;
  final List<dynamic> exps;
  final dynamic resume;
  final String yearsExpSelected;
  final List<dynamic> edus;
  final List<dynamic> certs;
  final List<dynamic> affs;

  BillingState copyWith({
    String firstName,
    String lastName,
    String email,
    String phone,
    FormStatus status,
    bool isEmailValid,
    String password,
    bool isPasswordValid,
    String confirmPassword,
    bool isConfirmPasswordValid,
    String messageStatus,
    bool isFirstNameValid,
    bool isLastNameValid,
    String middleName,
    String address,
    String highestEducation,
    String degreeName,
    String schoolName,
    bool isEditing,
    String experience,
    String avatar,
    List<dynamic> allSkills,
    List<dynamic> skillSelected,
    String description,
    List<dynamic> yearsExps,
    bool notify,
    String headline,
    String addrFull,
    String addrStreet,
    String addrDistrict,
    String addrState,
    String addrLat,
    String addrLng,
    List<dynamic> types,
    List<dynamic> skills,
    bool isUpdateSuccess,
    String firstNameAvatar,
    String lastNameAvatar,
    dynamic location,
    List<dynamic> exps,
    dynamic resume,
    String yearsExpSelected,
    List<dynamic> edus,
    List<dynamic> certs,
    List<dynamic> affs,
  }) {
    return BillingState(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      isEmailValid: isEmailValid ?? this.isEmailValid,
      status: status ?? this.status,
      password: password ?? this.password,
      isPasswordValid: isPasswordValid ?? this.isPasswordValid,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      isConfirmPasswordValid:
          isConfirmPasswordValid ?? this.isConfirmPasswordValid,
      messageStatus: messageStatus ?? this.messageStatus,
      isFirstNameValid: isFirstNameValid ?? this.isFirstNameValid,
      isLastNameValid: isLastNameValid ?? this.isLastNameValid,
      middleName: middleName ?? this.middleName,
      address: address ?? this.address,
      highestEducation: highestEducation ?? this.highestEducation,
      degreeName: degreeName ?? this.degreeName,
      schoolName: schoolName ?? this.schoolName,
      isEditing: isEditing ?? this.isEditing,
      experience: experience ?? this.experience,
      avatar: avatar ?? this.avatar,
      allSkills: allSkills ?? this.allSkills,
      skillSelected: skillSelected ?? this.skillSelected,
      description: description ?? this.description,
      yearsExps: yearsExps ?? this.yearsExps,
      notify: notify ?? this.notify,
      headline: headline ?? this.headline,
      addrFull: addrFull ?? this.addrFull,
      addrStreet: addrStreet ?? this.addrStreet,
      addrDistrict: addrDistrict ?? this.addrDistrict,
      addrState: addrState ?? this.addrState,
      addrLat: addrLat ?? this.addrLat,
      addrLng: addrLng ?? this.addrLng,
      types: types ?? this.types,
      skills: skills ?? this.skills,
      isUpdateSuccess: isUpdateSuccess ?? this.isUpdateSuccess,
      firstNameAvatar: firstNameAvatar ?? this.firstNameAvatar,
      lastNameAvatar: lastNameAvatar ?? this.lastNameAvatar,
      location: location ?? this.location,
      exps: exps ?? this.exps,
      resume: resume ?? this.resume,
      yearsExpSelected: yearsExpSelected ?? this.yearsExpSelected,
      edus: edus ?? this.edus,
      certs: certs ?? this.certs,
      affs: affs ?? this.affs,
    );
  }

  @override
  List<Object> get props => [
        firstName,
        lastName,
        email,
        phone,
        isEmailValid,
        status,
        password,
        isPasswordValid,
        confirmPassword,
        isConfirmPasswordValid,
        messageStatus,
        isFirstNameValid,
        isLastNameValid,
        middleName,
        address,
        highestEducation,
        degreeName,
        schoolName,
        isEditing,
        experience,
        avatar,
        allSkills,
        skillSelected,
        description,
        yearsExps,
        notify,
        headline,
        addrFull,
        addrStreet,
        addrDistrict,
        addrState,
        addrLat,
        addrLng,
        types,
        skills,
        isUpdateSuccess,
        firstNameAvatar,
        lastNameAvatar,
        location,
        exps,
        resume,
        yearsExpSelected,
        edus,
        certs,
        affs,
      ];
}
