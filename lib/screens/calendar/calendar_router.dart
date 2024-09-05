import 'package:flutter/material.dart';
import 'package:childcaresoftware/screens/screens.dart';

class CalendarRouter extends StatelessWidget {
  final navigatorKey = GlobalKey<NavigatorState>();
  static const String CALENDAR_SCREEN = 'calendar_screen';

  @override
  Widget build(BuildContext context) {
    return Navigator(
        key: navigatorKey,
        initialRoute: CALENDAR_SCREEN,
        onGenerateRoute: (calendarRouter) {
          Widget _screen;
          switch (calendarRouter.name) {
            case CALENDAR_SCREEN:
              _screen = CalendarScreen();
              break;
          }
          return MaterialPageRoute(builder: (context) => _screen);
        });
  }
}
