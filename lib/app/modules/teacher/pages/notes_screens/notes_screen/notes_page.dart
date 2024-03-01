import 'package:get/get.dart';
import 'package:school/app/modules/teacher/route/routs.dart';

import 'notes_binding.dart';
import 'notes_screen.dart';

class TeacherNotesPage  extends GetPage{
  TeacherNotesPage():super(
      name: TeacherAppRoutes.NOTES,
      page: () => TeacherNotesScreen(),
      binding: TeacherNotesBinding(),
      transitionDuration: const Duration(milliseconds: 1000));

}