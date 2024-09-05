import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:childcaresoftware/blocs/settings/change_password/change_password_bloc.dart';
import 'package:childcaresoftware/commons/dialogs.dart';
import 'package:childcaresoftware/commons/validator.dart';
import 'package:childcaresoftware/constants/color.dart';
import 'package:childcaresoftware/constants/form_status.dart';
import 'package:childcaresoftware/widgets/widgets.dart';

class ChangePasswordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBar(
        label: 'Change Password',
      ),
      body: BlocProvider(
        create: (context) {
          return ChangePasswordBloc();
        },
        child: BlocListener<ChangePasswordBloc, ChangePasswordState>(
          listenWhen: (previous, current) => previous.status != current.status,
          listener: (context, state) {
            switch (state.status) {
              case FormStatus.submissionInProgress:
                Dialogs.showLoadingDialog(context);
                break;
              case FormStatus.submissionSuccess:
                Dialogs.hideDialog(context);
                Dialogs.showAlertDialog(
                    context, 'Update password successfully.', () {
                  Navigator.of(context).pop();
                });
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
                      'Change Password',
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
                  _OldPasswordInput(),
                  _PasswordInput(),
                  _ConfirmPasswordInput(),
                  SizedBox(height: 30),
                  _UpdatePasswordButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _UpdatePasswordButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChangePasswordBloc, ChangePasswordState>(
      builder: (context, state) {
        return Button(
            label: 'Update Password',
            flex: 1,
            onPress: () {
              if (Form.of(context).validate()) {
                context
                    .read<ChangePasswordBloc>()
                    .add(ChangePasswordSubmitted());
              }
            });
      },
    );
  }
}

class _OldPasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChangePasswordBloc, ChangePasswordState>(
      builder: (context, state) {
        return TextFormField(
          obscureText: state.isOldPasswordVisible,
          decoration: InputDecoration(
            labelText: 'Current Password',
            prefixIcon: Icon(
              Icons.lock,
              color: AppColors.PRIMARY,
            ),
            suffixIcon: IconButton(
              icon: Icon(
                state.isOldPasswordVisible
                    ? Icons.visibility
                    : Icons.visibility_off,
                color: AppColors.PRIMARY,
              ),
              onPressed: () {
                context.read<ChangePasswordBloc>().add(
                    OldPasswordVisibleChanged(
                        isVisible: !state.isOldPasswordVisible));
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
              .read<ChangePasswordBloc>()
              .add(OldPasswordChanged(password: value)),
        );
      },
    );
  }
}

class _PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChangePasswordBloc, ChangePasswordState>(
      builder: (context, state) {
        return TextFormField(
          obscureText: state.isPasswordVisible,
          decoration: InputDecoration(
            labelText: 'New Password',
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
                context.read<ChangePasswordBloc>().add(
                    NewPasswordVisibleChanged(
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
              .read<ChangePasswordBloc>()
              .add(NewPasswordChanged(password: value)),
        );
      },
    );
  }
}

class _ConfirmPasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChangePasswordBloc, ChangePasswordState>(
      builder: (context, state) {
        return TextFormField(
          obscureText: state.isConfirmPasswordVisible,
          decoration: InputDecoration(
            labelText: 'Confirm New Password',
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
                context.read<ChangePasswordBloc>().add(
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
              .read<ChangePasswordBloc>()
              .add(NewConfirmPasswordChanged(confirmPassword: value)),
        );
      },
    );
  }
}
