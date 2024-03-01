import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:helper_plugin/helper.dart';
import 'package:school/app/global/data/models/section_model.dart';
import 'package:school/app/global/local_notification.dart';
import 'package:school/app/mixins/supject_mixin.dart';
import 'package:school/app/modules/teacher/data/routes_api.dart';
import '../../../../../global/data/models/department_model.dart';
import 'package:dio/dio.dart' as dio;

class TeacherAddHomeWorkController extends GetxController
    with SubjectMixin, ApiHelperMixin, ImagePickerMixin {
  SectionModel section = Get.arguments['section'];
  DepartmentModel department = Get.arguments['department'];
  ScrollController scrollController = ScrollController();
  final formKey = GlobalKey<FormState>();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController infoController = TextEditingController();
  RxBool validateDateDatePiker = RxBool(false);
  RxnString selectedTime = RxnString(null);

  @override
  void onInit() {
    getSubjects(departmentId: department.id!);
    super.onInit();
  }

  @override
  void onError(String type) {
    EasyLoading.showError("فشل");
    LocalNotification.showProgressNotification(
        progress: 0,
        title: "رفع وظيفة",
        channelName: titleController.text,
        desc: "فشل ");
  }

  void addHomeWork() async {
    if (formKey.currentState!.validate()) {
      if (selectedSubject.value == null) {
        Fluttertoast.showToast(msg: "الرجاء اختيار مادة ");
        return;
      }
      EasyLoading.show();
      dio.FormData data = dio.FormData.fromMap({
        "title": titleController.text,
        "info": infoController.text,
        "subject_id": selectedSubject.value!.id!,
        "department_id": department.id,
        "section_id": section.id,
        "end_date": selectedTime.value,
      });
      if (!isEmptyImages) {
        data.files.addAll(await getImages());
      }
      await postDataDio(
          url: TeacherApiRouts.HOME_WORK,
          data: data,
          onSendProgress: (d) {
            LocalNotification.showProgressNotification(
                progress: d,
                title: "رفع وظيفة",
                channelName: titleController.text,
                desc: "جاري رفع الوظيفة ${d}%");
          });
    } else {
      Fluttertoast.showToast(
        msg: "الرجاء ملئ جميع الحقول ",
      );
    }
  }

  @override
  void getDataFromPostDioUsing(dynamic json) {
    EasyLoading.showSuccess("تم اضافة الوظيفة");
    LocalNotification.showProgressNotification(
        progress: 100,
        title: "رفع وظيفة",
        channelName: titleController.text,
        desc: "تم رفع الوظيفة 100%");
    Future.delayed(
        const Duration(milliseconds: 500), () => Get.back(result: true));
  }
}
