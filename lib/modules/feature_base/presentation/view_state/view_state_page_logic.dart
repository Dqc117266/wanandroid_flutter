import 'package:easy_refresh/easy_refresh.dart';
import 'package:get/get.dart';
import 'package:wanandroid_flutter/modules/feature_base/presentation/view_state/view_state.dart';

abstract class ViewStatePageLogic<T> extends GetxController {
  final Rx<ViewState> viewState = ViewState().obs;
  final RxList<T> dataList = <T>[].obs;
  final EasyRefreshController _easyController = EasyRefreshController(
    controlFinishRefresh: true,
    controlFinishLoad: true,
  );

  EasyRefreshController get easyController => _easyController;

  int pageSize = 20;
  int currentPage = 0;

  @override
  void onInit() {
    super.onInit();
    initData();
  }

  void initData() {
    currentPage = 0;
    viewState(ViewStateLoading());
    fetchData(refresh: true);
  }

  void refreshData() {
    currentPage = 0;
    fetchData(refresh: true);
  }

  void loadMoreData() {
    currentPage++;
    fetchData(refresh: false);
  }

  Future<void> fetchData({required bool refresh});

  void updateState(List<T> data, {bool refresh = false, int? pageSize}) {
    if (pageSize != null) {
      this.pageSize = pageSize;
    }

    if (refresh) {
      dataList.assignAll(data);
    } else {
      dataList.addAll(data);
    }

    if (data.isEmpty && refresh) {
      viewState(ViewStateEmpty());
    } else {
      viewState(ViewStateSuccess(dataList));
    }

    if (refresh) {
      _easyController.finishRefresh(IndicatorResult.success);
    } else {
      _easyController.finishLoad(currentPage >= this.pageSize
          ? IndicatorResult.noMore
          : IndicatorResult.success);
    }
  }

  void handleError(int code, String message) {
    if (currentPage == 0) {
      viewState(ViewStateError(code, message));
    } else {
      viewState(ViewStateFail(code, message));
    }

    _easyController.finishRefresh(IndicatorResult.fail);
    _easyController.finishLoad(IndicatorResult.fail);
  }

  @override
  void onClose() {
    _easyController.dispose();
    super.onClose();
  }
}
