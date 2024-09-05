import 'dart:convert';
import 'package:childcaresoftware/constants/api.dart';
import 'package:childcaresoftware/constants/local_storage_key.dart';
import 'package:childcaresoftware/models/models.dart';
import 'package:childcaresoftware/services/local/local_pref.dart';
import 'package:childcaresoftware/services/remote/network_service.dart';

class WidgetRepository {
  final NetworkService _networkService = NetworkService.instance;
  Future<String> getFilterDateByKey(String keyLocalStorage) async {
    final filterDateList = await LocalPref.getString(keyLocalStorage);
    if (filterDateList == null) {
      return Future.value(null);
    }
    return filterDateList;
  }

  setFilterDateByKey(String data, String keyLocalStorage) async {
    final status = await LocalPref.saveString(keyLocalStorage, data);
    if (status == null) {
      return Future.value(null);
    }
    return status;
  }
}
