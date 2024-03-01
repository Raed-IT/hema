import 'package:get/get.dart';
import 'package:school/app/modules/parent/route/routs.dart';

import 'marks_binding.dart';
import 'marks_screen.dart';



class ParentMarkersPage extends GetPage {
  ParentMarkersPage()
      : super(
    page: () => ParentMarkersScreen(),
    name: ParentAppRoutes.MARKERS_SCREN,
    binding: ParentMarkersBinding(),
    transitionDuration: const Duration(milliseconds: 700),
  );
}