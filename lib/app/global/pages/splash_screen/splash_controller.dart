
import 'package:get/get.dart';
import 'package:helper_plugin/helper.dart';
import 'package:helper_plugin/utilitis/url_model.dart';
import 'package:school/app/global/data/controllers/local_storage_controller.dart';
import 'package:school/app/global/data/controllers/main_controller.dart';
import 'package:school/app/global/data/models/UserModel.dart';
import 'package:school/app/global/data/models/setting_model.dart';
import 'package:school/app/global/data/routes_api.dart';

import '../../data/database/users_crud_database.dart';

class SplashScreenController extends GetxController with ApiHelperMixin {
  final userDatabase = UserDatabase();

  // navigation action in main controller in gotoLoginInScreen function ....

  @override
  void onInit() {
    super.onInit();
    urlsGetRequest = [UrlModel(url: GlobalApiRouts.SETTINGS, type: "setting")];

    init();
  }

  void init() async {
    // ch.eck auth before get data
    // userDatabase.clearUsers();
    checkAuth();
    await await userDatabase.getAllUsers();
    Get.find<MainController>().gotoLoginInScreen();
  }

  void checkAuth() async {
    String? token = await StorageController.getData(key: "token");
    var user = await StorageController.getData(key: "user");
    if (token != null) {
      Get.find<MainController>().currentToken(token);
      Get.find<MainController>().currentUser(UserModel.fromJson(user));
    }
    if (Get.find<MainController>().currentToken.value != null) {
      Get.find<MainController>().isGetSetting = true;
      await getData();
      Get.find<MainController>().isGetSetting = false;
    }
  }

  @override
  void getModelFromJsonUsing(json, String urlType) {
    if (urlType == "setting") {
      if (json['data']['setting'] != null) {
        Get.find<MainController>().setting.value =
            SettingModel.fromJson(json['data']['setting']);
      } else {
        Get.find<MainController>().setting.value =
            SettingModel(allowAttendTeacher: false);
      }
    }
  }
}
