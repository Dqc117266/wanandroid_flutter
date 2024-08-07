import 'package:get/get.dart';
import 'package:wanandroid_flutter/modules/feature_base/presentation/view_state/view_state_paging_logic.dart';
import 'package:wanandroid_flutter/modules/feature_home/data/model/article_model.dart';
import 'package:wanandroid_flutter/modules/feature_home/data/model/banner_model.dart';
import 'package:wanandroid_flutter/modules/feature_home/domain/usecase/get_banner_usecase.dart';
import 'package:wanandroid_flutter/modules/feature_home/domain/usecase/get_home_usecase.dart';
import 'package:wanandroid_flutter/modules/feature_home/domain/usecase/get_toparticle_usecase.dart';

class HomeLogic extends ViewStatePagingLogic {
  final GetHomeUseCase getHomeUseCase = Get.find<GetHomeUseCase>();
  final GetBannerUseCase getBannerUseCase = Get.find<GetBannerUseCase>();
  final GetTopArticleUseCase getTopArticleUseCase =
      Get.find<GetTopArticleUseCase>();

  final RxList<BannerModel> bannerList = <BannerModel>[].obs;

  @override
  Future<void> fetchData({required bool refresh}) async {
    List<ArticleModel> topList = [];
    List<ArticleModel> finalList = [];

    if (refresh) {
      final topResult = await getTopArticleUseCase.call();
      if (topResult.isSuccess) {
        topList = topResult.result!.data!;
      } else {
        topList = [];
      }

      final bannerResult = await getBannerUseCase.call();
      if (bannerResult.isSuccess) {
        bannerList.assignAll(bannerResult.result!.data!);
      } else {
        bannerList.clear();
      }
    }

    final result = await getHomeUseCase.call(currentPage);

    if (result.isSuccess) {
      final data = result.result!.data!;
      if (topList.isNotEmpty) {
        finalList.addAll(topList);
      }

      finalList.addAll(data.datas!);
      updateState(finalList, refresh: refresh, pageSize: data.pageCount);
    } else if (result.isFailure) {
      handleError(result.code!, result.message!, isShowErrorToast: true);
    }
  }
}
