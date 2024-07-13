import 'dart:io';

void main() {
  // 指定 SVG 文件所在的目录
  const String svgDirectory = 'assets/icons/svg';
  const String outputDirectory = 'lib/generated/svg';

  // 创建保存生成代码的目录
  Directory(outputDirectory).createSync(recursive: true);

  // 生成 Dart 代码的类头部
  String classHeader = '''
import 'package:teltek_flutter/modules/feature_base/presentation/widgets/teltek_svg.dart';
  
class WanSvgs {
''';

  // 生成 Dart 代码的类尾部
  String classFooter = '''
}
''';

  // 生成 Dart 代码的类主体
  String classBody = '';

  // 获取目录中的所有文件
  Directory(svgDirectory).listSync().forEach((FileSystemEntity entity) {
    if (entity is File && entity.path.endsWith('.svg')) {
      // 提取文件名
      String fileName = entity.path.split('/').last.split('.').first;

      // 生成 Dart 代码
      String dartCode = '''
  static const ${fileName}_m = WanSvgData('${entity.path}');
''';

      // 将 Dart 代码添加到类主体
      classBody += dartCode;
    }
  });

  // 拼接完整的 Dart 代码
  String fullDartCode = classHeader + classBody + classFooter;

  // 将 Dart 代码写入到文件中
  File('$outputDirectory/wan_svgs.g.dart').writeAsStringSync(fullDartCode);
}
