import 'package:wanandroid_flutter/modules/feature_home/data/model/banner_model.dart';

BannerModel $BannerModelFromJson(Map<String, dynamic> json) => BannerModel()
  ..desc = json['desc'] as String?
  ..id = (json['id'] as num?)?.toInt()
  ..imagePath = json['imagePath'] as String?
  ..isVisible = (json['isVisible'] as num?)?.toInt()
  ..order = (json['order'] as num?)?.toInt()
  ..title = json['title'] as String?
  ..type = (json['type'] as num?)?.toInt()
  ..url = json['url'] as String?;

Map<String, dynamic> $BannerModelToJson(BannerModel instance) =>
    <String, dynamic>{
      'desc': instance.desc,
      'id': instance.id,
      'imagePath': instance.imagePath,
      'isVisible': instance.isVisible,
      'order': instance.order,
      'title': instance.title,
      'type': instance.type,
      'url': instance.url,
    };
