import 'package:get/get.dart';
import 'package:school/app/global/data/providers/login_provider.dart';
import 'package:school/app/global/data/providers/students_provider.dart';
import 'package:school/app/global/data/providers/absents_provider.dart';
 import 'package:school/app/modules/parent/pages/home_screen/home_controller.dart';

import '../../../../global/data/providers/sliders_provider.dart';

class ParentHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => StudentsProvider());
    Get.lazyPut(() => SliderProvider());
    Get.lazyPut(() => LoginProvider());
    Get.lazyPut(() => AbsentsProvider());
    Get.put(ParentHomeController());
  }
}
