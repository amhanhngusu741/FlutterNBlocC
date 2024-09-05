import 'dart:async';

import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:childcaresoftware/constants/color.dart';
import 'package:childcaresoftware/repositories/settings_repository.dart';
import 'package:childcaresoftware/router.dart';
import 'package:childcaresoftware/service_locator.dart';

class OnBoardingScreen extends StatefulWidget {
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final introKey = GlobalKey<IntroductionScreenState>();
  Timer timer;

  @override
  void initState() {
    super.initState();
    timer = Timer(Duration(seconds: 3), () {
      introKey.currentState.controller.nextPage(
          duration: Duration(milliseconds: 250), curve: Curves.easeIn);
    });
  }

  Future<void> _onIntroEnd(context) async {
    await locator<SettingsRepository>().saveFirstTime(false);
    Navigator.pushNamed(context, AppRouter.LOGIN);
  }

  Widget _buildImage(String assetName) {
    return Align(
      child: Image.asset('assets/images/$assetName.jpg', width: 350.0),
      alignment: Alignment.bottomCenter,
    );
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);
    const pageDecoration = const PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,
      pages: [
        PageViewModel(
          title: "Get paid right after you finish your work.",
          body: "Get up to \$100 a day",
          image: _buildImage('img1'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Pay what you feel is fair to keep the KI community running.",
          body: "No hidden fees or costs",
          image: _buildImage('img2'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Join millions striving to improve their finances.",
          body: "Be part of KI community",
          image: _buildImage('img3'),
          decoration: pageDecoration,
        ),
      ],
      onDone: () => _onIntroEnd(context),
      onChange: (value) {
        timer.cancel();
        if (value < 2) {
          timer = Timer(Duration(seconds: 3), () {
            introKey.currentState.controller.nextPage(
                duration: Duration(milliseconds: 250), curve: Curves.easeIn);
          });
        }
      },

      skipOrBackFlex: 0,
      nextFlex: 0,
      skip: const Text(
        'Skip',
        style: TextStyle(fontSize: 16),
      ),
      next: const Text(
        'Next',
        style: TextStyle(
            color: AppColors.PRIMARY,
            fontWeight: FontWeight.bold,
            fontSize: 16),
      ),
      done: const Text('Log in',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: AppColors.PRIMARY,
          )),
      // done: FlatButton(
      //   color: Colors.red,
      //   onPressed: null,
      //   child: Text(
      //     "",
      //   ),
      // ),
      showNextButton: true,
      showSkipButton: true,
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeColor: AppColors.PRIMARY,
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
  }
}
