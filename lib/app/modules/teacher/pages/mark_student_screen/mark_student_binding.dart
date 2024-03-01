import 'package:get/get.dart';
import 'package:school/app/modules/teacher/pages/mark_student_screen/mark_student_controller.dart';

class TeacherMarkStudentBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(TeacherMarkStudentController());
  }

}