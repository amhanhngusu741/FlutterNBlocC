import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:childcaresoftware/constants/api.dart';
import 'package:childcaresoftware/models/models.dart';
import 'package:childcaresoftware/services/remote/dio_provider.dart';

class NetworkService {
  Dio _dio = DioProvider.instance();
  String _token;
  NetworkService._privateConstructor();

  static final NetworkService _instance = NetworkService._privateConstructor();

  static NetworkService get instance => _instance;

  Map<String, dynamic> baseHeader() {
    Map<String, dynamic> _header = {
      'Content-Type': 'application/json',
    };
    if (_token != null) {
      _header["Authorization"] = _token;
    }
    return _header;
  }

  void setToken(String token) {
    _token = token;
  }

  Future<dynamic> post(String url,
      {Map<String, dynamic> queryParameters, dynamic data}) async {
    data['mws_db_server'] = API.MWS_DB_SERVER;
    data['cur_acc_id'] = API.CURRENT_ACCOUNT_ID;
    data['api_version'] = API.API_VERSION;
    data['platform'] = Platform.isAndroid ? 'android' : 'ios';
    data['token'] = API.TOKEN;
    try {
      final response = await _dio.post(url,
          queryParameters: queryParameters,
          data: data,
          options: Options(
            headers: baseHeader(),
          ));
      final dataResponse = DataResponse.fromJson(response.data);
      if (!(dataResponse.payload is List))
        dataResponse.payload['message'] = dataResponse.message;
      if (dataResponse.success) return dataResponse.payload;
      throw APIException(error: dataResponse.message);
    } on DioError catch (e) {
      if (e.response != null) {
        final errorList = e.response.data['errors'] ?? [];
        final errorMessage = errorList.length > 0
            ? errorList[0]
            : 'An error occurred. Please try again!';
        throw APIException(error: errorMessage);
      } else {
        print(e.requestOptions);
        print(e.message);
        var connectivityResult = await (Connectivity().checkConnectivity());
        if (connectivityResult == ConnectivityResult.none) {
          throw APIException(
              error:
                  'The network is not available. Please check your connection and try again.');
        } else {
          throw APIException(error: 'An error occurred. Please try again!');
        }
      }
    }
  }

  Future<dynamic> get(String url,
      {Map<String, dynamic> queryParameters}) async {
    queryParameters['mws_db_server'] = API.MWS_DB_SERVER;
    queryParameters['cur_acc_id'] = API.CURRENT_ACCOUNT_ID;
    queryParameters['api_version'] = API.API_VERSION;
    queryParameters['platform'] = Platform.isAndroid ? 'android' : 'ios';
    queryParameters['token'] = API.TOKEN;
    try {
      final response = await _dio.get(
        url,
        queryParameters: queryParameters,
        options: Options(headers: baseHeader()),
      );
      final dataResponse = DataResponse.fromJson(response.data);
      if (dataResponse.success) return dataResponse.payload;
      throw APIException(error: dataResponse.message);
    } on DioError catch (e) {
      if (e.response != null) {
        final errorList = e.response.data['errors'] ?? [];
        final errorMessage = errorList.length > 0
            ? errorList[0]
            : 'An error occurred. Please try again!';
        throw APIException(error: errorMessage);
      } else {
        print(e.requestOptions);
        print(e.message);
        var connectivityResult = await (Connectivity().checkConnectivity());
        if (connectivityResult == ConnectivityResult.none) {
          throw APIException(
              error:
                  'The network is not available. Please check your connection and try again.');
        } else {
          throw APIException(error: 'An error occurred. Please try again!');
        }
      }
    }
  }

  Future<dynamic> put(String url,
      {Map<String, dynamic> queryParameters, Map<String, dynamic> data}) async {
    data['mws_db_server'] = API.MWS_DB_SERVER;
    data['cur_acc_id'] = API.CURRENT_ACCOUNT_ID;
    data['api_version'] = API.API_VERSION;
    data['platform'] = Platform.isAndroid ? 'android' : 'ios';
    data['token'] = API.TOKEN;
    try {
      final response = await _dio.put(url,
          queryParameters: queryParameters,
          data: data,
          options: Options(
            headers: baseHeader(),
          ));
      final dataResponse = DataResponse.fromJson(response.data);
      if (dataResponse.success) return dataResponse.payload;
      throw APIException(error: dataResponse.message);
    } on DioError catch (e) {
      if (e.response != null) {
        final errorList = e.response.data['errors'] ?? [];
        final errorMessage = errorList.length > 0
            ? errorList[0]
            : 'An error occurred. Please try again!';
        throw APIException(error: errorMessage);
      } else {
        var connectivityResult = await (Connectivity().checkConnectivity());
        if (connectivityResult == ConnectivityResult.none) {
          throw APIException(
              error:
                  'The network is not available. Please check your connection and try again.');
        } else {
          throw APIException(error: 'An error occurred. Please try again!');
        }
      }
    }
  }

  Future<dynamic> delete(String url,
      {Map<String, dynamic> queryParameters, Map<String, dynamic> data}) async {
    data['mws_db_server'] = API.MWS_DB_SERVER;
    data['cur_acc_id'] = API.CURRENT_ACCOUNT_ID;
    data['api_version'] = API.API_VERSION;
    data['platform'] = Platform.isAndroid ? 'android' : 'ios';
    data['token'] = API.TOKEN;
    try {
      final response = await _dio.delete(url,
          queryParameters: queryParameters,
          data: data,
          options: Options(
            headers: baseHeader(),
          ));
      final dataResponse = DataResponse.fromJson(response.data);
      if (dataResponse.success) return dataResponse.payload;
      throw APIException(error: dataResponse.message);
    } on DioError catch (e) {
      if (e.response != null) {
        final errorList = e.response.data['errors'] ?? [];
        final errorMessage = errorList.length > 0
            ? errorList[0]
            : 'An error occurred. Please try again!';
        throw APIException(error: errorMessage);
      } else {
        print(e.requestOptions);
        print(e.message);
        var connectivityResult = await (Connectivity().checkConnectivity());
        if (connectivityResult == ConnectivityResult.none) {
          throw APIException(
              error:
                  'The network is not available. Please check your connection and try again.');
        } else {
          throw APIException(error: 'An error occurred. Please try again!');
        }
      }
    }
  }
}
