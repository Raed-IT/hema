import 'package:get/get.dart';
import 'package:school/app/modules/teacher/pages/reports_screens/update_report_item_screen/update_report_item_binding.dart';
import 'package:school/app/modules/teacher/pages/reports_screens/update_report_item_screen/update_report_item_screen.dart';
import 'package:school/app/modules/teacher/route/routs.dart';

class TeacherUpdateReportItemPage extends GetPage {
  TeacherUpdateReportItemPage() :super(
      name: TeacherAppRoutes.UPDATE_REPORT_ITEM,
      page: () => TeacherUpdateReportItemScreen(),
      binding: TeacherUpdateReportItemBinding()
  );
}