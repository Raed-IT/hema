import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helper_plugin/helper.dart';
import 'package:school/app/global/data/models/department_model.dart';
import '../../../../global/data/models/student_model.dart';
import '../../data/routes_api.dart';

class ShowStudentsController extends GetxController
    with PaginationMixin<StudentModel> {
  RxBool isShowMainWidgetAppBar = RxBool(true);
  DepartmentModel department = Get.arguments['department'];

  @override
  void onInit() {
    paginationParameter = "department_id=${department.id}";
    url = TeacherApiRouts.STUDENTS;
    getPaginationData(isRefresh: true);
    super.onInit();
  }

  @override
  void onReady() {
    scrollController = ScrollController();
    super.onReady();
  }

  @override
  List<StudentModel> getModelFromPaginationJsonUsing(
      Map<String, dynamic> json) {
    List<StudentModel> students = [];
    for (var item in json['data']['students']) {
      students.add(StudentModel.fromJson(item));
    }
    return students;
  }
}
