import 'package:childcaresoftware/screens/dashboard_teacher/dashboard_teacher_screen.dart';
import 'package:flutter/material.dart';
import 'package:childcaresoftware/screens/screens.dart';

class DashboardTeacherRouter extends StatelessWidget {
  final navigatorKey = GlobalKey<NavigatorState>();
  static const String DASHBOARD_TEACHER_SCREEN = 'dashboard_teacher_screen';

  @override
  Widget build(BuildContext context) {
    return Navigator(
        key: navigatorKey,
        initialRoute: DASHBOARD_TEACHER_SCREEN,
        onGenerateRoute: (dashboardTeacherRouter) {
          Widget _screen;
          switch (dashboardTeacherRouter.name) {
            case DASHBOARD_TEACHER_SCREEN:
              _screen = DashboardTeacherScreen();
              break;
          }
          return MaterialPageRoute(builder: (context) => _screen);
        });
  }
}
