import 'package:get/get.dart';
import 'package:school/app/global/pages/student_profile_screen/student_profile_controller.dart';

class StudentProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(StudentProfileController());
  }
}
