import 'package:get/get.dart';

import 'exam_controller.dart';

class TeacherExamBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(TeacherExamController());
  }
}
