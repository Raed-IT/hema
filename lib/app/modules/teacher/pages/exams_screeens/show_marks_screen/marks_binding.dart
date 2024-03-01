import 'package:get/get.dart';

import 'marks_controller.dart';

class TeacherMarkersBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(TeacherMarkersController());
  }
}
