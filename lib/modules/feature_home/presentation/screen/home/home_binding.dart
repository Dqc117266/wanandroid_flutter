import 'package:get/get.dart';
import 'package:wanandroid_flutter/modules/feature_home/data/repository/home_repository_Impl.dart';
import 'package:wanandroid_flutter/modules/feature_home/domain/usecase/get_banner_usecase.dart';
import 'package:wanandroid_flutter/modules/feature_home/domain/usecase/get_home_usecase.dart';
import 'package:wanandroid_flutter/modules/feature_home/domain/usecase/get_toparticle_usecase.dart';

import 'home_logic.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeLogic());
    // 注册 HomeRepositoryImpl
    Get.lazyPut(() => HomeRepositoryImpl());
    // 注册 GetHomeUseCase，并手动注入 HomeRepositoryImpl
    Get.lazyPut(() => GetHomeUseCase(Get.find<HomeRepositoryImpl>()));
    Get.lazyPut(() => GetBannerUseCase(Get.find<HomeRepositoryImpl>()));
    Get.lazyPut(() => GetTopArticleUseCase(Get.find<HomeRepositoryImpl>()));
  }
}
