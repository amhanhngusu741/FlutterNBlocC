import 'package:childcaresoftware/commons/dialogs.dart';
// import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:package_info/package_info.dart';

const APP_STORE_URL =
    'https://apps.apple.com/us/app/the-staff-hound/id1541121777';
const PLAY_STORE_URL =
    'https://play.google.com/store/apps/details?id=com.childcaresoftware.childcaresoftware';

versionCheck(context) async {
  //Get Current installed version of app
  final PackageInfo info = await PackageInfo.fromPlatform();
  double currentVersion = double.parse(info.version.trim().replaceAll(".", ""));
  //Get Latest version info from firebase config
  // final RemoteConfig remoteConfig = await RemoteConfig.instance;
  try {
    // Using default duration to force fetching from remote server.
    // await remoteConfig.fetch(expiration : const Duration(seconds: 0));
    // await remoteConfig.setConfigSettings(RemoteConfigSettings(
    //   fetchTimeout: const Duration(seconds: 0),
    //   minimumFetchInterval: Duration.zero,
    // ));
    // await remoteConfig.fetchAndActivate();
    // await remoteConfig.activate();
    // double newVersion = double.parse(
    //     remoteConfig.getString('version').trim().replaceAll(".", ""));
    // print(newVersion);
    // if (newVersion > currentVersion) {
    //   Dialogs.showVersionDialog(context);
    // }
  } on Exception catch (exception) {
    // Fetch throttled.
    print(exception);
  } catch (exception) {
    print('Unable to fetch remote config. Cached or default values will be '
        'used');
  }
}
