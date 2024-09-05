// import 'package:firebase_analytics/firebase_analytics.dart';
// import 'package:firebase_analytics/observer.dart';
// import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:childcaresoftware/blocs/blocs.dart';
import 'package:childcaresoftware/constants/color.dart';
import 'package:childcaresoftware/router.dart';
import 'package:childcaresoftware/service_locator.dart';
import 'package:childcaresoftware/services/navigation_service.dart';
import 'package:childcaresoftware/simple_bloc_observer.dart';
// import 'package:firebase_core/firebase_core.dart';

Future<dynamic> myBackgroundMessageHandler(Map<String, dynamic> message) async {
  print("myBackgroundMessageHandler: $message");
  if (message.containsKey('data')) {
    // Handle data message
    final dynamic data = message['data'];
  }

  if (message.containsKey('notification')) {
    // Handle notification message
    final dynamic notification = message['notification'];
  }

  // Or do other work.
}

Future<void> main() async {
  initSystemDefault();
  BlocOverrides.runZoned(
    () {},
    blocObserver: SimpleBlocObserver(),
  );
  setupLocator();
  // FirebaseMessaging firebaseMessaging = FirebaseMessaging();
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();

  // if (kDebugMode) {
  //   await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(false);
  // } else {
  //   await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
  // }
  // FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
  runApp(MyApp());
}

void initSystemDefault() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(statusBarBrightness: Brightness.light),
  );
}

class MyApp extends StatelessWidget {
  GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState get _navigator =>
      locator<NavigationService>().navigatorKey.currentState;
  // This widget is the root of your application.
  // static FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  // static FirebaseAnalyticsObserver observer =
  //     FirebaseAnalyticsObserver(analytics: analytics);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthenticationBloc()..add(AppStarted()),
      child: MaterialApp(
        title: 'ChildCareSoftware',
        // navigatorKey: _navigatorKey,
        navigatorKey: locator<NavigationService>().navigatorKey,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          // primaryColorBrightness: Brightness.light,
          appBarTheme: AppBarTheme(
            // brightness: Brightness.light,
            color: Theme.of(context).scaffoldBackgroundColor,
            iconTheme: IconThemeData(color: AppColors.PRIMARY),
          ),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        builder: (context, child) {
          return BlocListener<AuthenticationBloc, AuthenticationState>(
            listener: (context, state) {
              if (state is Uninitialized) {
                _navigator.pushNamedAndRemoveUntil(
                    AppRouter.SPLASH, (route) => false);
              } else if (state is Unauthenticated) {
                if (state.isFirstTime)
                  _navigator.pushNamedAndRemoveUntil(
                      AppRouter.ONBOARDING, (route) => false);
                else
                  _navigator.pushNamedAndRemoveUntil(
                      AppRouter.LOGIN, (route) => false);
                // AppRouter.HOME,
                // (route) => false);
              } else if (state is Authenticated) {
                _navigator.pushNamedAndRemoveUntil(
                    AppRouter.HOME, (route) => false);
              }
            },
            child: child,
          );
        },
        onGenerateRoute: AppRouter.onGenerateRoute,
      ),
    );
  }
}
