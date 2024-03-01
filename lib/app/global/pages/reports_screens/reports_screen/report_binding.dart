import 'package:get/get.dart';
import 'package:school/app/global/pages/reports_screens/reports_screen/report_controller.dart';

class ReportBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ReportController());
  }
}
