import 'package:get/get.dart';
import 'package:school/app/modules/driver/pages/show_student/show_student_binding.dart';
import 'package:school/app/modules/driver/pages/show_student/show_student_screen.dart';
import 'package:school/app/modules/driver/route/routs.dart';

class DriverShowStudentPage extends GetPage {
  DriverShowStudentPage()
      : super(
            name: DriverAppRoutes.SHOW_STUDENT_SCREEN,
            page: () => DriverShowStudentScreen(),
            binding: DriverShowStudentBinding(),
            transition: Transition.cupertinoDialog,
            transitionDuration: const Duration(milliseconds: 500));
}
