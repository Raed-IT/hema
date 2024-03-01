import 'package:get/get.dart';
 import 'package:school/app/modules/teacher/route/routs.dart';

import 'add_report_item_screen.dart';
import 'add_report_item_binding.dart';

class TeacherAddReportItemPage extends GetPage {
  TeacherAddReportItemPage() :super(
      name: TeacherAppRoutes.ADD_REPORT_ITEM,
    page: ()=>TeacherAddReportItemScreen(),
    binding: TeacherAddReportItemBinding(),
  );
}