import 'package:wanandroid_flutter/modules/feature_home/data/model/tag_model.dart';

TagModel $TagModelFromJson(Map<String, dynamic> json) => TagModel()
  ..name = json['name'] as String?
  ..url = json['url'] as String?;

Map<String, dynamic> $TagModelToJson(TagModel instance) => <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };
