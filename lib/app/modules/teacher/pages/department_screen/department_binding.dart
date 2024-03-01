import 'package:get/get.dart';

import 'department_controller.dart';

class TeacherDepartmentBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(TeacherDepartmentController());
  }
}
