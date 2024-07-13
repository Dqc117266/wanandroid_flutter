import 'package:get/get.dart';

import 'projects_logic.dart';

class ProjectsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProjectsLogic());
  }
}
