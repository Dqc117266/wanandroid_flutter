import 'package:wanandroid_flutter/modules/feature_base/data/model/base_response.dart';
import 'package:wanandroid_flutter/modules/feature_base/domain/result.dart'; // 从 wanandroid_flutter 包中导入 Result 类
import 'package:wanandroid_flutter/modules/feature_home/data/model/home_article_results_model.dart';
import 'package:wanandroid_flutter/modules/feature_home/domain/repository/home_repository.dart';

class GetHomeUseCase {
  final HomeRepository homeRepository;

  GetHomeUseCase(this.homeRepository);

  Future<Result<BaseResponse<HomeArticleResultsModel>>> call(int page) async {
    final result = await homeRepository.getHomeArticle(page);
    return result;
  }
}