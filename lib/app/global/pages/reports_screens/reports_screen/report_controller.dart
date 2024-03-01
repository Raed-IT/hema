import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:helper_plugin/helper.dart';
import 'package:helper_plugin/utilitis/url_model.dart';
import 'package:school/app/global/data/models/department_model.dart';
import 'package:school/app/global/data/models/report_model.dart';
import 'package:school/app/global/data/models/student_model.dart';
import 'package:school/app/global/data/routes_api.dart';

class ReportController extends GetxController with ApiHelperMixin {
  ScrollController scrollController = ScrollController();
  dynamic arguments = Get.arguments;
  DepartmentModel department = Get.arguments['department'];
  StudentModel? student;
  List<ReportModel> reports = [];

  @override
  void onInit() {
    if (arguments != null) {
      print("arguments.keys  report controller ==>>>> ${arguments.keys}");
      if (arguments.containsKey('student')) {
        student = arguments['student'];
      }
    }
    urlsGetRequest = [
      UrlModel(
          url: GlobalApiRouts.REPROTS,
          parameter: "department_id=${department.id}")
    ];
    getData();
    super.onInit();
  }

  @override
  void getModelFromJsonUsing(json, String urlType) {
    reports.clear();
    for (var report in json['data']["reports"]) {
      reports.add(ReportModel.fromJson(report));
    }
  }
}
