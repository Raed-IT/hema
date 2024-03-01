import 'package:get/get.dart';
import 'package:school/app/global/pages/weekly_program_screen/weekly_program_controlleer.dart';



class WeeklyProgramBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(WeeklyProgramController());
  }
}
