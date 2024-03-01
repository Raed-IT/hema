import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helper_plugin/helper.dart';
import 'package:helper_plugin/utilitis/url_model.dart';
import 'package:school/app/global/data/constants.dart';

import '../../../global_components/show_snackBar.dart';
import '../../data/controllers/main_controller.dart';
import '../../data/models/setting_model.dart';
import '../../data/providers/setting_provider.dart';
import '../../data/routes_api.dart';

class AboutSchoolController extends GetxController with ApiHelperMixin {
  ScrollController scrollController = ScrollController();
  Rxn<SettingModel> setting = Get.find<MainController>().setting;
  late ImageProvider logo;
  late String schoolName;

  @override
  void onInit() {
    initData();
    if (setting.value == null) {
      urlsGetRequest = [
        UrlModel(url: GlobalApiRouts.SETTINGS, type: "setting")
      ];
      getData();
    }
    super.onInit();
  }

  void initData() {
    //logo
    if (setting.value != null) {
      SettingModel settingModel = setting.value!;
      if (settingModel.logo != null) {
        logo = NetworkImage("${settingModel.logo}");
      } else {
        logo = const AssetImage("assets/custom/logo-school.png");
      }
      //school name
      if (settingModel.name != null) {
        schoolName = settingModel.name!;
      } else {
        schoolName = Constants.SCHOOL_NAME;
      }
    }
  }

  @override
  void getModelFromJsonUsing(json, String urlType) {
    if (urlType == "setting") {
      Get.find<MainController>().setting.value =
          SettingModel.fromJson(json['data']['setting']);
    }
  }
}
