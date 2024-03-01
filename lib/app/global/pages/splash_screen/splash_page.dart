
import 'package:get/get.dart';
import 'package:school/app/global/data/bindings/main_binging.dart';
import 'package:school/app/global/pages/splash_screen/splash_screen.dart';
import 'package:school/app/global/route/routs.dart';


class SplashPage  extends GetPage{
  SplashPage():super(
      name: GlobalAppRoutes.SPLASH_SCREEN,
      page: () => SplashScreen(),
      binding: MainBinding(),
      transitionDuration: const Duration(milliseconds: 500));

}