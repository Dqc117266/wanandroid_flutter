import 'package:get/get.dart';
import 'package:wanandroid_flutter/modules/feature_home/presentation/screen/home/home_binding.dart';
import 'package:wanandroid_flutter/modules/feature_home/presentation/screen/home/home_page.dart';

class AppRoutes {
  static RxString curPage = initialRoute.obs;
  static final prePage = Rxn<String>();

  static const initialRoute = "/";

  static final routerPages = [
    GetPage(
        name: HomePage.routeName,
        page: () => HomePage(),
        binding: HomeBinding()),
  ];
}
