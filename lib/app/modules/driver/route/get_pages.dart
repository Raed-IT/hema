import 'package:get/get.dart';
import 'package:school/app/modules/driver/pages/home_screen/home_page.dart';
import '../pages/show_student/show_student_page.dart';
import '../pages/students_screen/students_page.dart';

class DriverGetPagesProvider {
  static List<GetPage> getPages = [
    DriverHomePage(),
    DriverStudentsPage(),
    DriverShowStudentPage()
   ];
}
