import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wanandroid_flutter/modules/feature_base/presentation/view_state/view_state.dart';

import 'home_logic.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<HomeLogic>();

    return Scaffold(
      appBar: AppBar(
        title: Text("首页"),
      ),
      body: Obx(() {
        final viewState = logic.viewState.value;

        return AnimatedSwitcher(
          duration: Duration(milliseconds: 300), // 动画持续时间
          transitionBuilder: (Widget child, Animation<double> animation) {
            return FadeTransition(opacity: animation, child: child); // 使用渐隐动画
          },
          child: _buildContent(viewState, logic),
        );
      }),
    );
  }

  Widget _buildContent(ViewState viewState, HomeLogic logic) {
    if (viewState.isLoading()) {
      return Center(child: CircularProgressIndicator());
    } else if (viewState.isSuccess()) {
      return _buildEasyRefresh(logic);
    }

    return Container();
  }

  Widget _buildEasyRefresh(HomeLogic logic) {
    return EasyRefresh(
      controller: logic.easyController,
      onRefresh: () async {
        logic.refreshData();
      },
      onLoad: () async {
        logic.loadMoreData();
      },
      child: ListView.builder(
        itemCount: logic.dataList.length,
        itemBuilder: (context, index) {
          final item = logic.dataList[index];
          return ListTile(title: Text(item.title!));
        },
      ),
    );
  }
}
