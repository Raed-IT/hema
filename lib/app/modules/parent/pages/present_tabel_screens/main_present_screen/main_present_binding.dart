import 'package:get/get.dart';

import '../../../../../global/data/providers/staticitc_provider.dart';
import 'main_present_controller.dart';

class ParentMainPresentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => StatisticsProvider());
    Get.put(ParentMainPresentController());
  }
}
