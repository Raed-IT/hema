import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:helper_plugin/helper.dart';
import 'package:helper_plugin/utilitis/url_model.dart';
import 'package:school/app/global/data/models/exam_model.dart';
import 'package:school/app/modules/teacher/data/routes_api.dart';

class TeacherMarkStudentController extends GetxController with ApiHelperMixin {
  ExamModel exam = Get.arguments['exam'];
ScrollController scrollController=ScrollController();
  @override
  void onInit() {
    urlsGetRequest = [
      UrlModel(url: "${TeacherApiRouts.EXAM}/${exam.id}"),
    ];
    getData();
    super.onInit();
  }
}
