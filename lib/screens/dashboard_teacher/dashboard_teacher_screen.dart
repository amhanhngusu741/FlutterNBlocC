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

const List<String> _assetNames = <String>[
  // 'assets/notfound.svg', // uncomment to test an asset that doesn't exist.
  'assets/icon/icon1.svg',
  'assets/icon/icon2.svg',
  'assets/icon/icon3.svg',
];

class DashboardTeacherScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBar(
        label: 'Dashboard',
        isShowBackButton: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(0),
        child: _DashboardTeacherScreen(),
      ),
    );
  }
}

class _DashboardTeacherScreen extends StatefulWidget {
  const _DashboardTeacherScreen({
    Key key,
  }) : super(key: key);

  @override
  _DashboardTeacherScreenState createState() => _DashboardTeacherScreenState();
}

class _DashboardTeacherScreenState extends State<_DashboardTeacherScreen> {
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
    return Container(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 60),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Stack(children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width / 3 - 15,
                            // height: 100,
                            child: GridView.extent(
                              shrinkWrap: true,
                              maxCrossAxisExtent:
                                  MediaQuery.of(context).size.width / 3 - 15,
                              children: _painters.sublist(0, 1),
                            ),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.width / 3 - 15,
                            width: MediaQuery.of(context).size.width / 3 - 15,
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.only(top: 30.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Rooms",
                                      style: TextStyle(
                                          color: AppColors.WHITE,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15),
                                    ),
                                    Text(
                                      "-",
                                      style: TextStyle(color: AppColors.WHITE),
                                    ),
                                    Text(
                                      "7 Rooms",
                                      style: TextStyle(color: AppColors.WHITE),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ]),
                      ],
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 5, right: 5),
                          child: Stack(children: <Widget>[
                            Container(
                              width: MediaQuery.of(context).size.width / 3 - 15,
                              // height: 100,
                              child: GridView.extent(
                                shrinkWrap: true,
                                maxCrossAxisExtent:
                                    MediaQuery.of(context).size.width / 3 - 15,
                                children: _painters.sublist(1, 2),
                              ),
                            ),
                            Container(
                              height:
                                  MediaQuery.of(context).size.width / 3 - 15,
                              width: MediaQuery.of(context).size.width / 3 - 15,
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 30.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Messages",
                                        style: TextStyle(
                                            color: AppColors.WHITE,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15),
                                      ),
                                      Text(
                                        "-",
                                        style:
                                            TextStyle(color: AppColors.WHITE),
                                      ),
                                      Text(
                                        "5 unread",
                                        style:
                                            TextStyle(color: AppColors.WHITE),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ]),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Stack(children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width / 3 - 15,
                            // height: 100,
                            child: GridView.extent(
                              shrinkWrap: true,
                              maxCrossAxisExtent:
                                  MediaQuery.of(context).size.width / 3 - 15,
                              children: _painters.sublist(2, 3),
                            ),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.width / 3 - 15,
                            width: MediaQuery.of(context).size.width / 3 - 15,
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.only(top: 30.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Reminders",
                                      style: TextStyle(
                                          color: AppColors.WHITE,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15),
                                    ),
                                    Text(
                                      "-",
                                      style: TextStyle(color: AppColors.WHITE),
                                    ),
                                    Text(
                                      "0 set",
                                      style: TextStyle(color: AppColors.WHITE),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ]),
                      ],
                    ),
                  ]),
            ),
            Column(
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 15),
                  width: MediaQuery.of(context).size.width * 1,
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.all(5),
                        width: MediaQuery.of(context).size.width * 0.1,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Color.fromRGBO(222, 243, 242, 1),
                          boxShadow: [
                            BoxShadow(color: AppColors.WHITE, spreadRadius: 1),
                          ],
                        ),
                        child: Icon(Icons.child_care_outlined,
                            size: 25, color: AppColors.PRIMARY_TRANSPARENT),
                      ),
                      Center(
                        child: Text(
                          'Student',
                          // textScaleFactor: 2,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Color.fromRGBO(235, 238, 241, 1),
                          spreadRadius: 1),
                    ],
                  ),
                  height: 50,
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 15),
                  width: MediaQuery.of(context).size.width * 1,
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.all(5),
                        width: MediaQuery.of(context).size.width * 0.1,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Color.fromRGBO(222, 243, 242, 1),
                          boxShadow: [
                            BoxShadow(color: AppColors.WHITE, spreadRadius: 1),
                          ],
                        ),
                        child: Icon(Icons.corporate_fare_outlined,
                            size: 25, color: AppColors.PRIMARY_TRANSPARENT),
                      ),
                      Center(
                        child: Text(
                          'Ratios',
                          // textScaleFactor: 2,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Color.fromRGBO(235, 238, 241, 1),
                          spreadRadius: 1),
                    ],
                  ),
                  height: 50,
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 15),
                  width: MediaQuery.of(context).size.width * 1,
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.all(5),
                        width: MediaQuery.of(context).size.width * 0.1,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Color.fromRGBO(222, 243, 242, 1),
                          boxShadow: [
                            BoxShadow(color: AppColors.WHITE, spreadRadius: 1),
                          ],
                        ),
                        child: Icon(Icons.people_outline_outlined,
                            size: 25, color: AppColors.PRIMARY_TRANSPARENT),
                      ),
                      Center(
                        child: Text(
                          'Employees',
                          // textScaleFactor: 2,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Color.fromRGBO(235, 238, 241, 1),
                          spreadRadius: 1),
                    ],
                  ),
                  height: 50,
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 15),
                  width: MediaQuery.of(context).size.width * 1,
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.all(5),
                        width: MediaQuery.of(context).size.width * 0.1,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Color.fromRGBO(222, 243, 242, 1),
                          boxShadow: [
                            BoxShadow(color: AppColors.WHITE, spreadRadius: 1),
                          ],
                        ),
                        child: Icon(Icons.wysiwyg_outlined,
                            size: 25, color: AppColors.PRIMARY_TRANSPARENT),
                      ),
                      Center(
                        child: Text(
                          'Billing',
                          // textScaleFactor: 2,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Color.fromRGBO(235, 238, 241, 1),
                          spreadRadius: 1),
                    ],
                  ),
                  height: 50,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 1,
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.all(5),
                        width: MediaQuery.of(context).size.width * 0.1,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Color.fromRGBO(222, 243, 242, 1),
                          boxShadow: [
                            BoxShadow(color: AppColors.WHITE, spreadRadius: 1),
                          ],
                        ),
                        child: Icon(Icons.co_present_outlined,
                            size: 25, color: AppColors.PRIMARY_TRANSPARENT),
                      ),
                      Center(
                        child: Text(
                          'School Profile',
                          // textScaleFactor: 2,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Color.fromRGBO(235, 238, 241, 1),
                          spreadRadius: 1),
                    ],
                  ),
                  height: 50,
                ),
              ],
            ),
          ],
        ));
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
