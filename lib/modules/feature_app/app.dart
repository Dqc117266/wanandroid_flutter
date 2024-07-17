import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
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
        initialRoute: AppRoutes.initialRoute,
      ),
    );
  }
}
