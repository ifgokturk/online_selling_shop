import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:online_selling_shop/common/utils/constanst.dart';

import '../../global.dart';

class HttpUtil {
  late Dio dio;
//! singlenton class just have one instance
  static final HttpUtil _instance = HttpUtil._internal();

  factory HttpUtil() {
    return _instance;
  }

  HttpUtil._internal() {
    BaseOptions options = BaseOptions(
      baseUrl: AppConstants.SERVER_API_URL,
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
      headers: {},
      contentType: "application/json: charset=utf-8",
      responseType: ResponseType.json,
    );
    dio = Dio(options);

    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (request, handler) {
        print("ITS REQUEST  ${request.data}");
        return handler.next(request);
      },
      onResponse: (response, handler) {
        print("ITS RESPONSE ${response.data}");
        return handler.next(response);
      },
      onError: (DioException e, handler) {
        print("My Error is $e");
        ErrorEntity eInfo = createErrorEntity(e);
        onError(eInfo);
      },
    ));
  }

  Map<String, dynamic>? getAuthorizationHeader() {
    var headers = <String, dynamic>{};
    var accessToken = Global.storageService.getUserToken();

    if (accessToken.isNotEmpty) {
      headers['Authorization'] = 'Bearer $accessToken';
    }

    return headers;
  }

  Future post(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    Options requestOptions = options ?? Options();
    requestOptions.headers = requestOptions.headers ?? {};
    Map<String, dynamic>? authorization = getAuthorizationHeader();
    if (authorization != null) {
      requestOptions.headers!.addAll(authorization);
    }
    var response = await dio.post(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
    );
    return response.data;
  }
}

class ErrorEntity implements Exception {
  int code = -1;
  String message = "";
  ErrorEntity({
    required this.code,
    required this.message,
});
  @override
  String toString() {
    if (message == "") return "Exception";
    return "Exception Code $code,$message";
  }
}

ErrorEntity createErrorEntity(DioException error) {
  switch(error.type){
    case DioExceptionType.connectionTimeout:
      return ErrorEntity(code: -1, message: "connectionTimeout");
    case DioExceptionType.sendTimeout:
      return ErrorEntity(code: -1, message: "sendTimeout");
    case DioExceptionType.badCertificate:
      return ErrorEntity(code: -1, message: "badCertificate");
    case DioExceptionType.receiveTimeout:
      return ErrorEntity(code: -1, message: "receiveTimeout");
    case DioExceptionType.unknown:
      return ErrorEntity(code: -1, message: "unknown");
    case DioExceptionType.cancel:
      return ErrorEntity(code: -1, message: "cancel");
    case DioExceptionType.connectionError:
      return ErrorEntity(code: -1, message: "connectionError");
    case DioExceptionType.badResponse:
      switch(error.response!.statusCode){
        case 400:
          return ErrorEntity(code: 400, message: "request syntax error");
        case 401:
          return ErrorEntity(code: 400, message: "permission ");
      }
      return ErrorEntity(code: -1, message: "badResponse");
  }
}

void onError(ErrorEntity eInfo){
  debugPrint('error code-> ${eInfo.code}, error.message -> ${eInfo.message}');
  switch(eInfo.code){
    case 400:
      print("Server syntax error");
      break;
    case 401:
      print("You are denied to continue");
    break;
      case 500:
      print("Internal Server Error");
  break;
  default :
      print("unknown error");
  break;
  }
}