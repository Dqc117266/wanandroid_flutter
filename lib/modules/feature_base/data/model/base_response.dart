
import 'base_response_convert.dart';

class BaseResponse<T> {
  final T? data;
  final int errorCode;
  final String errorMsg;

  BaseResponse({
    required this.data,
    required this.errorCode,
    required this.errorMsg,
  });

  factory BaseResponse.fromJson(Map<String, dynamic> json) {
    final results = JsonConvert.fromJsonAsT<T>(json['data']); // Assuming 'data' contains your results
    final errorCode = json['errorCode'];
    final errorMsg = json['errorMsg'];

    return BaseResponse(
      data: results,
      errorCode: errorCode,
      errorMsg: errorMsg,
    );
  }

}
