import 'package:get/get.dart';
 import 'package:school/app/modules/teacher/route/routs.dart';

import 'exam_binding.dart';
import 'exam_screen.dart';

class TeacherExamPage extends GetPage {
  TeacherExamPage()
      : super(
            name: TeacherAppRoutes.EXAMS_SCREEN,
            page: () => const TeacherExamScreen(),
            binding: TeacherExamBinding());
}
