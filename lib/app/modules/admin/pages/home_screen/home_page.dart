import 'package:get/get.dart';
 import 'package:school/app/modules/admin/pages/home_screen/home_binding.dart';
import 'package:school/app/modules/admin/pages/home_screen/home_screen.dart';

import '../../route/routs.dart';

class AdminHomePage extends GetPage
{
  AdminHomePage():super(
    name: AdminAppRoutes.HOME_SCREEN,
    page:()=> AdminHomeScreen(),
    binding: AdminHomeBinding(),

  );
}