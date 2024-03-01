import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:school/app/global/data/controllers/local_storage_controller.dart';
import 'package:school/app/global/data/controllers/main_controller.dart';
import 'package:school/app/global/route/routs.dart';
import 'package:school/app/global_components/show_snackBar.dart';

mixin CheckResponseMixin {
  Response checkResponse({required Response response}) {
    try {
      if (response.body == null) {
        showSnackBar(message: "connection_error".tr, success: false);
      }
      if (response.isOk) {
        if (response.body['status'] == "success") {
          return response;
        } else {
          showSnackBar(message: response.body['msg'], success: false);
          return Response(
              request: response.request,
              statusText: response.statusText,
              statusCode: 201,
              body: response.body,
              bodyBytes: response.bodyBytes,
              bodyString: response.bodyString,
              headers: response.headers);
        }
      } else {
        // theirs error
        if (response.status.connectionError) {
          showSnackBar(message: "connection_error".tr, success: false);
          return response;
        } else if (response.status.isForbidden) {
          showSnackBar(message: "is_forbidden".tr, success: false);
          exitApp();
          return response;
        } else if (response.status.isNotFound) {
          showSnackBar(message: "is_not_found".tr, success: false);
          return response;
        } else if (response.status.isServerError) {
          showSnackBar(message: "is_server_error".tr, success: false);
          return response;
        } else if (response.status.isUnauthorized) {
          showSnackBar(message: "is_unauthorized".tr, success: false);
          exitApp();
          return response;
        } else {
          showSnackBar(
              message: "${"un_know_error".tr}CODE : ${response.statusCode}",
              success: false);
          return response;
        }
      }
    } catch (e) {
      showSnackBar(message: "$e".tr, success: false);
      return response;
    }
  }

  void exitApp() {
    Get.find<MainController>().currentToken.value = null;
    Get.find<MainController>().currentUser.value = null;
    StorageController.removeKey(key: "token");
    StorageController.removeKey(key: "user");
    Get.toNamed(GlobalAppRoutes.LOGIN_SCREEN);
  }

}

