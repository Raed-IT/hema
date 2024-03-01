import 'package:get/get.dart';
import 'package:school/app/modules/admin/pages/show_studetns/show_students_controller.dart';

class AdminShowStudentsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AdminShowStudentsController());
  }
}
