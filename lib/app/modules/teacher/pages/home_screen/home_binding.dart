import 'package:get/get.dart';
 import 'package:school/app/modules/teacher/pages/home_screen/home_conteoller.dart';

class TeacherHomeBinding extends Bindings {
  @override
  void dependencies() {
     Get.put(TeacherHomeController());
  }
}
