import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:helper_plugin/helper.dart';
import 'package:school/app/global/data/models/student_model.dart';
import 'package:school/app/modules/teacher/data/routes_api.dart';

import '../../../../../global/data/models/notes_model.dart';
import '../../../../../global/data/models/status_note_model.dart';

class TeacherUpdateNoteController extends GetxController with ApiHelperMixin {
  NotesModel notes = Get.arguments['note'];
  StudentModel student = Get.arguments['student'];
  RxBool validateStatusNote = RxBool(false);
  Rxn<StatusNoteModel> selectedStatusNote = Rxn();
  RxList<StatusNoteModel> status = RxList<StatusNoteModel>([
    StatusNoteModel(labelEn: "Success", labelAr: "ايجابيه", value: "success"),
    StatusNoteModel(labelEn: "Fails", labelAr: "سلبيه", value: "bad"),
  ]);
  final formKey = GlobalKey<FormState>();
  TextEditingController descController = TextEditingController();
  ScrollController scrollController = ScrollController();
  RxBool validateDateSubjectPiker = RxBool(false);

  @override
  void onReady() {
    super.onReady();
    descController.text = notes.note!;
    for (StatusNoteModel status in status) {
      if (status.value == notes.status) {
        selectedStatusNote(status);
      }
    }
  }

  void updateNote() async {
    if (selectedStatusNote.value == null) {
      Fluttertoast.showToast(msg: "الرجاء اختيار نوع الملاحظة");
      return;
    } else if (formKey.currentState!.validate()) {
      EasyLoading.show();
      FormData data = FormData({
        "student_id": student.id,
        "info": descController.text,
        "status": selectedStatusNote.value?.value,
        "_method": "PUT"
      });
      await postGetConnect(
          url: "${TeacherApiRouts.NOTES}/${notes.id}", data: data);
      EasyLoading.dismiss();
    }
  }

  @override
  void getModelFromJsonUsing(json, String urlType) {
    Fluttertoast.showToast(msg: "تم تعديل الملاحظة");
    Get.back(result: true);
  }
}
