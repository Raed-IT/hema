import 'package:get/get.dart';

import 'map_controller.dart';

class ParentMapBinding extends Bindings {
  @override
  void dependencies() {
    // Get.lazyPut(() => MApProvider());
    Get.put(ParentMapController());
  }
}
