import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:logging/logging.dart';

import '../../core/api_exception.dart';
import 'dio_factory_params.dart';

class DioFactory {

  static const tag = 'Dio';

  final Logger logger;

  static DioFactory? _instance;

  static DioFactory _check() {
    final scopeInstance = _instance;
    if (scopeInstance == null) {
      throw Exception(
          "Please initialise DioFactory in main() method by calling\n"
          "`await DioFactory.computeDeviceInfo();`\n"
          "`DioFactory.setParams(params: DioFactoryParams(hostUrl));`");
    }
    return scopeInstance;
  }

  static void setParams({
    required DioFactoryParams params,
  }) =>
      _instance = DioFactory._(params: params);

  static Dio get dio {
    final scopeInstance = _check();
    return scopeInstance._dio;
  }

  static Object parseError(Object? error) {
    if (error == null) {
      return Exception('unknown error occurred');
    }
    if (error is DioException) {
      if (error.type != DioExceptionType.badResponse) {
        return Exception('server unreachable');
      } else {
        Map<String, dynamic> json = error.response?.data ?? <String, dynamic>{};
        ApiException apiException = ApiException.fromJson(json);
        return apiException;
      }
    }
    return error;
  }

  static set authorisation(String value) {
    final scopeInstance = _check();
    scopeInstance._authorisation = value;
  }

  static void clearAuthorisation() {
    final scopeInstance = _check();
    scopeInstance._authorisation = null;
  }

  static set locale(String value) {
    final scopeInstance = _check();
    scopeInstance._locale = value;
  }

  static void clearLocale() {
    final scopeInstance = _check();
    scopeInstance._locale = null;
  }

  String? _authorisation;
  String? _locale;
  final DioFactoryParams params;
  final Dio _dio;

  DioFactory._({
    required this.params,
  })  : logger = Logger(tag),
        _dio = Dio(
          BaseOptions(
            baseUrl: params.hostUrl,
            connectTimeout: Duration(milliseconds: params.timeout),
            receiveTimeout: Duration(milliseconds: params.timeout),
            sendTimeout: Duration(milliseconds: params.timeout),
          ),
        ) {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          final authorisation = _authorisation;
          if (authorisation != null) {
            options.headers[HttpHeaders.authorizationHeader] = authorisation;
          }
          if (_locale != null) {
            options.headers[HttpHeaders.acceptLanguageHeader] = _locale;
          }
          return handler.next(options);
        },
        onResponse: (response, handler) {
          return handler.next(response);
        },
        onError: (e, handler) {
          if (e.type == DioExceptionType.connectionError) {
            throw const SocketException('Please check internet connection');
          }
          if (e.type == DioExceptionType.connectionTimeout) {
            throw const SocketException('Please check internet connection');
          }
          if (e.type == DioExceptionType.badResponse) {}
          return handler.next(e);
        },
      ),
    );
    if (params.enableLogs) {
      _dio.interceptors.add(
        LogInterceptor(
          request: params.logNetworkRequest,
          requestHeader: params.logNetworkRequestHeader,
          requestBody: params.logNetworkRequestBody,
          responseHeader: params.logNetworkResponseHeader,
          responseBody: params.logNetworkResponseBody,
          error: params.logNetworkError,
          logPrint: (Object object) {
            logger.fine('$object');
          },
        ),
      );
    }
    if (params.selfSignedCert) {
      final httpClientAdapter = _dio.httpClientAdapter as IOHttpClientAdapter;
      httpClientAdapter.onHttpClientCreate = _onHttpClientCreate;
    }
  }

  HttpClient _onHttpClientCreate(HttpClient client) {
    client.badCertificateCallback = _badCertificateCallback;
    return client;
  }

  bool _badCertificateCallback(X509Certificate cert, String host, int port) {
    return true;
  }
}
