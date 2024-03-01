import 'package:get/get.dart';

import 'check_students_controller.dart';

class CheckStudentsBinding extends Bindings {
  @override
  void dependencies() {
     Get.put(CheckStudentsController());
  }
}
