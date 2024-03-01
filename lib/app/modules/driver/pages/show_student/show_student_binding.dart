import 'package:get/get.dart';
import 'package:school/app/modules/driver/pages/show_student/show_student_controller.dart';

class DriverShowStudentBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DriverShowStudentController());
  }
}
