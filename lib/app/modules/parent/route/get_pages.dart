import 'package:get/get.dart';
import 'package:school/app/modules/parent/pages/home_screen/home_page.dart';
import 'package:school/app/modules/parent/pages/show_student/show_studeent_page.dart';
import 'package:school/app/modules/parent/pages/statistic_screen/statistic_page.dart';
import 'package:school/app/modules/parent/pages/teeachers_screens/profile_teacher/profile_teacher_page.dart';
import '../pages/expenses_screen/expenses_page.dart';
import '../pages/home_work_screens/home_work_screen/home_work_page.dart';
import '../pages/home_work_screens/show_home_work_screen/show_home_work_page.dart';
import '../pages/map_screen/map_page.dart';
import '../pages/marks_screen/marks_page.dart';
import '../pages/nots_screen/notes_page.dart';
import '../pages/present_tabel_screens/main_present_screen/main_present_page.dart';
import '../pages/present_tabel_screens/show_table_present/show_present_page.dart';
import '../pages/exams_screens/exams_screen/exams_page.dart';
 import '../pages/teeachers_screens/teacher_screen/teacher_page.dart';

class ParentGetPagesProvider {
  static List<GetPage> getPages = [
    ParentHomePage(),
    ParentShowStudentPage(),
    ParentProfileTeacherPage(),
    ParentTeacherPage(),
    ParentHomeWorkPage(),
    ParentShowHomeWorkPage(),
    ParentNotesPage(),
    ParentMarkersPage(),
    ParentMainPresentPage(),
    ParentShowPresentPage(),
    ParentExamsPage(),
    ParentMapPage(),
    ParentExpensesPage(),
    StatisticPage(),
   ];
}
