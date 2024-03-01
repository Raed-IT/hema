import 'package:get/get.dart';
import 'package:school/app/modules/teacher/pages/notes_screens/update_note_screen/update_note_binding.dart';
import 'package:school/app/modules/teacher/pages/notes_screens/update_note_screen/update_note_screen.dart';
import 'package:school/app/modules/teacher/route/routs.dart';

class TeacherUpdateNotePage extends GetPage {
  TeacherUpdateNotePage()
      : super(
          page: () => TeacherUpdateNoteScreen(),
          name: TeacherAppRoutes.UPDATE_NOTE,
          binding: TeacherUpdateNoteBinding(),
        );
}
