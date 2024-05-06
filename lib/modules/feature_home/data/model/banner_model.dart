import 'package:wanandroid_flutter/generated/json/banner_model.g.dart';

class BannerModel {
  String? desc;
  int? id;
  String? imagePath;
  int? isVisible;
  int? order;
  String? title;
  int? type;
  String? url;

  BannerModel();

  factory BannerModel.fromJson(Map<String, dynamic> json) =>
      $BannerModelFromJson(json);

  Map<String, dynamic> toJson() => $BannerModelToJson(this);
}
