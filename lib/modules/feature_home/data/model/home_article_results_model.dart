import 'package:wanandroid_flutter/modules/feature_home/data/model/article_model.dart';
import 'package:wanandroid_flutter/generated/json/home_article_results_model.g.dart';

class HomeArticleResultsModel {
  int? curPage;
  List<ArticleModel>? datas;
  int? offset;
  bool? over;
  int? pageCount;
  int? size;
  int? total;

  HomeArticleResultsModel();

  factory HomeArticleResultsModel.fromJson(Map<String, dynamic> json) =>
      $HomeArticleResultsModelFromJson(json);

  Map<String, dynamic> toJson() => $HomeArticleResultsModelToJson(this);
}
