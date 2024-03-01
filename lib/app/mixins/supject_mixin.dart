import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:school/app/global/data/models/subject_model.dart';
import 'package:school/app/global/data/providers/subject_provider.dart';
import 'package:school/app/global/data/routes_api.dart';
import 'package:school/app/global_components/show_snackBar.dart';

import '../global_components/subject_componete/subject_component.dart';

mixin SubjectMixin {
  final RxBool _isLoadSubject = RxBool(false);
  final RxList<SubjectModel> _subjects = RxList<SubjectModel>([]);

  Rxn<SubjectModel> selectedSubject = Rxn();

  RxBool get isLoadSubject => _isLoadSubject;

  void onLoadSubject() {}

  void onchangeSubject(SubjectModel subject) {}

  bool isRequiredSubject = true;

  RxList<SubjectModel> get subjects => _subjects;

  Future<void> getSubjects({required int departmentId}) async {
    if (!Get.isRegistered<SubjectProvider>()) {
      Get.lazyPut(() => SubjectProvider());
    }
    _isLoadSubject.value = true;
    try {
      Response res = await Get.find<SubjectProvider>().getSubjects(
          url: GlobalApiRouts.SUBJECTS, departmentId: departmentId);

      _isLoadSubject.value = false;
      if (res.statusText != "normal_error" && res.body != null) {

        _subjects.clear();
        for (var item in res.body['data']['subjects']) {
          _subjects.add(SubjectModel.fromJson(item));
        }
        onLoadSubject();
      }
    } catch (e) {
      _isLoadSubject.value = false;
      showSnackBar(message: "$e", success: false);
    }
  }

  Widget buildDropDownSubject() {
    return SubjectComponent(
      subjects: subjects,
      selectedSubject: selectedSubject,
      isLoadSubject: _isLoadSubject,
      onTap: (SubjectModel subject) {
        selectedSubject.value = subject;
        onchangeSubject(subject);
      },
    );
  }
}
