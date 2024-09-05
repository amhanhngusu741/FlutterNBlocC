import 'package:childcaresoftware/screens/checkout/checkout_screen.dart';
import 'package:flutter/material.dart';
import 'package:childcaresoftware/screens/screens.dart';

class CheckOutRouter extends StatelessWidget {
  final navigatorKey = GlobalKey<NavigatorState>();
  static const String CHECKOUT_SCREEN = 'checkout_screen';

  @override
  Widget build(BuildContext context) {
    return Navigator(
        key: navigatorKey,
        initialRoute: CHECKOUT_SCREEN,
        onGenerateRoute: (checkOutRouter) {
          Widget _screen;
          switch (checkOutRouter.name) {
            case CHECKOUT_SCREEN:
              _screen = CheckOutScreen();
              break;
          }
          return MaterialPageRoute(builder: (context) => _screen);
        });
  }
}
