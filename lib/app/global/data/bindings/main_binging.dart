import 'package:get/get.dart';
import 'package:school/app/global/pages/splash_screen/splash_controller.dart';
import 'package:school/app/modules/driver/data/mina_driver_controller.dart';


class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SplashScreenController());
    Get.lazyPut(() => DriverMainController(), fenix: true);
   }
}
