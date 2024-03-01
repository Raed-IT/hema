import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helper_plugin/utilitis/url_model.dart';

import '../controllers/main_controller.dart';
import '../routes_api.dart';

class MainRouteObserver extends RouteObserver<PageRoute<dynamic>> {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);
    if (route is PageRoute && previousRoute is PageRoute) {
      final controller = Get.find<MainController>();
      if (controller.setting.value == null &&
          !controller.isGetSetting &&
          controller.currentToken.value != null) {
        controller.urlsGetRequest = [
          UrlModel(url: GlobalApiRouts.SETTINGS, type: "setting")
        ];
        controller.getData();
      }
    }
  }
}
