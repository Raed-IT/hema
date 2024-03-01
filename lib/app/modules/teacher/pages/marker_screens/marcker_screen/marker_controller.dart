import 'package:async_button/async_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:helper_plugin/helper.dart';
import 'package:helper_plugin/utilitis/error_type_enum.dart';
import 'package:helper_plugin/utilitis/url_model.dart';
import 'package:intl/intl.dart';
import 'package:school/app/global/data/models/department_model.dart';
import 'package:school/app/global/data/models/exam_model.dart';
import 'package:school/app/global/data/models/student_model.dart';
import 'package:school/app/modules/teacher/data/routes_api.dart';
import '../../../../../global/data/models/local_models/add_marks_model.dart';
import '../../../../../global/data/models/mark_model.dart';

class TeacherMarkerController extends GetxController with ApiHelperMixin {
  GlobalKey<FormState> formKye = GlobalKey();
  DepartmentModel department = Get.arguments['department'];
  ScrollController scrollController = ScrollController();
  RxList<ExamModel> exams = RxList([]);
  RxList<StudentModel> students = RxList([]);
  RxList<MarkModel> actualMarks = RxList([]);
  RxList<AddMarkModel> localActualMarks = RxList([]);
  String shiftTime =
      DateFormat('a').format(DateTime.now()) == "AM" ? "am" : 'pm';
  Rxn<ExamModel> selectedExam = Rxn();
  RxBool isLoadExams = RxBool(false);
  late AsyncBtnStatesController btnStateController;

  @override
  void onInit() {
    btnStateController = AsyncBtnStatesController();
    selectedExam.listen((p0) {
      getStudentWithData();
    });
    urlsGetRequest = [
      UrlModel(
          url: TeacherApiRouts.EXAM,
          parameter: "department_id=${department.id}",
          type: "exams")
    ];
    isLoadExams.value = true;
    getData();
    super.onInit();
  }

  @override
  void getModelFromJsonUsing(dynamic json, String urlType) {
    if (urlType == ErrorApiTypeEnum.postGetConnect.name) {
      btnStateController.update(AsyncBtnState.success);
      Future.delayed(const Duration(seconds: 2), () {
        Get.back();
      });
    }
    if (urlType == "exams") {
      exams.clear();
      for (var exam in json["data"]["exams"]) {
        exams.add(ExamModel.fromJson(exam));
      }
      isLoadExams.value = false;
    }
    if (urlType == "students") {
      actualMarks.clear();
      for (var acMark in json['data']['marks']) {
        actualMarks.add(MarkModel.fromJson(acMark));
      }
      students.clear();
      for (var student in json['data']['students']) {
        MarkModel? studentMark =
            actualMarks.firstWhereOrNull((m) => m.studentId == student['id']);
        StudentModel studentModel = StudentModel.fromJson(student);
        if (studentMark != null) {
          studentModel.currentMark = studentMark.mark;
          studentModel.markStatusString = studentMark.status;
        }
        students.add(studentModel);
      }
    }
  }

  getStudentWithData() {
    btnStateController = AsyncBtnStatesController();
    actualMarks.value = [];
    if (selectedExam.value != null) {
      urlsGetRequest = [
        UrlModel(
            url: TeacherApiRouts.MARKS,
            parameter:
                "exam_id=${selectedExam.value?.id}&department_id=${department.id}&duration=$shiftTime",
            type: "students"),
      ];
      getData();
    }
  }

  void removerMarkFromMainActualList(AddMarkModel value) {}

  @override
  void onError(String type) {
    if (type == ErrorApiTypeEnum.postGetConnect.name) {
      btnStateController.update(AsyncBtnState.failure);
    }
  }

  Future<void> addMarks() async {
    //add all attendsDaly to map data
    if (selectedExam.value == null) {
      Fluttertoast.showToast(msg: "الرجاء اختيار الامتحان");
      btnStateController.update(AsyncBtnState.failure);
      return;
    }
    if (formKye.currentState!.validate()) {
      btnStateController.update(AsyncBtnState.loading);
      EasyLoading.show();
      String data = '[';
      for (var student in students) {
        if (student.currentMark != null) {
          data +=
              '{"student_id":${student.id},"mark":${student.currentMark},"status":"${student.markStatus!.getState()}"},';
        } else {
          Fluttertoast.showToast(msg: "الرجاء تعبئة جميع العلامات للطلاب ");
        }
      }
      data += "]";
      int repIndex = data.lastIndexOf(',');
      data = data.replaceRange(repIndex, repIndex + 1, "");
      // print(data);
      FormData formData = FormData({
        "exam_id": selectedExam.value?.id,
        "marks": data,
      });
      print(formData.fields);
      await postGetConnect(
        url: TeacherApiRouts.MARKS,
        data: formData,
      );
      EasyLoading.dismiss();
    } else {
      btnStateController.update(AsyncBtnState.failure);
      Fluttertoast.showToast(msg: "الرجاء تعبئة جميع العلامات للطلاب ");
    }
  }
}
