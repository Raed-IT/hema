import 'package:get/get.dart';
import 'package:school/app/modules/parent/pages/home_work_screens/show_home_work_screen/show_home_work_controller.dart';

class ParentShowHomeWorkBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ParentShowHomeWorkController());
  }
}
