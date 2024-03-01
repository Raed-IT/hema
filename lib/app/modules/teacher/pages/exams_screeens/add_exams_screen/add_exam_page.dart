import 'package:get/get.dart';
 import 'package:school/app/modules/teacher/route/routs.dart';

import 'add_exam_binding.dart';
import 'add_exam_screen.dart';

class AddQuizzesPage extends GetPage {
  AddQuizzesPage()
      : super(
            name: TeacherAppRoutes.ADD_EXAM_CREEN,
            page: () => AddQuizzesScreen(),
            binding: AddQuizzesBinding(),
            transitionDuration: Duration(milliseconds: 700));
}
