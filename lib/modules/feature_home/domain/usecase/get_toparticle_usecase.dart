import 'package:wanandroid_flutter/modules/feature_base/data/model/base_response.dart';
import 'package:wanandroid_flutter/modules/feature_base/domain/result.dart';
import 'package:wanandroid_flutter/modules/feature_home/data/model/article_model.dart';
import 'package:wanandroid_flutter/modules/feature_home/domain/repository/home_repository.dart';

class GetTopArticleUseCase {
  final HomeRepository homeRepository;

  GetTopArticleUseCase(this.homeRepository);

  Future<Result<BaseResponse<List<ArticleModel>>>> call() async {
    final result = await homeRepository.getTopArticles();
    return result;
  }
}