import 'package:get/get.dart';
import 'package:school/app/modules/parent/pages/home_work_screens/home_work_screen/home_work_controller.dart';

import '../../../../../global/data/providers/home_work_provider.dart';

class ParentHomeWorkBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeWorkProvider());
    Get.put(ParentHomeWorkController());
  }
}
