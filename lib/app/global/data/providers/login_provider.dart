import 'dart:io';

import 'package:get/get.dart';
import 'package:helper_plugin/utilitis/base_get_connect.dart';
import 'package:school/app/global/data/controllers/main_controller.dart';
 import 'package:school/app/global/data/routes_api.dart';

class LoginProvider extends BaseGetConnect {
  Future<Response> login(Map<String, String> data) async {
    return await post(GlobalApiRouts.LOGIN, data);
  }

  Future<Response> confirmPass({required String pass}) {
    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.authorizationHeader:
          "Bearer ${Get.find<MainController>().currentToken.value}"
    };
    return post(GlobalApiRouts.PASS, {"password": pass}, headers: headers);
  }
}
