import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:helper_plugin/helper.dart';
import 'package:school/app/global/data/models/department_model.dart';
import 'package:school/app/global/data/models/report_item_model.dart';
import 'package:school/app/global/data/models/report_model.dart';
import 'package:school/app/global/data/models/student_model.dart';
import 'package:school/app/global/data/routes_api.dart';

import '../../../../modules/teacher/data/routes_api.dart';

class ReportsItemsController extends GetxController
    with PaginationMixin<ReportItemModel>, ApiHelperMixin {
  var arguments = Get.arguments;
  StudentModel? student;
  DepartmentModel? department;

  ///[ report ] provid it to call api
  ReportModel? report;


  bool isTeacher = Get.arguments['isTeacher'] ?? false;
  late DepartmentModel cuurentDepartment;

  initVal() {
    //get data from get router
    if (arguments.containsKey('department')) {
      department = arguments['department'];
      cuurentDepartment = department!;
    } else if (arguments.containsKey("student")) {
      student = arguments['student'];
      cuurentDepartment = student!.department!;
    } else if (arguments.containsKey("report")) {
      report = arguments['report'];
      cuurentDepartment = report!.department!;
    }

    //set data to url parameter
    if (report != null && student != null) {
      paginationParameter = "student_id=${student?.id}&report_id=${report?.id}";
    } else if (report != null) {
      paginationParameter = "report_id=${report?.id}";
    } else if (student != null) {
      paginationParameter = "student_id=${student?.id}";
    } else if (department != null) {
      paginationParameter = "department_id=${department?.id}";
    }
  }

  @override
  void onInit() {
    initVal();
    url = GlobalApiRouts.REPROTS_ITEMS;
    getPaginationData(isRefresh: true);

    super.onInit();
  }

  @override
  List<ReportItemModel> getModelFromPaginationJsonUsing(
      Map<String, dynamic> json) {
    List<ReportItemModel> reports = [];
    for (var report in json['data']['reports']) {
      reports.add(ReportItemModel.fromJson(report));
    }
    return reports;
  }

  Future<void> deleteReportItem(ReportItemModel report) async {
    EasyLoading.show();
    await deleteGetConnect(url: TeacherApiRouts.REPROT_ITEM, id: report.id!);
    EasyLoading.dismiss();
  }

  @override
  void onDeleteSuccess() {
    getPaginationData(isRefresh: true);
    super.onDeleteSuccess();
  }
}
