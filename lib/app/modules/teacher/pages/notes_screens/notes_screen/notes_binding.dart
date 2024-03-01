import 'package:get/get.dart';

import 'notes_controller.dart';


class TeacherNotesBinding extends Bindings {
  @override
  void dependencies() {
     Get.put(TeacherNotesController());
  }
}
