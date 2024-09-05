import 'package:childcaresoftware/screens/login/login_screen.dart';
import 'package:childcaresoftware/screens/profile/profile_screen.dart';
import 'package:childcaresoftware/screens/settings/settings_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:childcaresoftware/widgets/top_bar.dart';
import 'package:package_info/package_info.dart';
import 'package:childcaresoftware/blocs/blocs.dart';
import 'package:childcaresoftware/commons/dialogs.dart';
import 'package:childcaresoftware/constants/color.dart';
import 'package:childcaresoftware/router.dart';
import 'dart:async';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBar(
        label: 'Settings',
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 30),
        child: _SettingsScreen(),
      ),
    );
  }
}

class _SettingsScreen extends StatefulWidget {
  const _SettingsScreen({
    Key key,
  }) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<_SettingsScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 10, left: 20, right: 8, bottom: 10),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                // crossAxisAlignment: CrossAxisAlignment.start,
                physics: ClampingScrollPhysics(),
                children: <Widget>[
                  Text(
                    'Account',
                    style: TextStyle(
                        fontSize: 20.0,
                        color: AppColors.PRIMARY,
                        fontWeight: FontWeight.bold),
                  ),
                  ListTile(
                    leading:
                        Icon(Icons.account_circle, color: AppColors.PRIMARY),
                    title: Text('Profile'),
                    trailing: Icon(Icons.keyboard_arrow_right),
                    onTap: () {
                      // Dialogs.showAlertDialog(
                      //     context, 'This feature isn\'t available!', () {});
                      Navigator.of(context)
                          .pushNamed(SettingRouter.PROFILE_SCREEN);
                      // Navigator.push(context,
                      //     MaterialPageRoute(builder: (BuildContext context) {
                      //   return ProfileScreen();
                      // }));
                    },
                  ),

                  ListTile(
                    leading: Icon(Icons.security, color: AppColors.PRIMARY),
                    title: Text('Change Password'),
                    trailing: Icon(Icons.keyboard_arrow_right),
                    onTap: () {
                      Dialogs.showAlertDialog(
                          context, 'This feature isn\'t available!', () {});
                      // Navigator.of(context)
                      //     .pushNamed(SettingRouter.CHANGE_PASSWORD_SCREEN);
                    },
                  ),

                  BlocBuilder<AuthenticationBloc, AuthenticationState>(
                      builder: (contextAuth, stateAuth) {
                    return ListTile(
                      leading:
                          Icon(Icons.exit_to_app, color: AppColors.PRIMARY),
                      title: Text('Logout'),
                      trailing: Icon(Icons.keyboard_arrow_right),
                      onTap: () {
                        Dialogs.showConfirmDialog(context, 'Are you sure?', () {
                          // sendInfoToAnalytics(stateAuth.);
                          BlocProvider.of<AuthenticationBloc>(context)
                              .add(LoggedOut());
                          Navigator.push(context, MaterialPageRoute(
                              builder: (BuildContext context) {
                            return LoginScreen();
                          }));
                        });
                      },
                    );
                  }),

                  // Text(
                  //   'Bills',
                  //   style: TextStyle(
                  //       fontSize: 20.0,
                  //       color: AppColors.PRIMARY,
                  //       fontWeight: FontWeight.bold),
                  // ),
                  // ListTile(
                  //   leading: Icon(Icons.event_note, color: AppColors.PRIMARY),
                  //   title: Text('Billing'),
                  //   trailing: Icon(Icons.keyboard_arrow_right),
                  //   onTap: () {
                  //     Navigator.of(context).pushNamed(AppRouter.BILLING);
                  //   },
                  // ),
                ],
              ),
            ),
            FutureBuilder(
              builder: (context, snapshot) {
                if (snapshot.hasData == false) {
                  return Container();
                }
                return Container(
                  alignment: Alignment.center,
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Child Care Software',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: AppColors.BLACK,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                        ],
                      ),
                      Text('Version ' + snapshot.data.version,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14.0)),
                      Text('Copyright 2022, All Rights Reserved')
                    ],
                  ),
                );
              },
              future: getPackageInfo(),
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
