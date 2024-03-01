import 'package:get/get.dart';
import 'package:school/app/global/data/middlewares/is_login.dart';
import 'package:school/app/modules/teacher/pages/home_screen/home_binding.dart';
import 'package:school/app/modules/teacher/pages/home_screen/home_screen.dart';
import 'package:school/app/modules/teacher/route/routs.dart';

class TeacherHomePage extends GetPage {
  TeacherHomePage()
      : super(
            name: TeacherAppRoutes.HOME_SCREEN,
            binding: TeacherHomeBinding(),
            page: () => TeacherHomeScreen(),
            middlewares: [IsLoginMiddleware()]);
}
