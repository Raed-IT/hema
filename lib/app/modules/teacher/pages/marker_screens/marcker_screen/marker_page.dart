import 'package:get/get.dart';
import 'package:school/app/modules/teacher/pages/marker_screens/marcker_screen/marker_binding.dart';
import 'package:school/app/modules/teacher/pages/marker_screens/marcker_screen/marker_screen.dart';
import 'package:school/app/modules/teacher/route/routs.dart';

class TeacherMarkerPage extends GetPage {
  TeacherMarkerPage()
      : super(
          name: TeacherAppRoutes.MARKERS,
          page: () => TeacherMarkerScreen(),
          binding: TeacherMarkerBinding(),
        );
}
