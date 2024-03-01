import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:helper_plugin/mixings/api/api_mixin.dart';
import 'package:helper_plugin/utilitis/url_model.dart';
import 'package:school/app/global/data/models/student_model.dart';
import 'package:school/app/global/data/providers/teacher_provider.dart';
import 'package:school/app/global_components/show_snackBar.dart';
import '../../../../../global/data/models/teacher_model.dart';
import '../../../data/routes_api.dart';

class ParentTeacherController extends GetxController with ApiHelperMixin {
  late ScrollController scrollController = ScrollController();

  StudentModel student = Get.arguments['student'];
  TextEditingController searchController = TextEditingController();
  RxList<TeacherModel> teachers = RxList([]);

  @override
  void onInit() {
    urlsGetRequest = [
      UrlModel(
          url: ParentApiRouts.TEACHER, parameter: "student_id=${student.id}")
    ];
    getData( );
    super.onInit();
  }

  @override
  void getModelFromJsonUsing(json, String urlType) {
    teachers.clear();
    for (var item in json['data']['teachers']) {
      teachers.add(TeacherModel.fromJson(item));
    }
  }
}
