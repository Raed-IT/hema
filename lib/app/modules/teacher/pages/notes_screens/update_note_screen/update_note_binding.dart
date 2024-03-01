import 'package:get/get.dart';
import 'package:school/app/modules/teacher/pages/notes_screens/update_note_screen/update_note_controller.dart';

class TeacherUpdateNoteBinding extends Bindings{
  @override
  void dependencies() {
     Get.put(TeacherUpdateNoteController());
  }

}