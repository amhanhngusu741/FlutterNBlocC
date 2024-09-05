import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:childcaresoftware/blocs/blocs.dart';
import 'package:childcaresoftware/commons/dialogs.dart';
import 'package:childcaresoftware/constants/color.dart';
import 'package:childcaresoftware/constants/form_status.dart';
import 'package:childcaresoftware/router.dart';
import 'package:childcaresoftware/screens/screens.dart';
import 'package:childcaresoftware/widgets/widgets.dart';

class VerifyCodeScreen extends StatelessWidget {
  const VerifyCodeScreen({this.email});

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
          return VerifyCodeBloc(email: this.email);
        },
        child: BlocListener<VerifyCodeBloc, VerifyCodeState>(
          listenWhen: (previous, current) => previous.status != current.status,
          listener: (context, state) {
            switch (state.status) {
              case FormStatus.submissionInProgress:
                Dialogs.showLoadingDialog(context);
                break;
              case FormStatus.submissionSuccess:
                Dialogs.hideDialog(context);
                Navigator.pushNamed(context, AppRouter.NEW_PASSWORD,
                    arguments: NewPasswordScreenArguments(email: this.email));
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
            child: Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Enter 6-digit recovery code',
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
                    'Please check your email inbox, we have sent you a 6 digit verification code for you to successfully update your password',
                    style: TextStyle(color: AppColors.PRIMARY, fontSize: 15),
                  ),
                ),
                SizedBox(height: 30),
                // _EmailInput(),
                _OTPCodeField(),
                SizedBox(height: 30),
                _NextButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _OTPCodeField extends StatefulWidget {
  const _OTPCodeField({
    Key key,
  }) : super(key: key);

  @override
  __OTPCodeFieldState createState() => __OTPCodeFieldState();
}

class __OTPCodeFieldState extends State<_OTPCodeField>
    with WidgetsBindingObserver {
  FocusNode focusNode;
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    focusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.addObserver(this);
  }

  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      if (mounted) {
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
          await Future.delayed(Duration(milliseconds: 200));
          if (focusNode.hasFocus) {
            focusNode.unfocus();
            Future.delayed(const Duration(microseconds: 1),
                () => FocusScope.of(context).requestFocus(focusNode));
          } else {
            FocusScope.of(context).requestFocus(focusNode);
          }
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      textInputType: TextInputType.number,
      focusNode: focusNode,
      length: 6,
      obsecureText: false,
      animationType: AnimationType.scale,
      shape: PinCodeFieldShape.box,
      animationDuration: Duration(milliseconds: 300),
      borderRadius: BorderRadius.circular(5),
      fieldHeight: 50,
      fieldWidth: 40,
      onChanged: (value) {
        context.read<VerifyCodeBloc>().add(VerifyCodeOTPChanged(otp: value));
      },
    );
  }
}

class _NextButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VerifyCodeBloc, VerifyCodeState>(
      builder: (context, state) {
        return Button(
            label: 'Next',
            flex: 1,
            onPress: () {
              context.read<VerifyCodeBloc>().add(VerifyCodeSubmitted());
            });
      },
    );
  }
}

class VerifyCodeScreenArguments {
  final String email;

  VerifyCodeScreenArguments({this.email});
}
