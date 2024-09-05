import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:childcaresoftware/blocs/blocs.dart';
import 'package:childcaresoftware/commons/dialogs.dart';
import 'package:childcaresoftware/constants/color.dart';
import 'package:childcaresoftware/constants/form_status.dart';
import 'package:childcaresoftware/widgets/widgets.dart';
import '../../widgets/widgets.dart';
import '../../router.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: TopBar(
          label: 'Register',
        ),
        body: Padding(
            padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
            child: BlocProvider(
              create: (context) {
                return RegisterBloc();
              },
              child: BlocListener<RegisterBloc, RegisterState>(
                listener: (context, state) {
                  switch (state.status) {
                    case FormStatus.submissionInProgress:
                      Dialogs.showLoadingDialog(context);
                      break;
                    case FormStatus.submissionSuccess:
                      Dialogs.hideDialog(context);
                      // Navigator.pushNamed(
                      //     context, AppRouter.ACTIVATE_VERIFY_CODE,
                      //     arguments: state.email);
                      Dialogs.showAlertDialog(
                        context,
                        'Account successfully created',
                        () {
                          Navigator.pushNamed(
                            context, AppRouter.LOGIN,
                            // arguments: VerifyCodeScreenArguments(email: state.email)
                          );
                        },
                      );
                      break;
                    case FormStatus.submissionFailure:
                      Dialogs.hideDialog(context);
                      Dialogs.showErrorDialog(context, state.messageStatus);
                      break;
                    default:
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.all(0),
                  child: Align(
                    alignment: const Alignment(0.2, 0.6),
                    child: Form(
                      child: ListView(
                        // mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Create a Child Care Software',
                                style: TextStyle(
                                  color: AppColors.PRIMARY,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Account',
                                style: TextStyle(
                                  color: AppColors.PRIMARY,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                ),
                              ),
                            ],
                          ),
                          // Padding(
                          //     padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                          //     child: Text(
                          //       'Continue your staffing journey by creating an account with your name, email address, and password',
                          //       style: TextStyle(
                          //           color: AppColors.PRIMARY,
                          //           // fontWeight: FontWeight.bold,
                          //           fontSize: 15),
                          //     )),
                          _FirstNameInput(),
                          _LastNameInput(),
                          _PhoneInput(),
                          _EmailAddressInput(),
                          _PasswordInput(),
                          _PasswordConfirmInput(),
                          _ReferralCodeInput(),
                          SizedBox(height: 30),
                          _RegisterButton(),
                          SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ),
                ),
                // );
                // }),
              ),
            )));
  }
}

class _FirstNameInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(
      builder: (context, state) {
        // _firstNameController.text = state.firstName;
        return TextFormField(
          decoration: InputDecoration(
              labelText: 'First Name',
              prefixIcon: Icon(
                Icons.person,
                color: AppColors.PRIMARY,
              )),
          onChanged: (value) => context
              .read<RegisterBloc>()
              .add(RegisterFirstNameChangeEvent(firstName: value)),
          validator: (value) {
            if (!state.isFirstNameValid) {
              return 'Invalid First Name';
            }
            return null;
          },
        );
      },
    );
  }

  // final TextEditingController _firstNameController =
  //     new TextEditingController();
}

class _LastNameInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(
      builder: (context, state) {
        // _lastNameController.text = state.lastName;
        return TextFormField(
          decoration: InputDecoration(
              labelText: 'Last Name',
              prefixIcon: Icon(
                Icons.person,
                color: AppColors.PRIMARY,
              )),
          // controller: _lastNameController,
          onChanged: (value) => context
              .read<RegisterBloc>()
              .add(RegisterLastNameChangeEvent(lastName: value)),
          validator: (value) {
            if (!state.isLastNameValid) {
              return 'Invalid Last Name';
            }
            return null;
          },
        );
      },
    );
  }

  // final TextEditingController _lastNameController = new TextEditingController();
}

class _EmailAddressInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(
      builder: (context, state) {
        // _emailController.text = state.email;
        return TextFormField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
              labelText: 'Email Address',
              prefixIcon: Icon(
                Icons.email,
                color: AppColors.PRIMARY,
              )),
          // controller: _emailController,
          validator: (value) {
            if (!state.isEmailValid) {
              return 'Invalid Email';
            }
            return null;
          },
          onChanged: (value) => context
              .read<RegisterBloc>()
              .add(EmailRegisterChanged(email: value)),
        );
      },
    );
  }

  // final TextEditingController _emailController = new TextEditingController();
}

// class _PhoneNumberInput extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<RegisterBloc, RegisterState>(
//       builder: (context, state) {
//         _phoneController.text = state.phone;
//         return TextField(
//           keyboardType: TextInputType.phone,
//           decoration: InputDecoration(
//               labelText: 'Phone Number',
//               prefixIcon: Icon(
//                 Icons.phone,
//                 color: AppColors.PRIMARY,
//               )),
//           controller: _phoneController,
//         );
//       },
//     );
//   }

//   final TextEditingController _phoneController = new TextEditingController();
// }

class _PasswordInput extends StatefulWidget {
  @override
  PasswordInput createState() => new PasswordInput();

  // Stateful Widgets are rarely more complicated than this.
}

class PasswordInput extends State<_PasswordInput> {
  bool passwordVisible = true;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(
      builder: (context, state) {
        return TextFormField(
          obscureText: passwordVisible,
          decoration: InputDecoration(
            labelText: 'Password',
            prefixIcon: Icon(
              Icons.lock,
              color: AppColors.PRIMARY,
            ),
            suffixIcon: IconButton(
              icon: Icon(
                // Icons.visibility,
                passwordVisible ? Icons.visibility : Icons.visibility_off,
                color: AppColors.PRIMARY,
              ),
              onPressed: () {
                setState(() {
                  passwordVisible = !passwordVisible;
                });
              },
            ),
          ),
          validator: (value) {
            if (!state.isPasswordValid) {
              return 'Invalid Password';
            }
            return null;
          },
          onChanged: (value) => context
              .read<RegisterBloc>()
              .add(PasswordRegisterChanged(password: value)),
        );
      },
    );
  }
}

class _PasswordConfirmInput extends StatefulWidget {
  @override
  PasswordConfirmInput createState() => new PasswordConfirmInput();

  // Stateful Widgets are rarely more complicated than this.
}

class PasswordConfirmInput extends State<_PasswordConfirmInput> {
  bool confirmPasswordVisible = true;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(
      builder: (context, state) {
        return TextFormField(
          obscureText: confirmPasswordVisible,
          decoration: InputDecoration(
            labelText: 'Confirm Password',
            prefixIcon: Icon(
              Icons.lock,
              color: AppColors.PRIMARY,
            ),
            suffixIcon: IconButton(
              icon: Icon(
                // Icons.visibility,
                confirmPasswordVisible
                    ? Icons.visibility
                    : Icons.visibility_off,
                color: AppColors.PRIMARY,
              ),
              onPressed: () {
                setState(() {
                  confirmPasswordVisible = !confirmPasswordVisible;
                });
              },
            ),
          ),
          validator: (value) {
            if (!state.isConfirmPasswordValid) {
              return 'Invalid Confirm Password';
            }
            return null;
          },
          onChanged: (value) => context.read<RegisterBloc>().add(
              ConfirmPasswordRegisterChanged(
                  confirmPassword: value, password: state.password)),
        );
      },
    );
  }
}

class _ReferralCodeInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(
      builder: (context, state) {
        return TextFormField(
          decoration: InputDecoration(
              labelText: 'Referral Code',
              prefixIcon: Icon(
                Icons.code,
                color: AppColors.PRIMARY,
              )),
          onChanged: (value) => context
              .read<RegisterBloc>()
              .add(ReferralCodeChanged(referralCode: value)),
        );
      },
    );
  }
}

class _PhoneInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(
      builder: (context, state) {
        return IntlPhoneField(
          decoration: InputDecoration(
            labelText: 'Phone Number',
          ),
          onChanged: (phone) => context
              .read<RegisterBloc>()
              .add(PhoneNumberChanged(phoneNumber: phone.completeNumber)),
        );
      },
    );
  }
}

class _RegisterButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(
      builder: (context, state) {
        return Button(
            label: 'Start Your 14 Days Free Trail Today!',
            flex: 1,
            onPress: () {
              if (Form.of(context).validate()) {
                sendInfoToAnalytics(
                    state.email, state.firstName, state.lastName);
                context.read<RegisterBloc>().add(RegisterSubmitted());
              }
            });
      },
    );
  }

  void sendInfoToAnalytics(String email, String firstName, String lastName) {
    // MyApp.observer.analytics.logEvent(
    //   name: 'Register Screen',
    //   parameters: <String, dynamic>{
    //     'email': email,
    //     'firstName': firstName,
    //     'lastName': lastName,
    //   },
    // );
  }
}
