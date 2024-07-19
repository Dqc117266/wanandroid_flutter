import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:wanandroid_flutter/modules/feature_base/common/util/toast_util.dart';
import 'package:wanandroid_flutter/modules/feature_base/data/exception/request_exception.dart';
import 'package:wanandroid_flutter/modules/feature_base/domain/result.dart';

class NetworkUtil {
  static Future<Result<T>> handleRequest<T>(
      Future<T> Function() request) async {
    try {
      final apiResult = await request();
      return Result.success(apiResult);
    } on DioException catch (e) {

      debugPrint('NetworkUtil: $e');
      RequestException requestException = RequestException.create(e);
      // showToast("errorcode :${requestException.code} message: ${requestException.message}");

      return Result.failure(
        code: requestException.code,
        message: requestException.message,
        exception: e,
      );
    }
  }
}
