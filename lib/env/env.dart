

import 'package:flutter_dotenv/flutter_dotenv.dart';

class Env {
  static String get baseUrl => dotenv.env[_Env.baseUrlKey] ?? '';
  static String get versionName => dotenv.env[_Env.versionNameKey] ?? '';
  static String get apiToken => dotenv.env[_Env.apiTokenKey] ?? '';
  static int get versionCode => int.parse(dotenv.env[_Env.versionCodeKey] ?? '0');
  static bool get debug => dotenv.env[_Env.debug] == 'true';
}

class _Env {
  static const String baseUrlKey = 'BASE_URL';
  static const String versionNameKey = 'VERSION_NAME';
  static const String apiTokenKey = 'API_TOKEN';
  static const String versionCodeKey = 'VERSION_CODE';
  static const String debug = 'DEBUG';
}