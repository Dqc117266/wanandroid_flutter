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
    try {
      final apiResult = await HomeRetrofitService().getArticleList(page);
      return Result.success(apiResult);
    } catch (e) {
      print('HomeRepositoryImpl: $e');
      return Result.failure(exception: e);
    }
  }

  @override
  Future<Result<BaseResponse<List<BannerModel>>>> getBanner() async {
    try {
      final apiResult = await HomeRetrofitService().getBanner();
      return Result.success(apiResult);
    } catch (e) {
      print('HomeRepositoryImpl: $e');
      return Result.failure(exception: e);
    }
  }

  @override
  Future<Result<BaseResponse<List<ArticleModel>>>> getTopArticles() async {
    try {
      final apiResult = await HomeRetrofitService().getTopArticles();
      return Result.success(apiResult);
    } catch (e) {
      print('HomeRepositoryImpl: $e');
      return Result.failure(exception: e);
    }
  }
}
