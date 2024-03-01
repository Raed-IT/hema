import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:helper_plugin/helper.dart';
import 'package:school/app/global/data/models/department_model.dart';
import 'package:school/app/global/data/models/section_model.dart';
import 'package:dio/dio.dart' as dio;
import 'package:school/app/global/data/routes_api.dart';
import 'package:school/app/global/local_notification.dart';

class AddPostTeacherController extends GetxController
    with ApiHelperMixin, ImagePickerMixin {
  SectionModel section = Get.arguments['section'];
  DepartmentModel department = Get.arguments['department'];
  ScrollController scrollController = ScrollController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController titleController = TextEditingController();
  TextEditingController infoController = TextEditingController();

  addPost() async {
    if (formKey.currentState!.validate()) {
      EasyLoading.show();
      dio.FormData data = dio.FormData.fromMap({
        "title": titleController.text,
        "body": infoController.text,
        "department_id": department.id,
        "section_id": section.id,
      });
      if (!isEmptyImages) {
        data.files.addAll(await getImages(key: "imgs"));
      }
      await postDataDio(
          url: GlobalApiRouts.POSTS,
          data: data,
          onSendProgress: (d) {
            LocalNotification.showProgressNotification(
                progress: d,
                title: "رفع خبر",
                channelName: titleController.text,
                desc: "جاري رفع خبر ${d}%");
          });
      EasyLoading.dismiss();
    } else {
      Fluttertoast.showToast(
        msg: "الرجاء ملئ جميع الحقول ",
      );
    }
  }

  @override
  void getDataFromPostDioUsing(json) {
    EasyLoading.showSuccess("تم ");
    Get.back();
  }
}
