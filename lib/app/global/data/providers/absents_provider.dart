import 'dart:io';

import 'package:get/get.dart';
import 'package:helper_plugin/utilitis/base_get_connect.dart';
import 'package:school/app/global/data/controllers/main_controller.dart';
 import 'package:school/app/modules/parent/data/routes_api.dart';

class AbsentsProvider extends BaseGetConnect {
  Future<Response> getAbsents({required int id, required String url}) async {
    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.authorizationHeader:
          "Bearer ${Get.find<MainController>().currentToken.value}"
    };
    return get("${ParentApiRouts.PRESENTS}/$url?student_id=$id",
        headers: headers);
  }

  Future<Response> requestAbsent({required Map<String, String> data}) async {
    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.authorizationHeader:
          "Bearer ${Get.find<MainController>().currentToken.value}"
    };
    return post(ParentApiRouts.PRESENTS, data, headers: headers);
  }
}
