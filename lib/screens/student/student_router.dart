import 'package:flutter/material.dart';
import 'package:childcaresoftware/screens/screens.dart';

class StudentRouter extends StatelessWidget {
  final navigatorKey = GlobalKey<NavigatorState>();
  static const String STUDENT_SCREEN = 'student_screen';

  @override
  Widget build(BuildContext context) {
    return Navigator(
        key: navigatorKey,
        initialRoute: STUDENT_SCREEN,
        onGenerateRoute: (settings) {
          Widget _screen;
          switch (settings.name) {
            case STUDENT_SCREEN:
              _screen = StudentScreen();
              break;
          }
          return MaterialPageRoute(builder: (context) => _screen);
        });
  }
}
