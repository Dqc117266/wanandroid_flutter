import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index_logic.dart';

class IndexPage extends StatelessWidget {
  static const routeName = '/index';
  IndexPage({Key? key}) : super(key: key);

  final List<NavigationDestination> bottomNavigationBarItems = [
    _bottomNavigationBarItem(Icons.home, "主页"),
    _bottomNavigationBarItem(Icons.layers, "项目"),
    _bottomNavigationBarItem(Icons.wechat, "公众号"),
    _bottomNavigationBarItem(Icons.person, "我的"),
  ];

  static NavigationDestination _bottomNavigationBarItem(IconData defaultImage, String label) {
    return NavigationDestination(
      icon: Icon(defaultImage),
      label: label,
    );
  }

  @override
  Widget build(BuildContext context) {
    final IndexLogic logic = Get.find<IndexLogic>();

    return Obx(() => Scaffold(
      body: PageView(
        controller: logic.pageController,
        physics: NeverScrollableScrollPhysics(),
        children: logic.navPages,
        onPageChanged: (int index) {
          logic.navigate(index);
        },
      ),
      bottomNavigationBar: Focus(
        autofocus: false,
        child: NavigationBar(
          selectedIndex: logic.index.value,
          onDestinationSelected: (index) {
            logic.navigate(index);
          },
          destinations: bottomNavigationBarItems,
        ),
      ),
    ));
  }
}
