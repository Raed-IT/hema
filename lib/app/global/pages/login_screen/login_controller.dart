import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:helper_plugin/helper.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:school/app/global/data/controllers/local_storage_controller.dart';
import 'package:school/app/global/data/controllers/main_controller.dart';
import 'package:school/app/global/data/enums/user_type_enum.dart';
import 'package:school/app/global/data/models/UserModel.dart';
import 'package:school/app/mixins/utility_mixins.dart';
import 'package:school/app/modules/admin/route/routs.dart';
import 'package:school/app/modules/driver/route/routs.dart';
import 'package:school/app/modules/parent/route/routs.dart';
import 'package:school/app/modules/teacher/route/routs.dart';

import '../../data/database/users_crud_database.dart';
import '../../data/routes_api.dart';

class LoginScreenController extends GetxController
    with UtilitiesMixin, ApiHelperMixin {
  final formKey = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  RxBool rememberMe = RxBool(false);
  final userDatabase = UserDatabase();

  Future<void> login() async {
    if (formKey.currentState!.validate()) {
      EasyLoading.show(
        dismissOnTap: false,
      );
      await OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);
      var status = await OneSignal.shared.getDeviceState();
      String? osUserID = status?.userId;
      int count = 0;

      // for get osUserID from onsignal
      while (osUserID == null) {
        status = await OneSignal.shared.getDeviceState();
        osUserID = status?.userId;
        count++;
        if (count == 10) {
          break;
        }
      }
      FormData data = FormData({
        "username": usernameController.text,
        "password": passwordController.text,
        "device_token": osUserID ?? "",
        "device_brand": await getDeviceBrand(),
      });
      await postGetConnect(url: GlobalApiRouts.LOGIN, data: data);
      EasyLoading.dismiss();
    }
  }

  @override
  void getModelFromJsonUsing(json, String urlType) async {
    EasyLoading.showSuccess("success".tr);
    Get.find<MainController>().currentUser(
      UserModel.fromJson(json['user']),
    );
    Get.find<MainController>().currentToken(json['user']['token']);
    userDatabase.getAllUsers();
    // store teacher data to local storage
    await StorageController.setData(key: "user", value: json['user']);
    await StorageController.setData(key: 'token', value: json['user']['token']);
    switch (Get.find<MainController>().currentUser.value!.level!) {
      case UserType.user:
        Get.offAllNamed(ParentAppRoutes.HOME_SCREEN);
        break;
      case UserType.teacher:
        Get.offAllNamed(TeacherAppRoutes.HOME_SCREEN);
        break;
      case UserType.driver:
        Get.offAllNamed(DriverAppRoutes.HOME_SCREEN);
        break;
      case UserType.manager:
      case UserType.admin:
        Get.offAllNamed(AdminAppRoutes.HOME_SCREEN);
        break;
    }
  }
}
