import 'package:get/get.dart';
import 'package:school/app/modules/parent/pages/home_work_screens/home_work_screen/home_work_screen.dart';
import 'package:school/app/modules/parent/route/routs.dart';

import 'home_work_binding.dart';

class ParentHomeWorkPage extends GetPage {
  ParentHomeWorkPage()
      : super(
          name: ParentAppRoutes.WORK_HOME,
          page: () => ParentHomeWorkScreen(),
          binding: ParentHomeWorkBinding(),
          transitionDuration: Duration(milliseconds: 700),
        );
}
