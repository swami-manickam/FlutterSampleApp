import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class ToDoPage extends StatelessWidget {
  ToDoPage({Key? key}) : super(key: key);

  final logic = Get.put(ToDoLogic());
  final state = Get.find<ToDoLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
