import 'package:flutter/material.dart';
import 'package:childcaresoftware/screens/screens.dart';

class PaymentRouter extends StatelessWidget {
  final navigatorKey = GlobalKey<NavigatorState>();
  static const String PAYMENT_SCREEN = 'payment_screen';
  static const String ADD_PAYMENT_METHOD_SCREEN = 'add_payment_method_screen';

  @override
  Widget build(BuildContext context) {
    return Navigator(
        key: navigatorKey,
        initialRoute: PAYMENT_SCREEN,
        onGenerateRoute: (payment) {
          Widget _screen;
          switch (payment.name) {
            case PAYMENT_SCREEN:
              _screen = PaymentScreen();
              break;
            case ADD_PAYMENT_METHOD_SCREEN:
              _screen = SendMessageScreen();
              break;
          }
          return MaterialPageRoute(builder: (context) => _screen);
        });
  }
}
