import 'package:get/get.dart';
import 'package:school/app/modules/teacher/pages/reports_screens/update_report_item_screen/update_report_item_controller.dart';

class TeacherUpdateReportItemBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(TeacherUpdateReportItemController());
  }
}
