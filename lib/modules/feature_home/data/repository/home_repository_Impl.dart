import 'package:wanandroid_flutter/modules/feature_base/common/util/network_util.dart';
import 'package:wanandroid_flutter/modules/feature_base/data/model/base_response.dart';
import 'package:wanandroid_flutter/modules/feature_base/domain/result.dart';
import 'package:wanandroid_flutter/modules/feature_home/data/model/article_model.dart';
import 'package:wanandroid_flutter/modules/feature_home/data/model/banner_model.dart';
import 'package:wanandroid_flutter/modules/feature_home/data/model/home_article_results_model.dart';
import 'package:wanandroid_flutter/modules/feature_home/data/service/home_retrofit_service.dart';
import 'package:wanandroid_flutter/modules/feature_home/domain/repository/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  @override
  Future<Result<BaseResponse<HomeArticleResultsModel>>> getHomeArticle(
      int page) async {
    return NetworkUtil.handleRequest(
        () => HomeRetrofitService().getArticleList(page));
  }

  @override
  Future<Result<BaseResponse<List<BannerModel>>>> getBanner() async {
    return NetworkUtil.handleRequest(() => HomeRetrofitService().getBanner());
  }

  @override
  Future<Result<BaseResponse<List<ArticleModel>>>> getTopArticles() async {
    return NetworkUtil.handleRequest(() => HomeRetrofitService().getTopArticles());
  }
}
