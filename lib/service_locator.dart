// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get_it/get_it.dart';
import 'package:childcaresoftware/repositories/repositories.dart';
import 'package:childcaresoftware/services/navigation_service.dart';

GetIt locator = GetIt.instance;
// FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;

void setupLocator() {
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => UserRepository());
  locator.registerLazySingleton(() => NotificationRepository());
  locator.registerLazySingleton(() => SettingsRepository());
  locator.registerLazySingleton(() => WidgetRepository());
}
