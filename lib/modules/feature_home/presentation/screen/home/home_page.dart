import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wanandroid_flutter/modules/feature_base/presentation/view_state/view_state.dart';
import 'package:wanandroid_flutter/modules/feature_home/data/model/home_article_results_model.dart';

import 'home_logic.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static const routeName = '/home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  EasyRefreshController _controller = EasyRefreshController(
    controlFinishRefresh: true,
    controlFinishLoad: true,
  );

  final logic = Get.find<HomeLogic>();

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    // await logic.getHomeArticles(0);
    // await logic.getBanner(); // 获取banner数据
    // await logic.getHomeTopArticles(); // 获取首页置顶文章数据
  }

  @override
  Widget build(BuildContext context) {
    logic.send(0);
    return Scaffold(
      appBar: AppBar(
        title: Text("title"),
      ),
      body: Obx(() {
        final viewState = logic.viewState.value;

        return AnimatedSwitcher(
          duration: Duration(milliseconds: 300), // 动画持续时间
          transitionBuilder: (Widget child, Animation<double> animation) {
            return FadeTransition(opacity: animation, child: child); // 使用渐隐动画
          },
          child: _buildContent(viewState),
        );
      }),
    );
  }

  Widget _buildContent(ViewState viewState) {
    if (viewState.isLoading()) {
      return Center(child: CircularProgressIndicator());
    } else if (viewState.isSuccess()) {
      final data = viewState.data as HomeArticleResultsModel;
      return _buildEasyRefresh(data.datas);
    } else if (viewState.isEmpty()) {
      return Center(child: Text('No Data Available'));
    } else if (viewState.isError()) {
      return Center(child: Text('Error: ${(viewState as ViewStateError).errorMessage}'));
    } else if (viewState.isFail()) {
      return Center(child: Text('Request Failed: ${(viewState as ViewStateFail).errorMessage}'));
    } else {
      return Container();
    }
  }

  Widget _buildEasyRefresh(dataList) {
    return EasyRefresh(
      controller: _controller,
      header: ClassicHeader(),
      footer: ClassicFooter(),
      onRefresh: () {
        _controller.finishRefresh();
      },
      onLoad: () {
        _controller.finishLoad(IndicatorResult.noMore);
      },
      child: ListView.builder(
        itemCount: dataList.length,
        itemBuilder: (context, index) {
          return ListTile(title: Text(dataList[index].title!));
        },
      ),
    );
  }

  @override
  void dispose() {
    Get.delete<HomeLogic>();
    super.dispose();
  }
}
