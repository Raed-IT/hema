import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:helper_plugin/mixings/api/api_mixin.dart';
import 'package:helper_plugin/utilitis/url_model.dart';
import 'package:school/app/global/data/models/report_item_model.dart';
import 'package:school/app/global/data/models/student_model.dart';
import 'package:school/app/modules/parent/data/routes_api.dart';
import '../../../../global/data/models/subject_model.dart';
import '../../../../mixins/supject_mixin.dart';

class StatisticController extends GetxController
    with SubjectMixin, ApiHelperMixin {
  StudentModel student = Get.arguments['student'];
  ScrollController scrollController = ScrollController();
   RxBool isLoadData = RxBool(false);
  RxList<ReportItemModel> data = RxList([]);



  @override
  onchangeSubject(subject){
    print ("=====${subject.name}");
  }


  set subject(SubjectModel subject) {
    selectedSubject(subject);
    urlsGetRequest = [
      UrlModel(
          url: ParentApiRouts.STATISTICS,
          parameter:
              "student_id=${student.id!}&subject_id=${selectedSubject.value?.id}")
    ];
    EasyLoading.show();
    getData();
  }

  @override
  void onInit() {
    super.onInit();
    urlsGetRequest = [
      UrlModel(
          url: ParentApiRouts.STATISTICS,
          parameter: "student_id=${student.id!}")
    ];
    Fluttertoast.showToast(
        msg: "الرجاء اختيار مادة",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        fontSize: 16.0.sp);
    getSubjects(departmentId: student.department!.id!);
  }

  @override
  void onError(String type) {
    EasyLoading.dismiss();
    super.onError(type);
  }

  @override
  void getModelFromJsonUsing(json, String urlType) {
    data.clear();
    for (var item in json['data']['items']) {
      data.add(ReportItemModel.fromJson(item));
    }
    EasyLoading.dismiss();
  }
}
