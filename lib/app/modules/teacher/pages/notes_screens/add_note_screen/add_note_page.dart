import 'package:get/get.dart';
import 'package:school/app/modules/teacher/route/routs.dart';

import 'add_note_binding.dart';
import 'add_note_screen.dart';

class AddNotePage extends GetPage {
  AddNotePage()
      : super(
            name: TeacherAppRoutes.ADD_NOTES,
            page: () => AddNoteScreen(),
            binding: AddNoteBinding(),
            transitionDuration: Duration(milliseconds: 700));
}
