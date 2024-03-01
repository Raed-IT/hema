import 'package:get/get.dart';
import 'package:school/app/modules/teacher/pages/home_work_screens/show_home_work_screen/show_home_work_binding.dart';
import 'package:school/app/modules/teacher/pages/home_work_screens/show_home_work_screen/show_home_work_screen.dart';
import 'package:school/app/modules/teacher/route/routs.dart';

class TeacherShowHomeWorkPage extends GetPage {
  TeacherShowHomeWorkPage()
      : super(
          name: TeacherAppRoutes.SHOW_HOME_WORK_SCREEN,
          binding: TeacherShowHomeWorkBinding(),
          page: () => TeacherShowHomeWorkScreen(),
          transitionDuration: const Duration(milliseconds: 500),
        );
}
