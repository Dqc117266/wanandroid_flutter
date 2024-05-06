import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';
import 'package:wanandroid_flutter/env/env.dart';
import 'package:wanandroid_flutter/modules/feature_base/data/dio_client.dart';
import 'package:wanandroid_flutter/modules/feature_base/data/model/base_response.dart';
import 'package:wanandroid_flutter/modules/feature_home/data/model/article_model.dart';
import 'package:wanandroid_flutter/modules/feature_home/data/model/banner_model.dart';
import 'package:wanandroid_flutter/modules/feature_home/data/model/home_article_results_model.dart';

part 'home_retrofit_service.g.dart';

@RestApi(baseUrl: "https://www.wanandroid.com")
abstract class HomeRetrofitService {
  factory HomeRetrofitService() {
    return _HomeRetrofitService(DioClient().dio, baseUrl: Env.baseUrl);
  }

  @GET('/article/list/{page}/json')
  @FormUrlEncoded()
  Future<BaseResponse<HomeArticleResultsModel>> getArticleList(
      @Path("page") int page);

  @GET('/banner/json')
  @FormUrlEncoded()
  Future<BaseResponse<List<BannerModel>>> getBanner();

  @GET('/article/top/json')
  @FormUrlEncoded()
  Future<BaseResponse<List<ArticleModel>>> getTopArticles();

}
