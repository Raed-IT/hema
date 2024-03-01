import 'package:get/get.dart';
import 'package:school/app/modules/teacher/route/routs.dart';

import '../../../../global/data/middlewares/is_login.dart';
import 'check_students_binding.dart';
import 'check_students_screen.dart';

class CheckStudentsPage extends GetPage{
  CheckStudentsPage():super(
      name: TeacherAppRoutes.CHECK_STUDENTS,
      binding: CheckStudentsBinding(),
      page: ()=>CheckStudentsScreen(),
      middlewares: [IsLoginMiddleware()]
  );
}