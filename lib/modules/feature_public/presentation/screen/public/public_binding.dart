import 'package:get/get.dart';

import 'public_logic.dart';

class PublicBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PublicLogic());
  }
}
