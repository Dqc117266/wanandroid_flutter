
import 'package:wanandroid_flutter/modules/feature_base/data/model/base_response.dart';
import 'package:wanandroid_flutter/modules/feature_base/domain/result.dart';
import 'package:wanandroid_flutter/modules/feature_home/data/model/article_model.dart';
import 'package:wanandroid_flutter/modules/feature_home/data/model/banner_model.dart';
import 'package:wanandroid_flutter/modules/feature_home/data/model/home_article_results_model.dart';

abstract class HomeRepository {
  Future<Result<BaseResponse<HomeArticleResultsModel>>> getHomeArticle(int page);
  Future<Result<BaseResponse<List<BannerModel>>>> getBanner();
  Future<Result<BaseResponse<List<ArticleModel>>>> getTopArticles();
}
