import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:childcaresoftware/blocs/blocs.dart';
import 'package:childcaresoftware/commons/dialogs.dart';
import 'package:childcaresoftware/constants/color.dart';
import 'package:childcaresoftware/constants/form_status.dart';
import 'package:childcaresoftware/router.dart';
import 'package:childcaresoftware/widgets/widgets.dart';

class ActivateVerifyCodeScreen extends StatelessWidget {
  const ActivateVerifyCodeScreen({this.email});

  final String email;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        iconTheme: IconThemeData(color: AppColors.PRIMARY),
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: BlocProvider(
          create: (context) {
            return VerifyCodeRegisterBloc(email: this.email);
          },
          child: BlocListener<VerifyCodeRegisterBloc, VerifyCodeRegisterState>(
            listener: (context, state) {
              switch (state.status) {
                case FormStatus.submissionInProgress:
                  Dialogs.showLoadingDialog(context);
                  break;
                case FormStatus.submissionSuccess:
                  Dialogs.hideDialog(context);
                  Navigator.pushNamed(context, AppRouter.LOGIN, arguments: {});
                  break;
                case FormStatus.submissionFailure:
                  Dialogs.hideDialog(context);
                  Dialogs.showErrorDialog(context, state.messageStatus);
                  break;
                default:
              }
            },
            child: Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Enter the 6-digit activation code',
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
                    'Please check your email inbox. We have sent you a 6-digit activation code.',
                    style: TextStyle(color: AppColors.PRIMARY, fontSize: 15),
                  ),
                ),
                SizedBox(height: 30),
                _OTPCodeField(),
                SizedBox(height: 30),
                _ActivateButton(),
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
        context
            .read<VerifyCodeRegisterBloc>()
            .add(VerifyCodeRegisterOTPChanged(otp: value));
      },
    );
  }
}

class _ActivateButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VerifyCodeRegisterBloc, VerifyCodeRegisterState>(
      builder: (context, state) {
        return Button(
            label: 'Activate',
            flex: 1,
            onPress: () {
              context
                  .read<VerifyCodeRegisterBloc>()
                  .add(VerifyCodeRegisterSubmitted());
            });
      },
    );
  }
}
