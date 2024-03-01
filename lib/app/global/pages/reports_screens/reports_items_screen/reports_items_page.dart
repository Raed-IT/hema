import 'package:get/get.dart';
import 'package:school/app/global/pages/reports_screens/reports_items_screen/reports_items_binding.dart';
import 'package:school/app/global/pages/reports_screens/reports_items_screen/reports_items_screen.dart';
 import 'package:school/app/global/route/routs.dart';

class ReportsItemsPage extends GetPage {
  ReportsItemsPage()
      : super(
            name: GlobalAppRoutes.REPORT_ITEMS,
            page: () => ReportsItemsScreen(),
            binding: ReportsItemsBinding(),
            transitionDuration: const Duration(milliseconds: 500));
}
