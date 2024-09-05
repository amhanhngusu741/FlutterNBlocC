import 'package:childcaresoftware/constants/api.dart';
import 'package:childcaresoftware/constants/pref_key.dart';
import 'package:childcaresoftware/models/settings_response.dart';
import 'package:childcaresoftware/services/remote/network_service.dart';
import 'package:childcaresoftware/services/local/local_pref.dart';

class SettingsRepository {
  final NetworkService _networkService = NetworkService.instance;

  getSettings() async {
    final response = await _networkService.get(SettingsAPI.SETTINGS_URL);
    final data = SettingsResponse.fromJson(response);
    return data;
  }

  muteNotification(SoundMode soundMode) async {
    final response = await _networkService.put(
        SettingsAPI.MUTE_NOTIFICATION_URL,
        queryParameters: {'mute': soundMode == SoundMode.always ? 1 : 0});
    return response;
  }

  muteNotificationByPeriod(String fromDate, String toDate) async {
    final response = await _networkService.put(
        SettingsAPI.MUTE_NOTIFICATION_BY_DATE_URL,
        queryParameters: {'from_date': fromDate, 'to_date': toDate});
    return response;
  }

  getStartScreen() async {
    final startScreen = await LocalPref.getString(SettingsAPI.START_SCREEN);
    if (startScreen == null) {
      return Future.value(null);
    }
    return startScreen;
  }

  saveStartScreen(String data) async {
    final startScreen =
        await LocalPref.saveString(SettingsAPI.START_SCREEN, data);
    if (startScreen == null) {
      return Future.value(null);
    }
    return startScreen;
  }

  Future<bool> getFirstTime() async {
    final isFirstTime = await LocalPref.getBoolean(PrefKey.FIRST_TIME_KEY);
    if (isFirstTime == null) {
      return Future.value(true);
    }
    return isFirstTime;
  }

  Future<bool> saveFirstTime(bool isFirstTime) async {
    final result =
        await LocalPref.saveBoolean(PrefKey.FIRST_TIME_KEY, isFirstTime);
    return result;
  }
}
