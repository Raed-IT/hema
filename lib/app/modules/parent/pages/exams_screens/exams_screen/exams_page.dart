import 'package:get/get.dart';
import 'package:school/app/modules/parent/route/routs.dart';

import 'exams_binding.dart';
import 'exams_screen.dart';

class ParentExamsPage extends GetPage{
  ParentExamsPage():super(
    name: ParentAppRoutes.EXAMS_SCREEN,
    page: ()=>ParentExamsScreen(),
    binding: ParentExamsBinding(),
    transitionDuration: Duration(milliseconds: 700)
  );

}