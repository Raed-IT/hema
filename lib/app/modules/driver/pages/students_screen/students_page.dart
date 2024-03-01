import 'package:get/get.dart';
import 'package:school/app/modules/driver/pages/students_screen/students_binding.dart';
import 'package:school/app/modules/driver/pages/students_screen/students_screen.dart';
import 'package:school/app/modules/driver/route/routs.dart';

import '../../../../global/data/middlewares/is_login.dart';

class DriverStudentsPage extends GetPage {
  DriverStudentsPage()
      : super(
            name: DriverAppRoutes.SHOW_STUDENTS_SCREEN,
            page: () => DriverStudentsScreen(),
            binding: DriverStudentsBinding(),
            transition: Transition.cupertinoDialog,
            transitionDuration: const Duration(milliseconds: 500),
            middlewares: [IsLoginMiddleware()]);
}
