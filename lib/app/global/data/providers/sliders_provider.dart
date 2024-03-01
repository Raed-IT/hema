import 'dart:io';

import 'package:get/get.dart';
import 'package:helper_plugin/utilitis/base_get_connect.dart';
import 'package:school/app/global/data/controllers/main_controller.dart';
 import 'package:school/app/modules/parent/data/routes_api.dart';

class SliderProvider extends BaseGetConnect {
  final MainController _mainController = Get.find();

  Future<Response> getSliders() {
    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.authorizationHeader: "Bearer ${_mainController.currentToken}"
    };
    return get(ParentApiRouts.SLIDERS, headers: headers);
  }
}
