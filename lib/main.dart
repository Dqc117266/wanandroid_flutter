import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:wanandroid_flutter/modules/feature_app/app.dart';
import 'package:wanandroid_flutter/modules/feature_app/app_dependencies.dart';
import 'package:wanandroid_flutter/modules/feature_home/home_dependencies.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();

  //依赖注入
  AppDependencies.init();
  HomeDependencies.init();

  runApp(MyApp());
}
