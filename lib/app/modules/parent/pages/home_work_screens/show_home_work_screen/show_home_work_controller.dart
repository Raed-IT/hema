import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:helper_plugin/helper.dart';
import 'package:helper_plugin/utilitis/url_model.dart';
import 'package:school/app/global/local_notification.dart';
import 'package:school/app/modules/parent/data/routes_api.dart';
import '../../../../../global/data/models/home_work_completed_model.dart';
import '../../../../../global/data/models/home_work_model.dart';
import '../../../../../global/data/models/student_model.dart';
import 'package:dio/dio.dart' as dio;

class ParentShowHomeWorkController extends GetxController
    with ImagePickerMixin, ApiHelperMixin {
  final ScrollController scrollController = ScrollController();
  TextEditingController answerController = TextEditingController();
  RxBool isShowButton = RxBool(false);
  Rxn<AnswerHomeWorkModel> homeWorkCompleted = Rxn(null);
  HomeWorkModel homeWork = Get.arguments['home_work'];
  StudentModel student = Get.arguments['student'];

  @override
  void onInit() {
    super.onInit();
     urlsGetRequest = [
      UrlModel(
          url: ParentApiRouts.ANSWER_HOME_WORK,
          type: "answer",
          parameter: "homework_id=${homeWork.id}&student_id=${student.id}"),
    ];
    getData( );
    EasyLoading.show();
  }

  @override
  void onError(String type) {
    EasyLoading.dismiss();
    if (homeWorkCompleted.value == null) {
      isShowButton.value = true;
    }
  }

  Future<void> addHomeWorkCompleted() async {
    if (answerController.text.isNotEmpty || !isEmptyImages) {
      dio.FormData data = dio.FormData.fromMap({
        "homework_id": homeWork.id.toString(),
        "student_id": student.id.toString(),
        "answer": answerController.text,
      });
      data.files.addAll(await getImages());
      EasyLoading.show();
      await postDataDio(
        url: ParentApiRouts.ANSWER_HOME_WORK,
        data: data,
        onSendProgress: (int count) {
          LocalNotification.showProgressNotification(
              channelName: "upload home work",
              progress: count,
              title: "رفع وظيفة ",
              desc: " $count");
        },
      );
      EasyLoading.dismiss();
    } else {
      Fluttertoast.showToast(
          msg: "الرجاء كتابة الاجابة او رفع صورة",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          fontSize: 16.0.sp);
    }
  }

  @override
  void getDataFromPostDioUsing(json) {
    if ("${json['status']}" == "success") {
      answerController.clear();
      restImages();
      Get.back();
      isShowButton.value = false;
      getData();
    }
  }

  @override
  void getModelFromJsonUsing(dynamic json, String urlType) {
    EasyLoading.dismiss();
    homeWorkCompleted.value =
        AnswerHomeWorkModel.fromJson(json['data']["home_work"]);
  }
}
