import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/src/pretty_dio_logger.dart';
class DioFactory {

  DioFactory._();


  static Dio? dio;
  static Dio getDio() {
     const Duration timeout = Duration(seconds: 30);


     if (dio == null) {
       dio = Dio()
         ..options.connectTimeout = timeout
         ..options.receiveTimeout = timeout
         ..options.sendTimeout = timeout
         ..options.contentType = 'application/json'
         ..options.responseType = ResponseType.json;

        addDioInterceptor();
       return dio!;
     }
     else {
       return dio!;
     }
   }
  static void addDioInterceptor() {
      dio?.interceptors.add(
          PrettyDioLogger(
            requestHeader: true,
            requestBody: true,
            responseBody: true,
            responseHeader: false,
            error: true,
            compact: true,
            maxWidth: 90,
            enabled: kDebugMode,
          )
      );
    }

}
