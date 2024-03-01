import 'package:get/get.dart';
import 'package:school/app/modules/parent/pages/statistic_screen/statistic_binding.dart';
import 'package:school/app/modules/parent/pages/statistic_screen/statistic_screen.dart';
import 'package:school/app/modules/parent/route/routs.dart';

class StatisticPage extends GetPage {
  StatisticPage()
      : super(
            name: ParentAppRoutes.STATISTIC,
            page: () => StatisticScreen(),
            binding: StatisticBinding(),
            transitionDuration: Duration(milliseconds: 700));
}
