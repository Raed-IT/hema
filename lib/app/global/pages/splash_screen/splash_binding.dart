
import 'package:get/get.dart';
import 'package:school/app/global/data/controllers/main_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MainController(),permanent: true);
  }
}
