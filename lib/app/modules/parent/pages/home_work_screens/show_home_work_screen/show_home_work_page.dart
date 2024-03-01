import 'package:get/get.dart';
import 'package:school/app/modules/parent/pages/home_work_screens/show_home_work_screen/show_home_work_binding.dart';
import 'package:school/app/modules/parent/pages/home_work_screens/show_home_work_screen/show_home_work_screen.dart';
import 'package:school/app/modules/parent/route/routs.dart';

import '../../../../../global/data/middlewares/is_login.dart';
  class ParentShowHomeWorkPage extends GetPage {
  ParentShowHomeWorkPage()
      : super(
          name: ParentAppRoutes.SHOW_WORK_HOME,
          binding: ParentShowHomeWorkBinding(),
          page: () => ParentShowHomeWorkScreen(),
          middlewares: [IsLoginMiddleware()],
          transitionDuration: const Duration(milliseconds: 500),
        );
}
