import 'package:get/get.dart';
import 'package:school/app/modules/parent/pages/show_student/show_studeent_controller.dart';

class ParentShowStudentBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ParentShowStudentController());
  }
}
