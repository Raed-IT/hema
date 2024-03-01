import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:helper_plugin/helper.dart';
import 'package:helper_plugin/utilitis/url_model.dart';
import 'package:school/app/global/data/models/department_model.dart';
import 'package:school/app/global/data/models/report_model.dart';
import 'package:school/app/global/data/models/report_state_model.dart';
import 'package:school/app/global/data/routes_api.dart';
import 'package:school/app/mixins/supject_mixin.dart';

import '../../../../../global/data/models/student_model.dart';
import '../../../data/routes_api.dart';

class TeacherAddReportItemController extends GetxController
    with SubjectMixin, ApiHelperMixin {
  DepartmentModel department = Get.arguments['department'];

  RxList<StudentModel> students = RxList([]);
  RxList<ReportModel> reports = RxList([]);
  ScrollController scrollController = ScrollController();
  TextEditingController ratioController = TextEditingController();
  TextEditingController infoController = TextEditingController();
  Rxn<StudentModel> selectedStudent = Rxn();
  Rxn<ReportModel> selectedReport = Rxn();
  Rxn<ReportStateModel> selectedReportState = Rxn();
  GlobalKey<FormState> formState = GlobalKey();
  RxBool isLoadReport = RxBool(false);
  RxBool isLoadStudent = RxBool(false);

  @override
  void onInit() {
    getSubjects(departmentId: department.id!);
    urlsGetRequest = [
      UrlModel(
          type: "students",
          url: GlobalApiRouts.STUDENTS,
          parameter: "department_id=${department.id}"),
      UrlModel(
          type: "reports",
          url: GlobalApiRouts.REPROTS,
          parameter: "department_id=${department.id}")
    ];
    isLoadReport.value = true;
    isLoadStudent.value = true;
    getData();
    super.onInit();
  }

  @override
  void getModelFromJsonUsing(json, String urlType) {
    print ("type ============== ${urlType}");
    if (urlType == "students") {
      students.clear();
      for (var student in json['data']['students']) {
        students.add(StudentModel.fromJson(student));
      }
      isLoadStudent.value = true;
    } else if (urlType == "reports") {
      reports.clear();
      for (var report in json["data"]['reports']) {
        reports.add(ReportModel.fromJson(report));
      }

      isLoadReport.value = false;
    } else if (urlType == "postGetConnect") {
      Get.back(result: true);
    }
  }

  void addReportItem() async {
    if (selectedSubject.value == null ||
        selectedStudent.value == null ||
        selectedReportState.value == null) {
      Fluttertoast.showToast(msg: "الرجاء اختيار جميع العناصر المنسدلة");
      return;
    }
    if (formState.currentState!.validate()) {
      FormData data = FormData({
        "report_id": selectedReport.value?.id,
        "student_id": selectedStudent.value!.id,
        "subject_id": selectedSubject.value!.id,
        "status": selectedReportState.value!.name,
        "ratio": ratioController.text,
        "info":infoController.text
      });
      EasyLoading.show();
      await postGetConnect(url: TeacherApiRouts.REPROT_ITEM, data: data);
      EasyLoading.dismiss();
    } else {
      Fluttertoast.showToast(msg: "الرجاء ملئ جميع الحقول بشكل صحيح");
    }
  }
}
