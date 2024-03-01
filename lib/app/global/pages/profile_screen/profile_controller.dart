import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:helper_plugin/helper.dart';
import 'package:school/app/global/data/controllers/local_storage_controller.dart';
import 'package:school/app/global/data/controllers/main_controller.dart';
import 'package:school/app/global/data/models/UserModel.dart';
import 'package:school/app/global/data/routes_api.dart';
import 'package:dio/dio.dart' as dio;

import '../../data/database/users_crud_database.dart';

class ProfileController extends GetxController
    with ImagePickerMixin, ApiHelperMixin {
  ScrollController scrollController = ScrollController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  // TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  final userDatabase = UserDatabase();

  @override
  void onInit() {
    userNameController.text =
        Get.find<MainController>().currentUser.value?.username ?? "";
    // emailController.text =
    //     Get.find<MainController>().currentUser.value?.email ?? "";
    phoneController.text =
        Get.find<MainController>().currentUser.value?.phone ?? "";
    firstNameController.text =
        Get.find<MainController>().currentUser.value?.firstName ?? "";
    lastNameController.text =
        Get.find<MainController>().currentUser.value?.lastName ?? "";
    super.onInit();
  }

  void updateProfile() async {
    dio.FormData data = dio.FormData.fromMap({
      "username": userNameController.text,
      // "email": emailController.text,
      "password": passwordController.text,
      "first_name": firstNameController.text,
      "last_name": lastNameController.text,
      "phone": phoneController.text,
      "_method": "PUT"
    });
    if (image.value != null) {
      data.files.add(await getImage(key: "img"));
    }
    EasyLoading.show();
    await postDataDio(
        url:
            "${GlobalApiRouts.USERS}/${Get.find<MainController>().currentUser.value?.id}",
        data: data);
    EasyLoading.dismiss();
  }

  @override
  void getDataFromPostDioUsing(json) async {
    Get.find<MainController>()
        .currentUser(UserModel.fromJson(json['data']['user']));
    await StorageController.setData(key: "user", value: json['data']['user']);
    EasyLoading.showSuccess("تم تعديل الملف الشخصي");
    Future.delayed(const Duration(milliseconds: 500), () => Get.back());
  }
}
