import 'package:get/get.dart';
import 'package:school/app/modules/teacher/pages/show_students_screen/show_students_controller.dart';

class ShowStudentsBinding extends Bindings {
  @override
  void dependencies() {
     Get.put(ShowStudentsController());
  }
}
