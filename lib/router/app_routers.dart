import 'package:get/get.dart';
import 'package:wanandroid_flutter/modules/feature_app/presentation/screen/index/index_binding.dart';
import 'package:wanandroid_flutter/modules/feature_app/presentation/screen/index/index_page.dart';

class AppRoutes {
  static RxString curPage = initialRoute.obs;
  static final prePage = Rxn<String>();

  static const initialRoute = "/";

  static final routerPages = [
    GetPage(
      name: initialRoute,
      page: () => IndexPage(),
      binding: IndexBinding(),
    ),
  ];
}
