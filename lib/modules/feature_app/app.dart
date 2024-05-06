import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:wanandroid_flutter/modules/feature_home/presentation/screen/home/home_page.dart';
import 'package:wanandroid_flutter/router/app_routers.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(750, 1334),
      builder: (context, child) => GetMaterialApp(
        showPerformanceOverlay: false,
        defaultTransition: Transition.rightToLeft,
        getPages: AppRoutes.routerPages,
        initialRoute: HomePage.routeName,
      ),
    );
  }
}
