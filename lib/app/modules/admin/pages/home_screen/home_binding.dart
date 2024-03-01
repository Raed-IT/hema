import 'package:get/get.dart';
import 'package:school/app/modules/admin/pages/home_screen/home_controller.dart';

class AdminHomeBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(AdminHomeController());
  }

}