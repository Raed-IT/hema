import 'package:get/get.dart';

import 'exams_controller.dart';

class ParentExamsBinding extends Bindings {
  @override
  void dependencies() {
    // Get.lazyPut(() => QuizzesProvider());
    Get.put(ParentExamsController());
  }
}
