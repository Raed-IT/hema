import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helper_plugin/helper.dart';
import 'package:helper_plugin/utilitis/url_model.dart';
import 'package:school/app/global/data/controllers/main_controller.dart';
import 'package:school/app/global/data/models/department_model.dart';
import 'package:school/app/global/data/models/section_model.dart';
import 'package:school/app/modules/teacher/data/routes_api.dart';

class TeacherHomeController extends GetxController with ApiHelperMixin {
  final listKey = GlobalKey<AnimatedListState>();
  RxList<SectionModel> sections = RxList([]);
  RxList<DepartmentModel> departments = RxList([]);
  RxInt selectedSection = 0.obs;

  set selectedSectionSetter(int index) {
    selectedSection.value = index;
    departments(sections[index].departments);
    update();
  }

  ScrollController scrollController = ScrollController();
  late ImageProvider avatarUser;

  @override
  void onInit() {
    super.onInit();
    urlsGetRequest = [UrlModel(url: TeacherApiRouts.SECTIONS,type: "sections")];
    if (Get.find<MainController>().currentUser.value?.img != null) {
      avatarUser = NetworkImage(Get.find<MainController>().currentUser.value!.img!);
    } else {
      avatarUser = const AssetImage("assets/images/avatar.png");
    }
    getData();
  }

  @override
  void getModelFromJsonUsing(json, String urlType) {

    if (urlType == "sections") {
      sections.clear();
      for (var item in json['data']['sections']) {
        sections.add(SectionModel.fromJson(item));
      }
      if (sections.isNotEmpty){
        selectedSectionSetter=0;
      }
    }
  }
}
