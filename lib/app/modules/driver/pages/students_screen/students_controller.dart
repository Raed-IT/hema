import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school/app/global/data/providers/students_provider.dart';

import '../../../../global/data/models/student_model.dart';
import '../../../../global_components/show_snackBar.dart';
import '../../data/mina_driver_controller.dart';
import '../../data/routes_api.dart';

class DriverStudentsScreenController extends GetxController {
  RxList<StudentModel> students = RxList<StudentModel>([]);

  final StudentsProvider _studentsProvider = StudentsProvider();
  TextEditingController searchController = TextEditingController();
  RxString atDate = RxString("now");

  RxBool isLoadStudents = RxBool(true);

//  control by opacity for in appBar   image
  ScrollController scrollController = ScrollController();
  RxDouble opacity = RxDouble(1);

  void _listingScrollController() {
    opacity.value = 1 - (scrollController.offset / 140);
    if (opacity.value > 1) {
      opacity(1);
    }
    if (opacity.value < 0) {
      opacity(0);
    }
  }

  @override
  void onInit() {
    scrollController.addListener(_listingScrollController);
    atDate.listen((p0) {
      getStudents();
    });
    getStudents();
  }

  Future<void> getStudents() async {
    try {
      isLoadStudents(true);
      Response res = await _studentsProvider.getStudents(
        time: Get.find<DriverMainController>().time.value,
        url: DriverApiRouts.STUDENT,
        date: atDate.value,
      );
      isLoadStudents(false);
      if (res.statusText != "normal_error" && res.body != null) {
        students.clear();
        for (var item in res.body['data']['students']) {
          students.add(StudentModel.fromJson(item));
        }
      }
    } catch (e) {
      isLoadStudents(false);
      showSnackBar(message: "$e", success: false);
    }
  }
}
