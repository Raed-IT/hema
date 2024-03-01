// ignore_for_file: unnecessary_overrides

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school/app/global/data/controllers/main_controller.dart';
import 'package:school/app/global/route/routs.dart';

class IsLoginMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    if (Get.find<MainController>().currentToken.value == null) {
      return const RouteSettings(name: GlobalAppRoutes.LOGIN_SCREEN);
    }
    return null;
  }
}
