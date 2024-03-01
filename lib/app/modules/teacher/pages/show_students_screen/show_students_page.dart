import 'package:get/get.dart';
import 'package:school/app/modules/teacher/pages/show_students_screen/show_students_binding.dart';
import 'package:school/app/modules/teacher/pages/show_students_screen/show_students_screen.dart';
import 'package:school/app/modules/teacher/route/routs.dart';

class ShowStudentsPage extends GetPage {
  ShowStudentsPage()
      : super(
          name: TeacherAppRoutes.SHOW_STUDENTS,
          page: () => ShowStudentsScreen(),
          binding: ShowStudentsBinding(),
        );
}
