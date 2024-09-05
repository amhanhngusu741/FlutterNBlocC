import 'package:flutter/material.dart';
import 'package:childcaresoftware/screens/screens.dart';

class SettingRouter extends StatelessWidget {
  final navigatorKey = GlobalKey<NavigatorState>();
  static const String SETTING_SCREEN = 'setting_screen';
  static const String PROFILE_SCREEN = 'profile_screen';

  @override
  Widget build(BuildContext context) {
    return Navigator(
        key: navigatorKey,
        initialRoute: SETTING_SCREEN,
        onGenerateRoute: (settingRouter) {
          Widget _screen;
          switch (settingRouter.name) {
            case SETTING_SCREEN:
              _screen = SettingsScreen();
              break;
            case PROFILE_SCREEN:
              // final JobDetailScreenArguments args = settings.arguments;
              // _screen = JobDetailScreen(
              //   jobId: args.jobId,
              //   positionId: args.positionId,
              // );
              _screen = ProfileScreen();
              break;
          }
          return MaterialPageRoute(builder: (context) => _screen);
        });
  }
}
