import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:wanandroid_flutter/env/env.dart';

class DioClient {
  static const int connectTimeout = 15000;
  static const int receiveTimeout = 15000;

  static final DioClient _instance = DioClient._internal();

  factory DioClient() => _instance;

  late Dio _dio;

  DioClient._internal() {
    BaseOptions options = BaseOptions(
      baseUrl: Env.baseUrl,
      connectTimeout: Duration(milliseconds: connectTimeout),
      receiveTimeout: Duration(milliseconds: receiveTimeout),
    );

    _dio = Dio(options);

    _dio.interceptors.add(PrettyDioLogger(
      // 添加日志格式化工具类
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      compact: false,
    ));

  }

}