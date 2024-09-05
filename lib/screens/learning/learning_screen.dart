import 'package:childcaresoftware/widgets/calendar_carousel.dart';
import 'package:childcaresoftware/widgets/dropdown_label.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:childcaresoftware/widgets/top_bar.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:flutter_html/style.dart';
import 'package:package_info/package_info.dart';
import 'package:childcaresoftware/blocs/blocs.dart';
import 'package:childcaresoftware/commons/dialogs.dart';
import 'package:childcaresoftware/constants/color.dart';
import 'package:childcaresoftware/router.dart';
import 'dart:async';
import 'package:flutter_svg/avd.dart';
import 'package:flutter_svg/flutter_svg.dart';

const List<String> _assetNames = <String>[
  // 'assets/notfound.svg', // uncomment to test an asset that doesn't exist.
  'assets/icon/icon1.svg',
  'assets/icon/icon2.svg',
  'assets/icon/icon3.svg',
];

class LearningScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBar(
        label: 'Lesson Plan',
        isShowBackButton: false,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
        child: _LearningScreen(),
      ),
    );
  }
}

class _LearningScreen extends StatefulWidget {
  const _LearningScreen({
    Key key,
  }) : super(key: key);

  @override
  _LearningScreenState createState() => _LearningScreenState();
}

class _LearningScreenState extends State<_LearningScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(left: 5, right: 5),
          decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.LIGHT_GREY,
              ),
              borderRadius: BorderRadius.all(Radius.circular(3.0) //
                  ),
              color: AppColors.WHITE),
          child: CalendarInput(
            type: 1,
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 5, right: 5, top: 30, bottom: 30),
          child: Text(
            "Your provider hasn't shared a lesson plan for this weeek",
            style: TextStyle(color: AppColors.GREY_COLOR, fontSize: 15),
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }

  Future getPackageInfo() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return packageInfo;
  }

  void sendInfoToAnalytics(String email) {
    // MyApp.observer.analytics.logEvent(
    //   name: 'Log out Setting Screen',
    //   parameters: <String, dynamic>{
    //     'email': email,
    //   },
    // );
  }
}
