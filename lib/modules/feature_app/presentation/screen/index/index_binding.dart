import 'package:get/get.dart';
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
    Get.lazyPut(() => PublicLogic());
    Get.lazyPut(() => MineLogic());
    Get.lazyPut(() => ProjectsLogic());
  }
}
