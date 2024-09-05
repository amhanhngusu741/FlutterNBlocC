import 'package:flutter/material.dart';
import 'package:childcaresoftware/screens/screens.dart';

class ActivityRouter extends StatelessWidget {
  // final activityKey = GlobalKey<NavigatorState>();
  static const String ACTIVITY_SCREEN = 'activity_screen';

  @override
  Widget build(BuildContext context) {
    return Navigator(
        // key: activityKey,
        initialRoute: ACTIVITY_SCREEN,
        onGenerateRoute: (activityRouter) {
          Widget _screen;
          switch (activityRouter.name) {
            case ACTIVITY_SCREEN:
              _screen = ActivityScreen();
              break;
          }
          return MaterialPageRoute(builder: (context) => _screen);
        });
  }
}
