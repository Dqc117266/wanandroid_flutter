import 'package:carousel_slider/carousel_slider.dart';
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
          duration: Duration(milliseconds: 300),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return FadeTransition(opacity: animation, child: child);
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
      return EasyRefresh(
        controller: logic.easyController,
        onRefresh: () => logic.refreshData(),
        onLoad: () => logic.loadMoreData(),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: _buildCarousel(),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: logic.dataList.length,
                (context, index) {
                  final item = logic.dataList[index];
                  return ListTile(title: Text(item.title!));
                },
              ),
            ),
          ],
        ),
      );
    }
    return Container();
  }

  Widget _buildCarousel() {
    final logic = Get.find<HomeLogic>();
    return Obx(() {
      if (logic.bannerList.isEmpty) {
        return Container();
      }

      return CarouselSlider(
        options: CarouselOptions(
          height: 200,
          autoPlay: true,
          enlargeCenterPage: true,
          aspectRatio: 16 / 9,
          viewportFraction: 0.8,
        ),
        items: logic.bannerList.map((banner) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(
                  color: Colors.amber,
                ),
                child: Image.network(banner.imagePath!, fit: BoxFit.cover),
              );
            },
          );
        }).toList(),
      );
    });
  }
}
