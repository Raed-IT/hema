import 'package:get/get.dart';
import 'package:school/app/global/data/middlewares/is_login.dart';
import 'package:school/app/modules/driver/pages/home_screen/home_binding.dart';
import 'package:school/app/modules/driver/pages/home_screen/home_screen.dart';
import 'package:school/app/modules/driver/route/routs.dart';

class DriverHomePage extends GetPage {
  DriverHomePage()
      : super(
            name: DriverAppRoutes.HOME_SCREEN,
            page: () => DriverHomeScreen(),
            binding: DrierHomeBinding(),
            middlewares: [IsLoginMiddleware()]);
}
