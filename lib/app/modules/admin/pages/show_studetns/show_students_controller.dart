import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:helper_plugin/helper.dart';
import 'package:helper_plugin/utilitis/error_type_enum.dart';
import 'package:helper_plugin/utilitis/url_model.dart';
import 'package:school/app/global/data/models/UserModel.dart';
import 'package:school/app/modules/admin/data/routers_api.dart';

import '../../../../global/data/models/student_model.dart';

class AdminShowStudentsController extends GetxController with ApiHelperMixin {
  String qr = Get.arguments['qr'];
  RxList<StudentModel> students = RxList([]);
  Rxn<UserModel> user = Rxn();
  ScrollController scrollController = ScrollController();
  RxDouble total = RxDouble(0.0);

  @override
  void onInit() {
    urlsGetRequest = [
      UrlModel(
          url: AdminApiRouts.STUDENTS, type: "students", parameter: "qr=$qr")
    ];
    getData();
    super.onInit();
  }

  @override
  void getModelFromJsonUsing(json, String urlType) {
    if (urlType == "students") {
      user.value = UserModel.fromJson(json['data']['user']);
      for (var student in json['data']['students']) {
        students.add(StudentModel.fromJson(student));
      }
    } else if (urlType == ErrorApiTypeEnum.postGetConnect.name) {
      Fluttertoast.showToast(msg: "تم إضافة الدفعة");
      Future.delayed(Duration(milliseconds: 300), () => Get.back());
    }
  }

  void save() async {
    if (total.value > 0) {
      FormData formData = FormData({});
      for (int i = 0; i < students.length; i++) {
        if (students[i].amount != null) {
          formData.fields
              .add(MapEntry("students[$i][student_id]", "${students[i].id}"));
          formData.fields
              .add(MapEntry("students[$i][amount]", "${students[i].amount}"));
        }
      }
      formData.fields.add(MapEntry("total", "${total.value}"));

      EasyLoading.show();
      await postGetConnect(
        url: AdminApiRouts.PAYMENT,
        data: formData,
      );
      EasyLoading.dismiss();
    } else {
      Fluttertoast.showToast(msg: "الرجاء ملىء طالب على الأقل ");
    }
  }

  void calculateTotal() {
    double amount = 0;
    for (StudentModel student in students) {
      if (student.amount != null) {
        amount += student.amount!;
      }
    }
    total.value = amount;
  }
}
