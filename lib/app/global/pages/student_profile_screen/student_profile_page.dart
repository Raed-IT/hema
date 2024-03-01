import 'package:get/get.dart';
import 'package:school/app/global/pages/student_profile_screen/student_profile_binding.dart';
import 'package:school/app/global/pages/student_profile_screen/student_profile_screen.dart';
import 'package:school/app/global/route/routs.dart';

class StudentProfilePage extends GetPage {
  StudentProfilePage()
      : super(
          name: GlobalAppRoutes.PROFILE_STUDENT,
          page: () =>   StudentProfileScreen(),
          binding: StudentProfileBinding(),
        );
}
