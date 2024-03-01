import 'package:get/get.dart';
import 'package:school/app/global/data/middlewares/is_guest.dart';
import 'package:school/app/global/pages/login_screen/login_binding.dart';
import 'package:school/app/global/route/routs.dart';

import 'login_screen.dart';

class LoginPage extends GetPage {
  LoginPage()
      : super(
            name: GlobalAppRoutes.LOGIN_SCREEN,
            page: () => LoginScreen(),
            binding: LoginBinding(),
            transitionDuration: const Duration(milliseconds: 500),
            middlewares: [IsGuestMiddleware()]);
}
