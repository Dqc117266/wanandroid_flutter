import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'mine_logic.dart';

class MinePage extends StatelessWidget {
  static const routeName = '/mine';

  const MinePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MineLogic logic = Get.find<MineLogic>();

    return Container();
  }
}
