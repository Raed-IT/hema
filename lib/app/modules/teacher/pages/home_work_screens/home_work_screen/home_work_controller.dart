import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:helper_plugin/helper.dart';
import 'package:school/app/global/data/models/department_model.dart';
import 'package:school/app/global/data/models/home_work_model.dart';
import 'package:school/app/global/data/models/section_model.dart';
import 'package:school/app/modules/teacher/data/routes_api.dart';

class TeacherHomeWorkController extends GetxController
    with PaginationMixin<HomeWorkModel>, ApiHelperMixin {
  DepartmentModel department = Get.arguments['department'];
  SectionModel section = Get.arguments['section'];

  @override
  void onInit() {
    paginationParameter = "department_id=${department.id}";
    url = TeacherApiRouts.HOME_WORK;
    getPaginationData(isRefresh: true);
    super.onInit();
  }

  @override
  List<HomeWorkModel> getModelFromPaginationJsonUsing(
      Map<String, dynamic> json) {
    List<HomeWorkModel> homeworks = [];
    for (var homeWork in json['data']['home_works']) {
      homeworks.add(HomeWorkModel.fromJson(homeWork));
    }
    return homeworks;
  }

  Future<void> deleteHomeWork(HomeWorkModel workHome) async {
    EasyLoading.show();
    await deleteGetConnect(url: TeacherApiRouts.HOME_WORK, id: workHome.id!);
    EasyLoading.dismiss();
  }
@override
  void onDeleteSuccess() {
    getPaginationData(isRefresh: true);
    super.onDeleteSuccess();
  }

}
