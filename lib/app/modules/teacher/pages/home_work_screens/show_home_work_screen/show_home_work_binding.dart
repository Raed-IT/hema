import 'package:get/get.dart';
import 'package:school/app/modules/teacher/pages/home_work_screens/show_home_work_screen/show_home_work_controller.dart';

class TeacherShowHomeWorkBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(TeacherShowHomeWorkController());
  }
}
