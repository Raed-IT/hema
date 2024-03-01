import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:school/app/global/data/models/student_model.dart';
import 'package:school/app/modules/parent/data/routes_api.dart';

import '../../../../../global/data/models/home_work_model.dart';
import '../../../../../global/data/providers/home_work_provider.dart';
import '../../../../../global_components/show_snackBar.dart';

class ParentHomeWorkController extends GetxController {
  RxList<HomeWorkModel> workHomes = RxList([]);
  RxBool isLoad = RxBool(false);
   final ScrollController scrollController = ScrollController();
  final HomeWorkProvider _homeWorkProvider = Get.find<HomeWorkProvider>();

  StudentModel student = Get.arguments['student'];

  @override
  void onReady() {
    super.onReady();
    getHomeWorks();
  }



  Future<void> getHomeWorks() async {
    isLoad(true);
    try {
      Response res = await _homeWorkProvider.getHomeWorks(
          id: student.id!, url: ParentApiRouts.HOME_WORK);
      isLoad(false);
      if (res.statusText != "normal_error" && res.body != null) {
        workHomes.clear();
        for (var item in res.body['data']['home_works']) {
          workHomes.add(HomeWorkModel.fromJson(item));
        }
      }
    } catch (e) {
      isLoad(false);
      showSnackBar(message: "$e", success: false);
    }
  }
}
