import 'package:get/get.dart';
import 'package:school/app/modules/teacher/pages/home_work_screens/update_home_work/update_home_work_binding.dart';
import 'package:school/app/modules/teacher/pages/home_work_screens/update_home_work/update_home_work_screen.dart';
import 'package:school/app/modules/teacher/route/routs.dart';

class UpdateHomeWorkPage extends GetPage {
  UpdateHomeWorkPage()
      : super(
          name: TeacherAppRoutes.UPDATE_HOME_WORK_SCREEN,
          page: () => UpdateHomeWorkScreen(),
          binding: UpdateHomeWorkBinding(),
        );
}
