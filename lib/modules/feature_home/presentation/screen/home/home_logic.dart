import 'package:get/get.dart';
import 'package:wanandroid_flutter/modules/feature_home/data/model/article_model.dart';
import 'package:wanandroid_flutter/modules/feature_home/domain/usecase/get_banner_usecase.dart';
import 'package:wanandroid_flutter/modules/feature_home/domain/usecase/get_home_usecase.dart';
import 'package:wanandroid_flutter/modules/feature_home/domain/usecase/get_toparticle_usecase.dart';

class HomeLogic extends GetxController {
  final GetHomeUseCase getHomeUseCase = Get.find<GetHomeUseCase>();
  final GetBannerUseCase getBannerUseCase = Get.find<GetBannerUseCase>();
  final GetTopArticleUseCase getTopArticleUseCase = Get.find<GetTopArticleUseCase>();

  RxList<ArticleModel> dataList = <ArticleModel>[].obs;

  Future<void> getHomeArticles(int page) async {
    final articleModel = await getHomeUseCase.call(page);

    if (articleModel.isSuccess) {
      dataList.addAll(articleModel.result!.data!.datas!);
      print(articleModel.result!.data!.datas![2].title);
    } else {
      print("Failed to fetch home articles.");
    }
  }

  Future<void> getBanner() async {
    final articleModel = await getBannerUseCase.call();

    if (articleModel.isSuccess) {
      print(articleModel.result!.data![0].title);
    } else {
      print("Failed to fetch home articles.");
    }
  }

  Future<void> getHomeTopArticles() async {
    final articleModel = await getTopArticleUseCase.call();

    if (articleModel.isSuccess) {
      dataList.addAll(articleModel.result!.data!);
      print(articleModel.result!.data![0].title);
    } else {
      print("Failed to fetch home articles.");
    }
  }

}