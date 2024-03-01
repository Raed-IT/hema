import 'package:get/get.dart';
import 'package:helper_plugin/helper.dart';
import 'package:school/app/global/data/models/home_work_completed_model.dart';
import 'package:school/app/global/data/models/home_work_model.dart';
import 'package:school/app/modules/teacher/data/routes_api.dart';

class TeacherShowWorksCompletedController extends GetxController
    with PaginationMixin<AnswerHomeWorkModel> {
  HomeWorkModel homeWorkModel = Get.arguments['home_work'];

  @override
  void onInit() {
    url = "${TeacherApiRouts.HOME_WORK}/${homeWorkModel.id}";
    getPaginationData(isRefresh: true);
    super.onInit();
  }

  @override
  List<AnswerHomeWorkModel> getModelFromPaginationJsonUsing(
      Map<String, dynamic> json) {
    List<AnswerHomeWorkModel> homeWorks = [];
    for (var homeWork in json['data']["answers"]) {
      homeWorks.add(AnswerHomeWorkModel.fromJson(homeWork));
    }

    return homeWorks;
  }
}
