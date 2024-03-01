import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school/app/global/data/controllers/main_controller.dart';
import 'package:school/app/global/data/enums/user_type_enum.dart';
import 'package:school/app/global/data/models/UserModel.dart';
import 'package:school/app/modules/driver/route/routs.dart';
import 'package:school/app/modules/parent/route/routs.dart';
import 'package:school/app/modules/teacher/route/routs.dart';

import '../../../modules/admin/route/routs.dart';

class IsGuestMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    if (Get.find<MainController>().currentToken.value != null) {
      String? redirectTo;
      UserModel user = Get.find<MainController>().currentUser.value!;
      switch (user.level!) {
        case UserType.user:
          redirectTo = ParentAppRoutes.HOME_SCREEN;
          break;
        case UserType.teacher:
          redirectTo = TeacherAppRoutes.HOME_SCREEN;
          break;
        case UserType.driver:
          redirectTo = DriverAppRoutes.HOME_SCREEN;
          break;
        case UserType.manager:
        case UserType.admin:
          redirectTo = AdminAppRoutes.HOME_SCREEN;
          break;
      }
      return RouteSettings(name: redirectTo);
    }
    return null;
  }
}
