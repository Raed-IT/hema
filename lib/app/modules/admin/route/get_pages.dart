import 'package:get/get.dart';

import '../pages/home_screen/home_page.dart';
import '../pages/show_studetns/show_students_page.dart';

class AdminGetPagesProvider {
  static List<GetPage> getPages = [
    AdminHomePage(),
    AdminShowStudentsPage(),
    ];
}
