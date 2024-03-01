import 'package:get/get.dart';
import 'package:school/app/modules/teacher/pages/home_work_screens/show_works_completed_screen/show_works_completed_binding.dart';
import 'package:school/app/modules/teacher/pages/home_work_screens/show_works_completed_screen/show_works_completed_screen.dart';
import 'package:school/app/modules/teacher/route/routs.dart';

class TeacherShowWorksCompletedPage extends GetPage{
  TeacherShowWorksCompletedPage():super(
    name: TeacherAppRoutes.SHOW_WORKS_COMPLETED,
    page: ()=>const TeacherShowWorksCompletedScreen(),
    binding: TeacherShowWorksCompletedBinding(),
  );
}