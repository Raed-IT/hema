import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:helper_plugin/helper.dart';
import 'package:school/app/global/data/models/notes_model.dart';
import 'package:school/app/global/data/models/student_model.dart';
import 'package:school/app/modules/teacher/data/routes_api.dart';

class TeacherNotesController extends GetxController
    with PaginationMixin<NotesModel>, ApiHelperMixin {
  StudentModel student = Get.arguments['student'];

  @override
  void onInit() {
    paginationParameter = "student_id=${student.id}";
    url = TeacherApiRouts.NOTES;
    getPaginationData(isRefresh: true);
    super.onInit();
  }

  Future<void> deleteNote(NotesModel note) async {

    EasyLoading.show();
    await deleteGetConnect(url: TeacherApiRouts.NOTES, id: note.id!);
    EasyLoading.dismiss();
  }
  @override
  void onDeleteSuccess() {
    getPaginationData(isRefresh: true);
    super.onDeleteSuccess();
  }
  @override
  List<NotesModel> getModelFromPaginationJsonUsing(Map<String, dynamic> json) {
    List<NotesModel> nots = [];
    for (var note in json['data']['notes']) {
      nots.add(NotesModel.fromJson(note));
    }
    return nots;
  }
}
