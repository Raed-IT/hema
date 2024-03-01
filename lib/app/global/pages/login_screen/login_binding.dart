
import 'package:get/get.dart';
import 'package:school/app/global/pages/login_screen/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {

    Get.put(LoginScreenController());
  }
}