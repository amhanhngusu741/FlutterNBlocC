import 'package:flutter/material.dart';
import 'package:childcaresoftware/screens/screens.dart';

class NotificationRouter extends StatelessWidget {
  final navigatorKey = GlobalKey<NavigatorState>();
  static const String NOTIFICATION_LIST = 'notification_list';
  static const String JOBS_DETAIL = 'search_jobs_detail';

  @override
  Widget build(BuildContext context) {
    return Navigator(
        key: navigatorKey,
        initialRoute: NOTIFICATION_LIST,
        onGenerateRoute: (settings) {
          Widget _screen;
          switch (settings.name) {
            case NOTIFICATION_LIST:
              _screen = NotificationsScreen();
              break;
            // case JOBS_DETAIL:
            //   final JobDetailScreenArguments args = settings.arguments;
            //   _screen = JobDetailScreen(
            //     jobId: args.jobId,
            //     positionId: args.positionId,
            //   );
            //   break;
          }
          return MaterialPageRoute(builder: (context) => _screen);
        });
  }
}
