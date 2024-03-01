import 'package:get/get.dart';
import 'package:school/app/modules/teacher/pages/exams_screeens/update_exam_screen/update_exam_binding.dart';
import 'package:school/app/modules/teacher/pages/exams_screeens/update_exam_screen/update_exam_screen.dart';
import 'package:school/app/modules/teacher/route/routs.dart';

class TeacherUpdateExamPage extends GetPage{
  TeacherUpdateExamPage():super(
    name: TeacherAppRoutes.UPDATE_EXAM,
    page:()=> TeacherUpdateExamScreen(),
    binding: TeacherUpdateExamBinding(),
  );

}