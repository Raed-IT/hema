import 'package:get/get.dart';
import 'package:school/app/modules/teacher/pages/exams_screeens/update_exam_screen/update_exam_controller.dart';

class TeacherUpdateExamBinding extends Bindings {
  @override
  void dependencies() {
     Get.put(TeacherUpdateExamController());
  }
}
