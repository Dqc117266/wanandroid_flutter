import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:wanandroid_flutter/modules/feature_base/common/component/keep_alive_wrapper.dart';
import 'package:wanandroid_flutter/modules/feature_home/presentation/screen/home/home_page.dart';
import 'package:wanandroid_flutter/modules/feature_mine/presentation/screen/mine/mine_page.dart';
import 'package:wanandroid_flutter/modules/feature_projects/presentation/screen/projects/projects_page.dart';
import 'package:wanandroid_flutter/modules/feature_public/presentation/screen/public/public_page.dart';

class IndexLogic extends GetxController {
  RxInt index = 0.obs;
  PageController pageController = PageController(initialPage: 0);

  final List<Widget> navPages = [
    const KeepAliveWrapper(child: HomePage()),
    const KeepAliveWrapper(child: ProjectsPage()),
    const KeepAliveWrapper(child: PublicPage()),
    const KeepAliveWrapper(child: MinePage()),
  ];

  void navigate(int index) {
    this.index.value = index;
    pageController.jumpToPage(index);
  }

}
