import 'package:get/get.dart';
import 'package:school/app/modules/teacher/pages/add_post_screen/add_post_controller.dart';

class AddPostTeacherBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AddPostTeacherController());
  }
}
