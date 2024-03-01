import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:helper_plugin/helper.dart';
import 'package:helper_plugin/utilitis/url_model.dart';
import 'package:school/app/global/data/models/department_model.dart';
import 'package:school/app/global/data/models/exam_model.dart';
import 'package:school/app/global/data/models/section_model.dart';
import 'package:school/app/modules/teacher/data/routes_api.dart';

class TeacherExamController extends GetxController with ApiHelperMixin {
  TextEditingController titleController = TextEditingController();
  ScrollController scrollController = ScrollController();
  RxList<ExamModel> exams = RxList([]);
  DepartmentModel department = Get.arguments['department'];
  SectionModel section = Get.arguments['section'];

  @override
  void onReady() {
    urlsGetRequest = [
      UrlModel(
          url: TeacherApiRouts.EXAM,
          parameter: "department_id=${department.id}")
    ];
    getData();
    super.onReady();
  }

  Future<void> deleteExam(ExamModel exam) async {
    EasyLoading.show();
    await deleteGetConnect(url: TeacherApiRouts.EXAM, id: exam.id!);
    EasyLoading.dismiss();
  }

  @override
  void onDeleteSuccess() {
    getData();
    super.onDeleteSuccess();
  }

  @override
  void getModelFromJsonUsing(json, String urlType) {
    exams.clear();
    for (var exam in json['data']['exams']) {
      exams.add(ExamModel.fromJson(exam));
    }
  }
}
