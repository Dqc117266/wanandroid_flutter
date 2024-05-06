import 'package:wanandroid_flutter/modules/feature_home/data/model/article_model.dart';
import 'package:wanandroid_flutter/modules/feature_home/data/model/home_article_results_model.dart';

HomeArticleResultsModel $HomeArticleResultsModelFromJson(
        Map<String, dynamic> json) =>
    HomeArticleResultsModel()
      ..curPage = (json['curPage'] as num?)?.toInt()
      ..datas = (json['datas'] as List<dynamic>?)
          ?.map((e) => ArticleModel.fromJson(e as Map<String, dynamic>))
          .toList()
      ..offset = (json['offset'] as num?)?.toInt()
      ..over = json['over'] as bool?
      ..pageCount = (json['pageCount'] as num?)?.toInt()
      ..size = (json['size'] as num?)?.toInt()
      ..total = (json['total'] as num?)?.toInt();

Map<String, dynamic> $HomeArticleResultsModelToJson(
        HomeArticleResultsModel instance) =>
    <String, dynamic>{
      'curPage': instance.curPage,
      'datas': instance.datas,
      'offset': instance.offset,
      'over': instance.over,
      'pageCount': instance.pageCount,
      'size': instance.size,
      'total': instance.total,
    };
