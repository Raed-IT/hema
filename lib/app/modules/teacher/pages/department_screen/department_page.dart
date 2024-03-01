
import 'package:get/get.dart';
import 'package:school/app/modules/teacher/route/routs.dart';

import '../../../../global/data/middlewares/is_login.dart';
import 'department_binding.dart';
import 'department_screen.dart';

class TeacherDepartmentPage extends GetPage{
  TeacherDepartmentPage():super(
      name: TeacherAppRoutes.DEPARTMENT,
      binding: TeacherDepartmentBinding(),
      page: ()=>TeacherDepartmentScreen(),
      middlewares: [IsLoginMiddleware()]
  );
}