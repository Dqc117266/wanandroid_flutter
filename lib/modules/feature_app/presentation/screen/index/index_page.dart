import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wanandroid_flutter/generated/svg/wan_svgs.g.dart';
import 'package:wanandroid_flutter/modules/feature_base/presentation/widgets/wan_svg.dart';

import 'index_logic.dart';

class IndexPage extends StatelessWidget {
  IndexPage({Key? key}) : super(key: key);

  final List<BottomNavigationBarItem> bottomNavigationBarItems = [
    _bottomNavigationBarItem(WanSvgs.home_unselected_m, "主页"),
    _bottomNavigationBarItem(WanSvgs.projects_unselected_m, "项目"),
    _bottomNavigationBarItem(WanSvgs.projects_unselected_m, ""),
    _bottomNavigationBarItem(WanSvgs.projects_unselected_m, ""),
  ];


  static BottomNavigationBarItem _bottomNavigationBarItem(WanSvgData defaultImage, String label) {
    return BottomNavigationBarItem(
      icon: WanSvg(defaultImage),
      label: label,
    );
  }

  @override
  Widget build(BuildContext context) {
    final IndexLogic logic = Get.find<IndexLogic>();

    return Container();
  }
}
