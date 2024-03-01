import 'package:get/get.dart';
import 'package:school/app/global/pages/weekly_program_screen/weekly_program_binding.dart';
import 'package:school/app/global/route/routs.dart';

import 'weekly_program_screen.dart';

class WeeklyProgramPage extends GetPage {
  WeeklyProgramPage()
      : super(
            name: GlobalAppRoutes.WEEKLY_PROGRAM,
            page: () => WeeklyProgramScreen(),
            binding: WeeklyProgramBinding(),
            transitionDuration: const Duration(milliseconds: 700));
}
