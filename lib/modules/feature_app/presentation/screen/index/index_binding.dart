import 'package:get/get.dart';
import 'package:wanandroid_flutter/modules/feature_home/data/repository/home_repository_Impl.dart';
import 'package:wanandroid_flutter/modules/feature_home/domain/usecase/get_banner_usecase.dart';
import 'package:wanandroid_flutter/modules/feature_home/domain/usecase/get_home_usecase.dart';
import 'package:wanandroid_flutter/modules/feature_home/domain/usecase/get_toparticle_usecase.dart';
import 'package:wanandroid_flutter/modules/feature_home/presentation/screen/home/home_logic.dart';
import 'package:wanandroid_flutter/modules/feature_mine/presentation/screen/mine/mine_logic.dart';
import 'package:wanandroid_flutter/modules/feature_projects/presentation/screen/projects/projects_logic.dart';
import 'package:wanandroid_flutter/modules/feature_public/presentation/screen/public/public_logic.dart';

import 'index_logic.dart';

class IndexBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => IndexLogic());
    Get.lazyPut(() => HomeLogic());
    // 注册 HomeRepositoryImpl
    Get.lazyPut(() => HomeRepositoryImpl());
    // 注册 GetHomeUseCase，并手动注入 HomeRepositoryImpl
    Get.lazyPut(() => GetHomeUseCase(Get.find<HomeRepositoryImpl>()));
    Get.lazyPut(() => GetBannerUseCase(Get.find<HomeRepositoryImpl>()));
    Get.lazyPut(() => GetTopArticleUseCase(Get.find<HomeRepositoryImpl>()));

    Get.lazyPut(() => PublicLogic());
    Get.lazyPut(() => MineLogic());
    Get.lazyPut(() => ProjectsLogic());
  }
}
