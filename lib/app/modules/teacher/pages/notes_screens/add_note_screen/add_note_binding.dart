import 'package:get/get.dart';

import 'add_note_controller.dart';

class AddNoteBinding extends Bindings {
  @override
  void dependencies() {
     Get.put(AddNoteController());
  }
}