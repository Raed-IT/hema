import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:helper_plugin/helper.dart';
import 'package:helper_plugin/utilitis/url_model.dart';
import 'package:school/app/global/data/models/student_model.dart';
import 'package:school/app/modules/parent/data/routes_api.dart';

import '../../../../../global/data/models/absence_model.dart';

class ParentShowPresentController extends GetxController with ApiHelperMixin {
  List<AbsenceModel> absents = RxList([]);
  String label = Get.arguments['label'];
  String type = Get.arguments['type'];
  ScrollController scrollController = ScrollController();
  StudentModel student = Get.arguments['student'];

  @override
  void onInit() {
    urlsGetRequest = [
      UrlModel(
          url: ParentApiRouts.ATTENDENCE,
          parameter: "student_id=${student.id}&type=$type"),
    ];
    getData();
    super.onInit();
  }

  @override
  void getModelFromJsonUsing(json, String urlType) {
    absents.clear();
    for (var item in json['data']['attends']) {
      absents.add(AbsenceModel.fromJson(item));
    }
  }
}
