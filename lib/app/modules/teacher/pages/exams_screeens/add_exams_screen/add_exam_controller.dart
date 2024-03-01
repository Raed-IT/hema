import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:helper_plugin/helper.dart';
import 'package:school/app/global/data/models/department_model.dart';
import 'package:school/app/global/data/models/section_model.dart';
import 'package:school/app/mixins/supject_mixin.dart';
import 'package:dio/dio.dart' as dio;
import 'package:school/app/modules/teacher/data/routes_api.dart';

class TeacherAddExamController extends GetxController
    with SubjectMixin, ImagePickerMixin, ApiHelperMixin {
  final formKey = GlobalKey<FormState>();
  DepartmentModel department = Get.arguments['department'];
  SectionModel section = Get.arguments['section'];
  ScrollController scrollController = ScrollController();
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();
  RxBool validateDateDatePiker = RxBool(false);
  RxnString selectedTime = RxnString(null);
  RxBool validateDateSubjectPiker = RxBool(false);

  @override
  void onReady() {
    getSubjects(departmentId: department.id!);
    super.onReady();
  }

  Future<void> addExam() async {
    if (selectedSubject.value == null) {
      Fluttertoast.showToast(msg: "الرجاء اختيار المادة ");
      return;
    }
    if (formKey.currentState!.validate()) {
      EasyLoading.show();
      dio.FormData data = dio.FormData.fromMap({
        "title": titleController.text,
        "info": descController.text,
        "section_id": section.id,
        "department_id": department.id,
        "subject_id": selectedSubject.value?.id,
        "start_date": selectedTime.value,
      });
      if (!isEmptyImages) {
        data.files.addAll(await getImages());
      }

      await postDataDio(url: TeacherApiRouts.EXAM, data: data);
      EasyLoading.dismiss();
    }
  }

  @override
  void onError(String type) {
    EasyLoading.showError("فشل");
  }

  @override
  void getDataFromPostDioUsing(json) {
    Fluttertoast.showToast(msg: "تم إضافة الإمتحان");
    Get.back(result: true);
  }
}
