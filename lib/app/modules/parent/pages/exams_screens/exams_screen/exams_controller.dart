import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:helper_plugin/helper.dart';
import 'package:helper_plugin/utilitis/url_model.dart';
import 'package:school/app/global/data/models/exam_model.dart';
import 'package:school/app/global/data/models/student_model.dart';
import 'package:school/app/modules/parent/data/routes_api.dart';
import 'package:we_slide/we_slide.dart';

class ParentExamsController extends GetxController with ApiHelperMixin {
  RxList<ExamModel> exams = RxList<ExamModel>([]);
  StudentModel student = Get.arguments['student'];
  WeSlideController weSlideController = WeSlideController();
  Rxn<ExamModel> exam = Rxn();
  ValueNotifier<double> notifier = ValueNotifier(100);

  @override
  void onInit() {
    super.onInit();
    weSlideController.addListener(() {
      weSlideController.value?notifier.value=100:notifier.value=0;
    });
    urlsGetRequest = [
      UrlModel(
          url: ParentApiRouts.EXAMS,
          type: "exams",
          parameter: "student_id=${student.id}"),
    ];
    getData();
  }

  @override
  void getModelFromJsonUsing(var json, String urlType) {
    if (urlType == "exams") {
      for (var item in json['data']['exams']) {
        exams.add(ExamModel.fromJson(item));
      }
    }
  }
}
