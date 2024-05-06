import 'package:meta/meta.dart';

// 定义泛型枚举类，表示 ApiResult 的不同状态
@sealed
abstract class ApiResult<T> {}

// 成功状态
class Success<T> extends ApiResult<T> {
  final T data;

  Success({required this.data});
}

// 错误状态
class Error<T> extends ApiResult<T> {
  final int code;
  final String? message;

  Error({required this.code, this.message});
}

// 异常状态
class Exception<T> extends ApiResult<T> {
  final dynamic throwable;

  Exception({required this.throwable});
}
