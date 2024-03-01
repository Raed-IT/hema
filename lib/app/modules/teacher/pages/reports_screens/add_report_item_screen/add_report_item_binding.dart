import 'package:get/get.dart';

import 'add_report_item_controller.dart';

class TeacherAddReportItemBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(TeacherAddReportItemController());
  }

}