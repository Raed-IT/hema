import 'package:get/get.dart';
import 'package:school/app/global/pages/reports_screens/reports_screen/report_binding.dart';
import 'package:school/app/global/pages/reports_screens/reports_screen/report_screen.dart';
import 'package:school/app/global/route/routs.dart';

class ReportPage extends GetPage{
  ReportPage():super(
    name: GlobalAppRoutes.REPORTS,
    page: ()=>ReportScreen(),
    binding: ReportBinding(),
  );
}