import 'package:get/get.dart';
import 'package:school/app/global/data/middlewares/is_login.dart';
import 'package:school/app/modules/parent/pages/home_screen/home_screen.dart';
import 'package:school/app/modules/parent/route/routs.dart';

import 'home_binding.dart';

class ParentHomePage extends GetPage {
  ParentHomePage()
      : super(
          page: () => ParentHomeScreen(),
          name: ParentAppRoutes.HOME_SCREEN,
          binding: ParentHomeBinding(),
          middlewares: [IsLoginMiddleware()],
        );
}
