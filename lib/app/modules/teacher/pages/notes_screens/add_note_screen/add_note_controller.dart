import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:helper_plugin/helper.dart';
import 'package:school/app/global/data/models/student_model.dart';
import 'package:school/app/mixins/supject_mixin.dart';
import 'package:school/app/modules/teacher/data/routes_api.dart';
import '../../../../../global/data/models/status_note_model.dart';

class AddNoteController extends GetxController
    with ApiHelperMixin, SubjectMixin {
  final TextEditingController descController = TextEditingController();
  ScrollController scrollController = ScrollController();

  RxBool validateStatusNote = RxBool(false);
  Rxn<StatusNoteModel> selectedStatusNote = Rxn();
  StudentModel student = Get.arguments['student'];
  final formKey = GlobalKey<FormState>();
  RxList<StatusNoteModel> status = RxList<StatusNoteModel>([
    StatusNoteModel(labelEn: "Success", labelAr: "ايجابيه", value: "success"),
    StatusNoteModel(labelEn: "Fails", labelAr: "سلبيه", value: "bad"),
  ]);

  @override
  void onInit() {
    if (student.department != null) {
      getSubjects(departmentId: student.department!.id!);
    }
    super.onInit();
  }

  Future<void> addNote() async {
    // print(selectedSubject.value);
    // return;
    if (selectedStatusNote.value == null) {
      Fluttertoast.showToast(msg: "الرجاء اختيار نوع الملاحظة");
      return;
    } else if (formKey.currentState!.validate()) {
      EasyLoading.show();
      FormData data = FormData({
        "student_id": student.id,
        if (selectedSubject.value != null)
          "subject_id": selectedSubject.value!.id,
        "info": descController.text,
        "status": selectedStatusNote.value?.value
      });

      await postGetConnect(url: TeacherApiRouts.NOTES, data: data);
      EasyLoading.dismiss();
    }
  }

  @override
  void getModelFromJsonUsing(json, String urlType) {
    Fluttertoast.showToast(msg: "تم الإضافة بنجاح");
    Get.back(result: true);
  }
}
