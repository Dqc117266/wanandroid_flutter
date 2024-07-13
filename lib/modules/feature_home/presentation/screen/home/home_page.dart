import 'package:dio/dio.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
    await logic.getHomeArticles(0);
    await logic.getBanner(); // 获取banner数据
    await logic.getHomeTopArticles(); // 获取首页置顶文章数据
  }

  @override
  Widget build(BuildContext context) {
    final dataList = logic.dataList;
    print("${dataList.length}");
    return Scaffold(
      appBar: AppBar(
        title: Text("title"),
      ),
      body: Obx(() {
        return ScrollConfiguration(
          behavior: ScrollBehavior(),
          child: NotificationListener<ScrollNotification>(
            onNotification: (scrollNotification) {
              // scrollNotificationCallback(scrollNotification);
              return false;
            },
            child: EasyRefresh(
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
            ),
          ),
        );
      }),
    );
  }

  @override
  void dispose() {
    Get.delete<HomeLogic>();
    super.dispose();
  }
}
