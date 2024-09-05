import 'package:flutter/material.dart';
import 'package:childcaresoftware/screens/screens.dart';

class MessageRouter extends StatelessWidget {
  final navigatorKey = GlobalKey<NavigatorState>();
  static const String MESSAGE_SCREEN = 'message_screen';
  static const String SEND_MESSAGE_SCREEN = 'send_message_screen';

  @override
  Widget build(BuildContext context) {
    return Navigator(
        key: navigatorKey,
        initialRoute: MESSAGE_SCREEN,
        onGenerateRoute: (message) {
          Widget _screen;
          switch (message.name) {
            case MESSAGE_SCREEN:
              _screen = MessageScreen();
              break;
            case SEND_MESSAGE_SCREEN:
              _screen = SendMessageScreen();
              break;
          }
          return MaterialPageRoute(builder: (context) => _screen);
        });
  }
}
