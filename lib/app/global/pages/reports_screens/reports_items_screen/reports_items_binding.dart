import 'package:get/get.dart';
import 'package:school/app/global/pages/reports_screens/reports_items_screen/reports_items_controller.dart';

class ReportsItemsBinding extends Bindings{
  @override
  void dependencies() {
     Get.put(ReportsItemsController());
  }
}