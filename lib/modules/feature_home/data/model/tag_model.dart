import 'package:wanandroid_flutter/generated/json/tag_model.g.dart';

class TagModel {
  String? name;
  String? url;

  TagModel();

  factory TagModel.fromJson(Map<String, dynamic> json) =>
      $TagModelFromJson(json);

  Map<String, dynamic> toJson() => $TagModelToJson(this);
}
