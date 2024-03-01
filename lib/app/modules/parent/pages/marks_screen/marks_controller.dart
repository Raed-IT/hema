import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helper_plugin/helper.dart';
import 'package:helper_plugin/utilitis/url_model.dart';
import 'package:school/app/global/data/models/exam_mark_model.dart';
import 'package:school/app/global/data/models/student_model.dart';
import 'package:school/app/mixins/supject_mixin.dart';
import 'package:school/app/modules/parent/data/routes_api.dart';

import '../../../../global/data/providers/marker_provider.dart';
import '../../../../global_components/show_snackBar.dart';

class ParentMarkersController extends GetxController with SubjectMixin {
  ScrollController scrollController = ScrollController();
  RxBool isLoadMarkers = RxBool(false);
  StudentModel student = Get.arguments['student'];
  RxList<ExamMarkerModel> markers = RxList([]);
  RxString avg = RxString('0');

  @override
  void onInit() {
    getSubjects(departmentId: student.department!.id!).then((value) {
      if (subjects.isNotEmpty) {
        selectedSubject.value = subjects[0];
        getMarkers();
      }
    });
    super.onInit();
  }

  @override
  onchangeSubject(subject) {
    getMarkers();
  }

  Future<void> getMarkers() async {
    if (selectedSubject.value == null) {
      return;
    } else {
      isLoadMarkers(true);
      try {
        Response res = await Get.find<MarkersProvider>().getMarkers(
          url: ParentApiRouts.MARKES,
          subjectId: selectedSubject.value!.id!,
          studentId: student.id!,
        );
        isLoadMarkers(false);
        if (res.statusText != "normal_error" && res.body != null) {
          markers.clear();
          for (var item in res.body['data']['marks']) {
            markers.add(ExamMarkerModel.fromJson(item));
          }
          if (markers.isNotEmpty) {
            avg(res.body['data']['avg']);
          } else {
            avg('0');
          }
        }
      } catch (e) {
        isLoadMarkers(false);
        showSnackBar(message: "$e", success: false);
      }
    }
  }
}
