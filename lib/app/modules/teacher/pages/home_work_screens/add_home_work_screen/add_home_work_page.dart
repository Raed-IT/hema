import 'package:get/get.dart';
import 'package:school/app/modules/teacher/route/routs.dart';

import 'add_home_work_binding.dart';
import 'add_home_work_screen.dart';

class TeacherAddHomeWorkPage extends GetPage {
  TeacherAddHomeWorkPage()
      : super(
          name: TeacherAppRoutes.ADD_HOME_WORK_SCREEN,
          page: () => TeacherAddHomeWorkScreen(),
          binding: TeacherAddHomeWorkBinding(),
          transitionDuration: const Duration(milliseconds: 500),
        );
}
