import 'package:get/get.dart';
import 'package:school/app/modules/driver/pages/students_screen/students_controller.dart';

class DriverStudentsBinding extends Bindings {
  @override
  void dependencies() {
    if (Get.isRegistered<DriverStudentsScreenController>()) {
      Get.delete<DriverStudentsScreenController>();
    }
    Get.put(DriverStudentsScreenController());
  }
}
