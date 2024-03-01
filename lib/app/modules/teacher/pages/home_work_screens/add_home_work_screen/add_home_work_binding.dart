import 'package:get/get.dart';

 import 'add_home_work_controller.dart';

class TeacherAddHomeWorkBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(TeacherAddHomeWorkController());
  }
}
