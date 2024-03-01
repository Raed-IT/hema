import 'package:get/get.dart';
import 'package:school/app/modules/teacher/route/routs.dart';

import 'home_work_binding.dart';
import 'home_work_screen.dart';

class TeacherHomeWorkPage extends GetPage {
  TeacherHomeWorkPage()
      : super(
            name: TeacherAppRoutes.HOME_WORK_SCREEN,
            page: () => TeacherHomeWorkScreen(),
            binding: HomeWorkBinding(),
            transitionDuration: const Duration(milliseconds: 500));
}
