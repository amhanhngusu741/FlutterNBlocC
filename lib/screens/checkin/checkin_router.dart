import 'package:flutter/material.dart';
import 'package:childcaresoftware/screens/screens.dart';

class CheckInRouter extends StatelessWidget {
  final navigatorKey = GlobalKey<NavigatorState>();
  static const String CHECKIN_SCREEN = 'checkin_screen';
  static const String CHECKOUT_SCREEN = 'checkout_screen';

  @override
  Widget build(BuildContext context) {
    return Navigator(
        key: navigatorKey,
        initialRoute: CHECKIN_SCREEN,
        onGenerateRoute: (checkInRouter) {
          Widget _screen;
          switch (checkInRouter.name) {
            case CHECKIN_SCREEN:
              _screen = CheckInScreen();
              break;
            case CHECKOUT_SCREEN:
              _screen = CheckOutScreen();
              break;
          }
          return MaterialPageRoute(builder: (context) => _screen);
        });
  }
}
