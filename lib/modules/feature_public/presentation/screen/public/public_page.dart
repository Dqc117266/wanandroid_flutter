import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'public_logic.dart';

class PublicPage extends StatelessWidget {
  static const routeName = '/public';

  const PublicPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PublicLogic logic = Get.find<PublicLogic>();

    return Container();
  }
}
