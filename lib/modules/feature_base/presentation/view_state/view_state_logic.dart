import 'package:get/get.dart';
import 'package:wanandroid_flutter/modules/feature_base/data/exception/request_exception.dart';
import 'package:wanandroid_flutter/modules/feature_base/data/model/base_response.dart';
import 'package:wanandroid_flutter/modules/feature_base/domain/result.dart';
import 'package:wanandroid_flutter/modules/feature_base/presentation/view_state/view_state.dart';

abstract class ViewStateLogic extends GetxController {
  final Rx<ViewState> viewState = ViewState().obs;

  void loadDate() {}

  // 通用的网络请求处理方法
  Future<void> sendRequest<T>(Future<Result<BaseResponse<T>>> Function() request) async {
    viewState(ViewStateLoading());

    try {
      final result = await request();

      if (result.isSuccess) {
        final baseResponse = result.result;
        if (baseResponse != null && baseResponse.data != null) {
          viewState(ViewStateSuccess(baseResponse.data));
        } else {
          viewState(ViewStateEmpty());
        }
      } else {
        viewState(ViewStateFail(
          result.code,
          result.message,
        ));
      }
    } catch (e) {
      RequestException requestException = RequestException.create(e);
      viewState(ViewStateError(requestException.code, requestException.message));
    }
  }
}