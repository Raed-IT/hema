import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:helper_plugin/helper.dart';
import 'package:helper_plugin/utilitis/constats.dart';
import 'package:school/app/global/data/controllers/local_storage_controller.dart';
import 'package:school/app/global/data/models/UserModel.dart';
import 'dart:developer' as developer;

import '../../route/routs.dart';
import '../database/users_crud_database.dart';
import '../models/setting_model.dart';

class MainController extends GetxController with ApiHelperMixin {
  final userDatabase = UserDatabase();

  RxnString currentToken = RxnString();
  Rxn<UserModel> currentUser = Rxn();
  bool isGetSetting = false;

  Rxn<SettingModel> setting = Rxn();
  RxList<UserModel> localUsers = RxList([]);

  @override
  void onInit() async {

    ConstantHelperMadaFlutter.isLogOut.listen((p0) {
      if (p0) {
        userDatabase.clearUsers();
        localUsers.value = [];
        logout();
        ConstantHelperMadaFlutter.isLogOut.value = false;
      }
    });
    currentUser.listen((p0) {
      if (p0 != null) {
        userDatabase.addUser(p0);
      }
    });

    currentToken.listen((value) {
      ConstantHelperMadaFlutter.token = currentToken.value;
    });

    super.onInit();
  }

  void gotoLoginInScreen({bool isSplash = true}) {
    if (isSplash) {
      Future.delayed(
        const Duration(seconds: 3),
        () {
          Get.offAllNamed(GlobalAppRoutes.LOGIN_SCREEN);
        },
      );
    } else {
      Get.offAllNamed(GlobalAppRoutes.LOGIN_SCREEN);
      EasyLoading.dismiss();
    }
  }

  void switchUser(
      {required UserModel user, required bool isLoginScreen}) async {
    print("user.token==>>>>>>> ${user.token}");
    if (user.email == currentUser.value?.email && !isLoginScreen) {
      Fluttertoast.showToast(msg: "انت بالفعل موجود بالحساب");
    } else {
      EasyLoading.show();
      await Future.delayed(Duration(seconds: 1), () async {
        await StorageController.setData(key: "user", value: user.toJson());
        await StorageController.setData(key: 'token', value: user.token);
        currentUser.value = user;
        currentToken.value = user.token;
        gotoLoginInScreen(isSplash: false);
      });
    }
  }

  void logout() async {
    await StorageController.removeKey(key: 'token');
    await StorageController.removeKey(key: 'user');
    Get.find<MainController>().currentUser.value = null;
    Get.find<MainController>().currentToken.value = null;
    Get.find<MainController>().gotoLoginInScreen(isSplash: false);
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
