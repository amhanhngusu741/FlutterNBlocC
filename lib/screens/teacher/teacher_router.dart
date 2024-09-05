import 'package:flutter/material.dart';
import 'package:childcaresoftware/screens/screens.dart';

class TeacherRouter extends StatelessWidget {
  final navigatorKey = GlobalKey<NavigatorState>();
  static const String TEACHER_SCREEN = 'teacher_screen';

  @override
  Widget build(BuildContext context) {
    return Navigator(
        key: navigatorKey,
        initialRoute: TEACHER_SCREEN,
        onGenerateRoute: (teacherRouter) {
          Widget _screen;
          switch (teacherRouter.name) {
            case TEACHER_SCREEN:
              _screen = TeacherScreen();
              break;
          }
          return MaterialPageRoute(builder: (context) => _screen);
        });
  }
}
