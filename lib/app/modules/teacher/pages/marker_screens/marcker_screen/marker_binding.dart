import 'package:get/get.dart';
import 'package:school/app/modules/teacher/pages/marker_screens/marcker_screen/marker_controller.dart';

class TeacherMarkerBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(TeacherMarkerController());
  }
}
