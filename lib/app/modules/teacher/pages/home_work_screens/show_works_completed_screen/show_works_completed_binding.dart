import 'package:get/get.dart';
import 'package:school/app/modules/teacher/pages/home_work_screens/show_works_completed_screen/show_works_completed_controller.dart';

class TeacherShowWorksCompletedBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(TeacherShowWorksCompletedController());
  }
}
