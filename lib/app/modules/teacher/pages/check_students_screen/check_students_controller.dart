import 'package:async_button/async_button.dart';
import 'package:get/get.dart';
import 'package:helper_plugin/mixings/api/api_mixin.dart';
import 'package:helper_plugin/utilitis/url_model.dart';
import 'package:intl/intl.dart';
import 'package:school/app/global/data/models/department_model.dart';
import 'package:school/app/global/data/models/student_model.dart';
import 'package:school/app/modules/teacher/data/models/attend_model.dart';
import '../../../../global/data/models/local_models/attends_model.dart';
import '../../data/routes_api.dart';

class CheckStudentsController extends GetxController with ApiHelperMixin {
  AsyncBtnStatesController btnStateController = AsyncBtnStatesController();

  //attended from server
  RxList<AttendsModel> attends = RxList<AttendsModel>([]);

  //attended from mobile <Teacher > for upload to server
  RxList<AttendStateModel> attendsDaly = RxList<AttendStateModel>([]);

  RxList<StudentModel> students = RxList([]);

  DepartmentModel department = Get.arguments['department'];
  String shiftTime =
      DateFormat('a').format(DateTime.now()) == "AM" ? "am" : 'pm';

  @override
  void onInit() {
    urlsGetRequest = [
      UrlModel(
          url: TeacherApiRouts.ATTENDS,
          parameter: "department_id=${department.id}&duration=$shiftTime",
          type: "students")
    ];
    getData();
    super.onInit();
  }

  @override
  void onError(String type) {
    if (type == "postGetConnect") {
      btnStateController.update(AsyncBtnState.failure);
    }
  }

  Future<void> addAttends() async {
    btnStateController.update(AsyncBtnState.loading);
    //add all attend from server  to attendsDaly
    for (var att in attends) {
      int index = attendsDaly
          .indexWhere((element) => element.studentId == att.studentId!);
      if (index == -1) {
        attendsDaly.add(
          AttendStateModel(studentId: att.studentId!, type: att.type),
        );
      }
    }

    //add all student to attendsDaly if not updated them
    for (var student in students) {
      int index =
          attendsDaly.indexWhere((element) => element.studentId == student.id!);
      if (index == -1) {
        attendsDaly
            .add(AttendStateModel(studentId: student.id!, type: "presence"));
      }
    }

    //add all attendsDaly to map data
    String dataString = '';
    for (var element in attendsDaly) {
      dataString += "[${element.studentId}: ${element.type}],";
    }
    int repIndex = dataString.lastIndexOf(',');
    dataString = dataString.replaceRange(repIndex, repIndex + 1, "");
    //add map to get connect form
    FormData data = FormData({});
    data.fields.add(MapEntry("students", dataString));
    await postGetConnect(url: TeacherApiRouts.ATTENDS, data: data);
  }

  void getDataWithDuration() {
    btnStateController = AsyncBtnStatesController();
    attendsDaly.value = [];
    urlsGetRequest[0].parameter =
        "department_id=${department.id}&duration=$shiftTime";

    getData();
  }

  @override
  void getModelFromJsonUsing(json, String urlType) {
    if (urlType == "students") {
      students.clear();
      for (var item in json['data']['students']) {
        students.add(StudentModel.fromJson(item));
      }
      attends.clear();
      for (var item in json['data']['attends']) {
        attends.add(AttendsModel.fromJson(item));
      }
      update();
    } else if (urlType == "postGetConnect") {
      btnStateController.update(AsyncBtnState.success);
      Future.delayed(Duration(seconds: 1), () => Get.back());
    }
  }

  void addMainAttendToMainDalyList(AttendStateModel att) {
    var index =
        attendsDaly.indexWhere((element) => element.studentId == att.studentId);
    //item exist in attendsDaly list
    if (index != -1) {
      attendsDaly[index] = att;
    } else {
      attendsDaly.add(att);
    }
  }

  void removerAttendFromMainDalyList(AttendStateModel att) {
    int index =
        attendsDaly.indexWhere((element) => element.studentId == att.studentId);
    if (index != -1) {
      attendsDaly[index].type = 'present';
    }
  }
}
