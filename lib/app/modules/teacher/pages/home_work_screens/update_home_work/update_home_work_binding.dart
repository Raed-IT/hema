import 'package:get/get.dart';
import 'package:school/app/modules/teacher/pages/home_work_screens/update_home_work/update_home_work_controller.dart';

class UpdateHomeWorkBinding extends Bindings {
  @override
  void dependencies() {
     Get.put(UpdateHomeWorkController());
   }
}
