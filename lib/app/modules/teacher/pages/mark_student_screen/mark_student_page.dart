import 'package:get/get.dart';
import 'package:school/app/modules/teacher/pages/mark_student_screen/mark_student_binding.dart';
import 'package:school/app/modules/teacher/pages/mark_student_screen/mark_student_screen.dart';
import 'package:school/app/modules/teacher/route/routs.dart';

class TeacherMarkStudentPage extends GetPage {
  TeacherMarkStudentPage()
      : super(
          name: TeacherAppRoutes.MARKERS_STUDENT,
          page: () => TeacherMarkStudentScreen(),
          binding: TeacherMarkStudentBinding(),
        );
}
