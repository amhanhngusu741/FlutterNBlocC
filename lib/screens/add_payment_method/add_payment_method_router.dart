import 'package:flutter/material.dart';
import 'package:childcaresoftware/screens/screens.dart';

class AddPaymentMethodRouter extends StatelessWidget {
  final navigatorKey = GlobalKey<NavigatorState>();
  static const String ADD_PAYMENT_METHOD_SCREEN = 'add_payment_method_screen';

  @override
  Widget build(BuildContext context) {
    return Navigator(
        key: navigatorKey,
        initialRoute: ADD_PAYMENT_METHOD_SCREEN,
        onGenerateRoute: (addPaymentMethodRouter) {
          Widget _screen;
          switch (addPaymentMethodRouter.name) {
            case ADD_PAYMENT_METHOD_SCREEN:
              _screen = AddPaymentMethodScreen();
              break;
          }
          return MaterialPageRoute(builder: (context) => _screen);
        });
  }
}
