class Result<T> {
  final T? result;
  final int? code;
  final String? message;
  final dynamic exception;

  Result({this.result, this.code, this.message, this.exception});

  bool get isSuccess => result != null;
  bool get isFailure => exception != null;

  factory Result.success(T data) => Result(result: data);
  factory Result.failure({int? code, String? message, dynamic exception}) =>
      Result(code: code, message: message, exception: exception);
}
