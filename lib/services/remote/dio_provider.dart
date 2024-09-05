import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:childcaresoftware/constants/api.dart';
import 'package:package_info/package_info.dart';
import 'dart:io' show Platform;
import 'package:device_info/device_info.dart';
// import 'package:trust_fall/trust_fall.dart';

bool isRealDevice = true;

class DioProvider {
  static Dio instance() {
    final dio = Dio();
    PackageInfo.fromPlatform().then((PackageInfo packageInfo) async {
      String version = '';
      String os = Platform.operatingSystem;
      await checkRealDevice();
      List<String> arrVersion = packageInfo.version.split('.');
      // if (os == 'ios') {
      //   if (isRealDevice == false) {
      //     arrVersion[1] = '1';
      //     arrVersion[2] = 'x';
      //   } else {
      //     arrVersion[1] = '1';
      //   }
      // } else {
      //   if (isRealDevice == false) {
      //     arrVersion[1] = '2';
      //     arrVersion[2] = 'x';
      //   } else {
      //     arrVersion[1] = '2';
      //     // arrVersion[2] = 'x'; //remove this param
      //   }
      // }
      if (os == 'ios') {
        arrVersion[1] = '1';
        arrVersion[2] = 'x';
      } else {
        arrVersion[1] = '2';
        arrVersion[2] = 'x';
      }
      version = arrVersion.join(".");
      API.API_VERSION = packageInfo.version;
      dio.options.baseUrl = '${API.BASE_URL}v$version/';
      dio.options.connectTimeout = 30000;
      dio.options.receiveTimeout = 30000;
      dio.interceptors.add(HttpLogInterceptor());
    });
    return dio;
  }
}

Future<void> checkRealDevice() async {
  // try {
  //   isRealDevice = await TrustFall.isRealDevice;
  // } catch (error) {
  //   print(error);
  // }
}

class HttpLogInterceptor extends InterceptorsWrapper {
  @override
  Future onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    String message = "onRequest: ${options.uri}\n"
        "data=${options.data}\n"
        "method=${options.method}\n"
        "headers=${options.headers}\n"
        "queryParameters=${options.queryParameters}";
    log(message.substring(0, message.length <= 10000 ? message.length : 10000));
    return options;
  }

  @override
  Future onResponse(
      Response response, ResponseInterceptorHandler handler) async {
    log("onResponse: $response");
    return super.onResponse(response, handler);
  }

  @override
  Future onError(DioError dioError, ErrorInterceptorHandler handler) async {
    log("onError: $dioError\n"
        "Response: ${dioError.response}");
    return super.onError(dioError, handler);
  }
}
