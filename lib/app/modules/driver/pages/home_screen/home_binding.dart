import 'package:get/get.dart';
import 'package:school/app/modules/driver/pages/home_screen/home_conteoller.dart';

class DrierHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DriverHomeController());
  }
}
