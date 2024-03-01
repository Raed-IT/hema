import 'package:get/get.dart';
import 'package:school/app/modules/parent/pages/teeachers_screens/profile_teacher/profile_teacher_binding.dart';
import 'package:school/app/modules/parent/pages/teeachers_screens/profile_teacher/profile_teacher_screen.dart';
import 'package:school/app/modules/parent/route/routs.dart';
 class ParentProfileTeacherPage extends GetPage {
  ParentProfileTeacherPage()
      : super(
            page: () => ParentProfileTeacherScreen(),
            name: ParentAppRoutes.SHOW_TEACHER,
            binding: ParentProfileTeacherBinding(),
            transitionDuration: const Duration(milliseconds: 700));
}
