import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'projects_logic.dart';

class ProjectsPage extends StatelessWidget {
  static const routeName = '/project';

  const ProjectsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProjectsLogic logic = Get.find<ProjectsLogic>();

    return Container();
  }
}
