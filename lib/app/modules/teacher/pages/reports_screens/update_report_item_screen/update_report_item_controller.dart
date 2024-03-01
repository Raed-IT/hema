import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:helper_plugin/helper.dart';
import 'package:helper_plugin/utilitis/url_model.dart';
import 'package:school/app/global/data/models/department_model.dart';
import 'package:school/app/global/data/models/report_item_model.dart';
import 'package:school/app/global/data/routes_api.dart';
import 'package:school/app/mixins/supject_mixin.dart';
import 'package:school/app/modules/teacher/data/routes_api.dart';

import '../../../../../global/data/models/report_model.dart';
import '../../../../../global/data/models/student_model.dart';

class TeacherUpdateReportItemController extends GetxController
    with SubjectMixin, ApiHelperMixin {
  ScrollController scrollController = ScrollController();
  RxList<StudentModel> students = RxList([]);
  DepartmentModel department = Get.arguments['current_department'];
  ReportItemModel reportItem = Get.arguments['report_item'];

  TextEditingController ratioController = TextEditingController();
  TextEditingController infoController = TextEditingController();
  Rxn<StudentModel> selectedStudent = Rxn();
  Rxn<String> selectedReportState = Rxn();
  GlobalKey<FormState> formState = GlobalKey();

  @override
  void onInit() {
    getSubjects(departmentId: department.id!);
    urlsGetRequest = [
      UrlModel(
          type: "students",
          url: GlobalApiRouts.STUDENTS,
          parameter: "department_id=${department.id}")
    ];
    getData();
    selectedReportState.value = reportItem.status!.name;
    ratioController.text = reportItem.ratio!;
    infoController.text = reportItem.info!;
    super.onInit();
  }

  @override
  void getModelFromJsonUsing(json, String urlType) {
    if (urlType == "students") {
      students.clear();
      for (var student in json['data']['students']) {
        students.add(StudentModel.fromJson(student));
      }
      selectedStudent.value = students
          .firstWhereOrNull((student) => student.id == reportItem.studentId);
    } else if (urlType == "postGetConnect") {
      Fluttertoast.showToast(msg: "تم تعديل التقييم");
      Get.back(result: true);
    }
  }

  @override
  void onLoadSubject() {
    selectedSubject.value = subjects
        .firstWhereOrNull((subject) => subject.id == reportItem.subject!.id);
  }

  updateReportItem() async {
    if (selectedSubject.value == null ||
        selectedStudent.value == null ||
        selectedReportState.value == null) {
      Fluttertoast.showToast(msg: "الرجاء اختيار جميع العناصر المنسدلة");
      return;
    }
    if (formState.currentState!.validate()) {
      FormData data = FormData({
        "report_id": reportItem.reportId,
        "student_id": selectedStudent.value!.id,
        "status": selectedReportState.value,
        "ratio": ratioController.text,
        "subject_id": selectedSubject.value!.id,
        "_method": "PUT"
      });
      EasyLoading.show();
      await postGetConnect(
          url: "${TeacherApiRouts.REPROT_ITEM}/${reportItem.id}", data: data);
      EasyLoading.dismiss();
    } else {
      Fluttertoast.showToast(msg: "الرجاء ملئ جميع الحقول");
    }
  }
}
