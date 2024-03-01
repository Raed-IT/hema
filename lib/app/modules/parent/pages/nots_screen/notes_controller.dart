import 'package:get/get.dart';
import 'package:helper_plugin/mixings/api/pagination_mixing.dart';
import 'package:school/app/modules/parent/data/routes_api.dart';

import '../../../../global/data/models/notes_model.dart';
import '../../../../global/data/models/status_note_model.dart';
import '../../../../global/data/models/student_model.dart';

class ParentNotesController extends GetxController
    with PaginationMixin<NotesModel> {
  StudentModel student = Get.arguments['student'];
  RxInt selectedStatus = RxInt(2);
  RxList<StatusNoteModel> status = RxList<StatusNoteModel>([
    StatusNoteModel(
        labelAr: " الملاحظات السلبية ", labelEn: "Fails", value: 'bad'),
    StatusNoteModel(
        labelAr: "الملاحظات الإيجابية  ", labelEn: "success", value: 'success'),
    StatusNoteModel(labelAr: "كل  الملاحظات", labelEn: "All", value: 'all'),
  ]);

  @override
  String? getNextUrlForPaginationUsing(Map<String, dynamic> data) {
    return data['data']['pagination']['next_page_url'];
  }

  @override
  void onInit() {
    paginationParameter = "student_id=${student.id!}&state=${status[2].value}";
    url = ParentApiRouts.NOTES;
    getPaginationData(isRefresh: true);
    super.onInit();
  }

  set selectedStatusSetter(int statusIndex) {
    //set [selectedStatus] fro show to ui selected  item
    selectedStatus.value = statusIndex;
    //set pagination fo load  more
    paginationParameter =
        "student_id=${student.id!}&state=${status[statusIndex].value}";
    getPaginationData(isRefresh: true);
    update();
  }

  @override
  List<NotesModel> getModelFromPaginationJsonUsing(Map<String, dynamic> json) {
    List<NotesModel> notes = [];
    for (var item in json['data']['notes']) {
      notes.add(NotesModel.fromJson(item));
    }
    return notes;
  }
}
