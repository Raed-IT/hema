import 'package:get/get.dart';
 import 'package:school/app/modules/parent/pages/statistic_screen/statistic_controller.dart';


class StatisticBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(StatisticController());
  }
}
