import 'package:get/get.dart';

import 'home_work_controller.dart';

class HomeWorkBinding extends Bindings {
  @override
  void dependencies() {
     Get.put(TeacherHomeWorkController());
  }
}
