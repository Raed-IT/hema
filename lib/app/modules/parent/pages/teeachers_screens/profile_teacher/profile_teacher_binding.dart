import 'package:get/get.dart';
import 'package:school/app/modules/parent/pages/teeachers_screens/profile_teacher/profile_teacher_controller.dart';

class ParentProfileTeacherBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(ParentProfileTeacherController());
  }

}