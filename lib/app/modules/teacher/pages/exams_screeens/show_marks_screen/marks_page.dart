import 'package:get/get.dart';
import 'package:school/app/modules/parent/route/routs.dart';

import '../../../route/routs.dart';
import 'marks_binding.dart';
import 'marks_screen.dart';



class TeacherMarkersPage extends GetPage {
  TeacherMarkersPage()
      : super(
    page: () => TeacherMarkersScreen(),
    name: TeacherAppRoutes.SHOW_MARKERS_SCREN,
    binding: TeacherMarkersBinding(),
    transitionDuration: const Duration(milliseconds: 700),
  );
}