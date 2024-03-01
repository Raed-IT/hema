import 'package:get/get.dart';
import 'package:school/app/modules/teacher/pages/add_post_screen/add_post_page.dart';
import 'package:school/app/modules/teacher/pages/exams_screeens/show_marks_screen/marks_page.dart';
import 'package:school/app/modules/teacher/pages/home_screen/home_page.dart';

import '../pages/check_students_screen/check_students_page.dart';
import '../pages/department_screen/department_page.dart';
import '../pages/exams_screeens/add_exams_screen/add_exam_page.dart';
import '../pages/exams_screeens/exams_screen/exam_page.dart';
import '../pages/exams_screeens/update_exam_screen/update_exam_page.dart';
import '../pages/home_work_screens/add_home_work_screen/add_home_work_page.dart';
import '../pages/home_work_screens/home_work_screen/home_work_page.dart';
import '../pages/home_work_screens/show_home_work_screen/show_home_work_page.dart';
import '../pages/home_work_screens/show_works_completed_screen/show_works_completed_page.dart';
import '../pages/home_work_screens/update_home_work/update_home_work_page.dart';
import '../pages/mark_student_screen/mark_student_page.dart';
import '../pages/marker_screens/marcker_screen/marker_page.dart';
import '../pages/notes_screens/add_note_screen/add_note_page.dart';
import '../pages/notes_screens/notes_screen/notes_page.dart';
import '../pages/notes_screens/update_note_screen/update_note_page.dart';
import '../pages/reports_screens/add_report_item_screen/add_report_item_page.dart';
import '../pages/reports_screens/update_report_item_screen/update_report_item_page.dart';
import '../pages/show_students_screen/show_students_page.dart';

class TeacherGetPagesProvider {
  static List<GetPage> getPages = [
    TeacherHomePage(),
    TeacherDepartmentPage(),
    ShowStudentsPage(),
    CheckStudentsPage(),
    TeacherHomeWorkPage(),
    TeacherShowHomeWorkPage(),
    TeacherAddHomeWorkPage(),
    UpdateHomeWorkPage(),
    AddQuizzesPage(),
    TeacherExamPage(),
    TeacherUpdateExamPage(),
    TeacherNotesPage(),
    AddNotePage(),
    TeacherUpdateNotePage(),
    TeacherUpdateReportItemPage(),
    TeacherAddReportItemPage(),
    TeacherMarkerPage(),
    TeacherMarkStudentPage(),
    TeacherMarkersPage(),
    TeacherShowWorksCompletedPage(),
    AddPostTeacherPage(),
  ];
}
