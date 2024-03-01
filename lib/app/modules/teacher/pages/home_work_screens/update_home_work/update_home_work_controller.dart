import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:helper_plugin/helper.dart';
import 'package:helper_plugin/utilitis/media_model.dart';
import 'package:school/app/global/data/models/department_model.dart';
import 'package:school/app/global/data/models/home_work_model.dart';
import 'package:school/app/global/data/models/section_model.dart';
import 'package:school/app/global/data/routes_api.dart';
import 'package:school/app/mixins/supject_mixin.dart';
import 'package:school/app/modules/teacher/data/routes_api.dart';
import 'package:dio/dio.dart ' as dio;

class UpdateHomeWorkController extends GetxController
    with ApiHelperMixin, SubjectMixin, ImagePickerMixin {
  DepartmentModel department = Get.arguments['department'];
  HomeWorkModel homeWork = Get.arguments['home_work'];
  SectionModel section = Get.arguments['section'];
  final formKey = GlobalKey<FormState>();

  TextEditingController titleController = TextEditingController();
  TextEditingController infoController = TextEditingController();
  final ScrollController scrollController = ScrollController();
  RxBool validateDateDatePiker = RxBool(false);
  RxBool validateDateSubjectPiker = RxBool(false);

  RxnString selectedTime = RxnString(null);
  RxBool isUpdate = RxBool(false);
  MediaModel? deletingImage;

  @override
  void onInit() {
    getSubjects(departmentId: department.id!).then((value) =>
        //set default subject to homework
        selectedSubject.value =
            subjects.firstWhereOrNull((sup) => sup.id == homeWork.subject!.id));

    titleController.text = homeWork.title ?? '';
    infoController.text = homeWork.info ?? '';
    selectedTime.value = homeWork.endDate;
    super.onInit();
  }

  Future<void> updateHomeWork() async {
    dio.FormData data = dio.FormData.fromMap({
      "title": titleController.text,
      "info": infoController.text,
      "subject_id": selectedSubject.value!.id!,
      "department_id": department.id,
      "section_id": section.id,
      "end_date": selectedTime.value,
      "_method": "PUT",
    });
    EasyLoading.show();
    data.files.addAll(await getImages());
    await postDataDio(
        url: "${TeacherApiRouts.HOME_WORK}/${homeWork.id}", data: data);
    EasyLoading.dismiss();
  }

  Future deleteImage(MediaModel image) async {
    EasyLoading.show();
    deletingImage = image;
    await deleteGetConnect(url: GlobalApiRouts.MEDIA, id: image.id!);
    EasyLoading.dismiss();
  }

  @override
  void onDeleteSuccess() {
    if (deletingImage != null) {
      homeWork.images.remove(deletingImage);
      Get.back();
    }
    super.onDeleteSuccess();
  }

  @override
  void getDataFromPostDioUsing(json) {
    Fluttertoast.showToast(msg: "تم تعديل الوظفية ");
    Get.back(result: true);
  }
}
