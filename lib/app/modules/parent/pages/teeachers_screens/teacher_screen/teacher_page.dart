import 'package:get/get.dart';
import 'package:school/app/modules/parent/pages/teeachers_screens/teacher_screen/teacher_binding.dart';
import 'package:school/app/modules/parent/pages/teeachers_screens/teacher_screen/teacher_screen.dart';
import 'package:school/app/modules/parent/route/routs.dart';

class ParentTeacherPage extends GetPage {
  ParentTeacherPage()
      : super(
          page: () => ParentTeacherScreen(),
          name: ParentAppRoutes.TEACHER,
          binding: ParentTeacherBinding(),
      transitionDuration: Duration(milliseconds: 700)

  );
}
