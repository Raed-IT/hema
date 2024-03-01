import 'package:get/get.dart';
 import 'package:school/app/modules/parent/pages/show_student/show_studeent_binding.dart';
import 'package:school/app/modules/parent/pages/show_student/show_studeent_screen.dart';
import 'package:school/app/modules/parent/route/routs.dart';

class ParentShowStudentPage extends GetPage {
  ParentShowStudentPage()
      : super(
            name: ParentAppRoutes.SHOW_STUDENT,
            page: () => ParentShowStudentScreen(),
            binding: ParentShowStudentBinding(),
            transitionDuration: Duration(milliseconds: 700));
}
