import 'package:flutter/widgets.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:helper_plugin/helper.dart';
import 'package:helper_plugin/utilitis/error_type_enum.dart';
import 'package:school/app/modules/parent/data/routes_api.dart';
import 'package:school/app/modules/teacher/data/routes_api.dart';
import '../../../../global/data/models/slider_model.dart';
import '../../../../global/data/models/student_model.dart';

class ParentHomeController extends GetxController
    with PaginationMixin<StudentModel>, ApiHelperMixin {
  RxList<SliderModel> sliders = RxList([]);

  @override
  String? getNextUrlForPaginationUsing(Map<String, dynamic> data) {
    return data['data']['pagination']['next_page_url'];
  }

  @override
  void onInit() {
    url = ParentApiRouts.STUDENTS;
    super.onInit();
    getPaginationData(
      isRefresh: true,
    );
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

  @override
  void getModelFromJsonUsing(json, String urlType) {
    if (ErrorApiTypeEnum.postGetConnect.name == urlType) {
      EasyLoading.dismiss();
      Get.back();
      Fluttertoast.showToast(msg: "تم الطلب ");
    }
  }

  @override
  void onError(String type) {
    if (ErrorApiTypeEnum.postGetConnect.name == type) {
      EasyLoading.showError("");
    }
  }

  void addAbsent({required String selectedDate, required int studentId}) async {
    EasyLoading.show();
    await postGetConnect(
      url: ParentApiRouts.ATTENDENCE,
      data: FormData({
        "atDate": selectedDate,
        "student_id": studentId,
      }),
    );
  }
}
