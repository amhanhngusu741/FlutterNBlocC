import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:childcaresoftware/blocs/blocs.dart';
import 'package:childcaresoftware/constants/color.dart';
import 'package:childcaresoftware/router.dart';
import 'package:childcaresoftware/widgets/widgets.dart';

class PasswordResetSuccessScreen extends StatelessWidget {
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
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: BlocProvider(
          create: (context) {
            return ForgotPasswordBloc();
          },
          child: BlocListener<ForgotPasswordBloc, ForgotPasswordState>(
            listener: (context, state) {},
            child: Column(
              children: [
                Icon(
                  Icons.check_circle_outline,
                  color: AppColors.PRIMARY,
                  size: 100.0,
                ),
                SizedBox(height: 20),
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    'Password reset successful',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.PRIMARY,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  child: Text(
                    'You have successfully reset your password. Please use your new password when logging in.',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: AppColors.PRIMARY, fontSize: 15),
                  ),
                ),
                SizedBox(height: 30),
                _BackToLoginButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _BackToLoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ForgotPasswordBloc, ForgotPasswordState>(
      builder: (context, state) {
        return Button(
            label: 'Back to login',
            flex: 1,
            onPress: () {
              Navigator.of(context)
                  .pushNamedAndRemoveUntil(AppRouter.LOGIN, (t) => false);
            });
      },
    );
  }
}
