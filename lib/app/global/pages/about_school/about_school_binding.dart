import 'package:get/get.dart';

import 'about_school_controller.dart';

class AboutSchoolBinding extends Bindings {
  @override
  void dependencies() {
     Get.put(AboutSchoolController());
  }
}
