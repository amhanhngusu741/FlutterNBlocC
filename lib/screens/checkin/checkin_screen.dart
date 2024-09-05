import 'package:childcaresoftware/screens/checkin/checkin_router.dart';
import 'package:childcaresoftware/widgets/dropdown_label.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:childcaresoftware/widgets/top_bar.dart';
import 'package:flutter_html/style.dart';
import 'package:package_info/package_info.dart';
import 'package:childcaresoftware/blocs/blocs.dart';
import 'package:childcaresoftware/commons/dialogs.dart';
import 'package:childcaresoftware/constants/color.dart';
import 'package:childcaresoftware/router.dart';
import 'dart:async';
import 'package:flutter_svg/avd.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../widgets/widgets.dart';
import '../checkout/checkout_router.dart';
import '../payment/payment_router.dart';

const List<String> _assetNames = <String>[
  // 'assets/notfound.svg', // uncomment to test an asset that doesn't exist.
  'assets/icon/icon1.svg',
  'assets/icon/icon2.svg',
  'assets/icon/icon3.svg',
];

class CheckInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBar(
        label: 'Home',
        isShowBackButton: false,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
        child: _CheckInScreen(),
      ),
    );
  }
}

class _CheckInScreen extends StatefulWidget {
  const _CheckInScreen({
    Key key,
  }) : super(key: key);

  @override
  _CheckInScreenState createState() => _CheckInScreenState();
}

class _CheckInScreenState extends State<_CheckInScreen> {
  double _dimension;
  final List<Widget> _painters = <Widget>[];
  @override
  void initState() {
    super.initState();
    // _dimension = 203.0;
    for (String assetName in _assetNames) {
      _painters.add(
        SvgPicture.asset(assetName),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            width: MediaQuery.of(context).size.width / 4,
            height: MediaQuery.of(context).size.width / 4,
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: AppColors.WHITE,
              boxShadow: [
                BoxShadow(
                    color: Color.fromRGBO(235, 238, 241, 1), spreadRadius: 1),
              ],
            ),
            child: CircleAvatar(
              radius: 0,
              backgroundColor: Colors.red,
              child: ClipOval(child: Image.asset('assets/images/avt1.jpeg')),
            )),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextButton(
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(
                    EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                  ),
                  backgroundColor:
                      MaterialStateProperty.all(AppColors.GREEN_BUTTON),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    // side: BorderSide(color: Colors.red)
                  ),
                ),
                onPressed: () => {
                  Navigator.pushNamed(context, CheckInRouter.CHECKOUT_SCREEN)
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => CheckOutRouter()),
                  // )
                },
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.login_outlined,
                      color: AppColors.WHITE,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "CHECK IN",
                      style: TextStyle(color: AppColors.WHITE),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 5),
          child: DropdownLable(
            label: "",
            rate: [0, 10],
            value: "All Activities",
            valueList: [
              "All Activities",
            ],
          ),
        ),
        Text(
          "Oh no! looks like there is no activity yet.",
          style: TextStyle(color: AppColors.GREY_COLOR, fontSize: 15),
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
