import 'package:flutter/material.dart';
import 'package:childcaresoftware/screens/screens.dart';

class LearningRouter extends StatelessWidget {
  final navigatorKey = GlobalKey<NavigatorState>();
  static const String LEARNING_SCREEN = 'learning_screen';

  @override
  Widget build(BuildContext context) {
    return Navigator(
        key: navigatorKey,
        initialRoute: LEARNING_SCREEN,
        onGenerateRoute: (learningRouter) {
          Widget _screen;
          switch (learningRouter.name) {
            case LEARNING_SCREEN:
              _screen = LearningScreen();
              break;
          }
          return MaterialPageRoute(builder: (context) => _screen);
        });
  }
}
