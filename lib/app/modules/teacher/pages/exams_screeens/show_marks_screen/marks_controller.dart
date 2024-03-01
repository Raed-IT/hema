import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helper_plugin/mixings/api/api_mixin.dart';
import 'package:helper_plugin/utilitis/url_model.dart';
import 'package:school/app/global/data/models/department_model.dart';
import 'package:school/app/global/data/models/exam_model.dart';
import 'package:school/app/global/data/models/mark_model.dart';
import 'package:school/app/modules/teacher/data/routes_api.dart';

class TeacherMarkersController extends GetxController with ApiHelperMixin {
  ScrollController scrollController = ScrollController();
  ExamModel examModel = Get.arguments['exam'];
  DepartmentModel departmentModel = Get.arguments['department'];
  RxList<MarkModel> marks = RxList([]);
  RxList<ExamModel> exams = RxList([]);
  Rxn<ExamModel> selectedExam = Rxn();
  RxBool isLoadExams = RxBool(false);

  @override
  void onInit() {
    urlsGetRequest = [UrlModel(url: "${TeacherApiRouts.EXAM}/${examModel.id}",type: "exams")];
    getData();
    super.onInit();
  }

  @override
  void getModelFromJsonUsing(json, String urlType) {
    if (urlType == "exams") {
      marks.clear();
      for (var mark in json['data']['marks']) {
        marks.add(MarkModel.fromJson(mark));
      }
    }
  }
}
