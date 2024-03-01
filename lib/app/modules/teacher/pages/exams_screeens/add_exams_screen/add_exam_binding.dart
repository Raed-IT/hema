import 'package:get/get.dart';

import 'add_exam_controller.dart';

class AddQuizzesBinding extends Bindings {
  @override
  void dependencies() {
     Get.put(TeacherAddExamController());
  }
}
