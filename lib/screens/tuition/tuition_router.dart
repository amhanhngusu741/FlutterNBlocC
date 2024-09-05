import 'package:flutter/material.dart';
import 'package:childcaresoftware/screens/screens.dart';

class TuitionRouter extends StatelessWidget {
  final navigatorKey = GlobalKey<NavigatorState>();
  static const String TUITION_SCREEN = 'tuition_screen';

  @override
  Widget build(BuildContext context) {
    return Navigator(
        key: navigatorKey,
        initialRoute: TUITION_SCREEN,
        onGenerateRoute: (tuitionRouter) {
          Widget _screen;
          switch (tuitionRouter.name) {
            case TUITION_SCREEN:
              _screen = TuitionScreen();
              break;
          }
          return MaterialPageRoute(builder: (context) => _screen);
        });
  }
}
