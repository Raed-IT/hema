import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:helper_plugin/helper.dart';
import 'package:helper_plugin/utilitis/media_model.dart';
import 'package:school/app/global/data/models/department_model.dart';
import 'package:school/app/global/data/models/exam_model.dart';
import 'package:school/app/global/data/models/section_model.dart';
import 'package:school/app/global/data/routes_api.dart';
import 'package:school/app/mixins/supject_mixin.dart';
import 'package:dio/dio.dart' as dio;
import 'package:school/app/modules/teacher/data/routes_api.dart';

class TeacherUpdateExamController extends GetxController
    with SubjectMixin, ImagePickerMixin, ApiHelperMixin {
  ExamModel exam = Get.arguments['exam'];
  SectionModel section = Get.arguments['section'];
  DepartmentModel department = Get.arguments['department'];
  final formKey = GlobalKey<FormState>();
  ScrollController scrollController = ScrollController();
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();
  RxBool validateDateDatePiker = RxBool(false);
  RxnString selectedTime = RxnString(null);
  RxBool validateDateSubjectPiker = RxBool(false);

  //set the deleting image befor delete for remove image from array exam images
  MediaModel? deletingImage;

  Future<void> updateQuizzes() async {
    EasyLoading.show(dismissOnTap: false);
    dio.FormData data = dio.FormData.fromMap({
      "title": titleController.text,
      "info": descController.text,
      "section_id": section.id,
      "department_id": department.id,
      "subject_id": selectedSubject.value?.id,
      "start_date": selectedTime.value,
      "_method": "PUT"
    });
    if (!isEmptyImages) {
      data.files.addAll(await getImages());
    }
    await postDataDio(url: "${TeacherApiRouts.EXAM}/${exam.id}", data: data);
    EasyLoading.dismiss();
  }

  @override
  void getDataFromPostDioUsing(json) {
    Fluttertoast.showToast(msg: "تم تعديل الإمتحان");
    Get.back(result: true);
  }

  @override
  void onInit() {
    titleController.text = exam.title ?? '';
    descController.text = exam.info ?? '';
    selectedTime.value = exam.startDate;
    getSubjects(departmentId: department.id!).then((value) =>
        //set default subject to homework
        selectedSubject.value =
            subjects.firstWhereOrNull((sup) => sup.id == exam.subject!.id));
    super.onInit();
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
      exam.images.remove(deletingImage);
      Get.back();
    }
    super.onDeleteSuccess();
  }
}
