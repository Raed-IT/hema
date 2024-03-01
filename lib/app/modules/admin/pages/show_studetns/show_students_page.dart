import 'package:get/get.dart';
import 'package:school/app/modules/admin/pages/show_studetns/show_students_binding.dart';
import 'package:school/app/modules/admin/pages/show_studetns/show_students_screen.dart';
import 'package:school/app/modules/admin/route/routs.dart';

class AdminShowStudentsPage extends GetPage {
  AdminShowStudentsPage()
      : super(
            page: () => AdminShowStudentsScreen(),
            name: AdminAppRoutes.SHOW_STUDENTS,
            binding: AdminShowStudentsBinding());
}
