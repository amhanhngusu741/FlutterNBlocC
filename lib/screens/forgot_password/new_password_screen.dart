import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:childcaresoftware/blocs/forgot_password/new_password/new_password_bloc.dart';
import 'package:childcaresoftware/commons/dialogs.dart';
import 'package:childcaresoftware/commons/validator.dart';
import 'package:childcaresoftware/constants/color.dart';
import 'package:childcaresoftware/constants/form_status.dart';
import 'package:childcaresoftware/router.dart';
import 'package:childcaresoftware/widgets/widgets.dart';

class NewPasswordScreen extends StatelessWidget {
  const NewPasswordScreen({this.email});
  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        iconTheme: IconThemeData(color: AppColors.PRIMARY),
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            // Image.asset(
            //   'assets/images/ki-logo.png',
            //   height: 38,
            // ),
            Text(
              'Keyword',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: AppColors.BLACK,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            Text(
              'Inspector',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: AppColors.PRIMARY,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          ],
        ),
        elevation: 0.0,
      ),
      body: BlocProvider(
        create: (context) {
          return NewPasswordBloc(email: this.email);
        },
        child: BlocListener<NewPasswordBloc, NewPasswordState>(
          listenWhen: (previous, current) => previous.status != current.status,
          listener: (context, state) {
            switch (state.status) {
              case FormStatus.submissionInProgress:
                Dialogs.showLoadingDialog(context);
                break;
              case FormStatus.submissionSuccess:
                Dialogs.hideDialog(context);
                Navigator.of(context).pushNamedAndRemoveUntil(
                    AppRouter.PASSWORD_RESET_SUCCESS, (t) => false);
                break;
              case FormStatus.submissionFailure:
                Dialogs.hideDialog(context);
                Dialogs.showErrorDialog(context, state.messageStatus);
                break;
              default:
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Form(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Enter New Password',
                      style: TextStyle(
                        color: AppColors.PRIMARY,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Please enter a new password',
                      style: TextStyle(color: AppColors.PRIMARY, fontSize: 15),
                    ),
                  ),
                  SizedBox(height: 30),
                  _PasswordInput(),
                  _ConfirmPasswordInput(),
                  SizedBox(height: 30),
                  _NextButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _NextButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewPasswordBloc, NewPasswordState>(
      builder: (context, state) {
        return Button(
            label: 'Next',
            flex: 1,
            onPress: () {
              if (Form.of(context).validate()) {
                context.read<NewPasswordBloc>().add(NewPasswordSubmitted());
              }
            });
      },
    );
  }
}

class _PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewPasswordBloc, NewPasswordState>(
      builder: (context, state) {
        return TextFormField(
          obscureText: state.isPasswordVisible,
          decoration: InputDecoration(
            labelText: 'Password',
            prefixIcon: Icon(
              Icons.lock,
              color: AppColors.PRIMARY,
            ),
            suffixIcon: IconButton(
              icon: Icon(
                state.isPasswordVisible
                    ? Icons.visibility
                    : Icons.visibility_off,
                color: AppColors.PRIMARY,
              ),
              onPressed: () {
                context.read<NewPasswordBloc>().add(NewPasswordVisibleChanged(
                    isVisible: !state.isPasswordVisible));
              },
            ),
          ),
          validator: (value) {
            if (!Validators.isRequiredField(value)) {
              return 'Invalid Password';
            }
            return null;
          },
          onChanged: (value) => context
              .read<NewPasswordBloc>()
              .add(NewPasswordChanged(password: value)),
        );
      },
    );
  }
}

class _ConfirmPasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewPasswordBloc, NewPasswordState>(
      builder: (context, state) {
        return TextFormField(
          obscureText: state.isConfirmPasswordVisible,
          decoration: InputDecoration(
            labelText: 'Confirm Password',
            prefixIcon: Icon(
              Icons.lock,
              color: AppColors.PRIMARY,
            ),
            suffixIcon: IconButton(
              icon: Icon(
                state.isConfirmPasswordVisible
                    ? Icons.visibility
                    : Icons.visibility_off,
                color: AppColors.PRIMARY,
              ),
              onPressed: () {
                context.read<NewPasswordBloc>().add(
                    NewConfirmPasswordVisibleChanged(
                        isVisible: !state.isConfirmPasswordVisible));
              },
            ),
          ),
          validator: (value) {
            if (!Validators.isMatchText(value, state.password)) {
              return 'Invalid Confirm Password';
            }
            return null;
          },
          onChanged: (value) => context
              .read<NewPasswordBloc>()
              .add(NewConfirmPasswordChanged(confirmPassword: value)),
        );
      },
    );
  }
}

class NewPasswordScreenArguments {
  final String email;

  NewPasswordScreenArguments({this.email});
}
