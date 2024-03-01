import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:helper_plugin/helper.dart';
import 'package:helper_plugin/utilitis/url_model.dart';
import 'package:school/app/modules/parent/data/routes_api.dart';

import '../../../../../global/data/models/student_model.dart';
import '../../../../../global_components/show_snackBar.dart';
import '../../../../../global/data/providers/staticitc_provider.dart';

class ParentMainPresentController extends GetxController with ApiHelperMixin {
  RxDouble lost = RxDouble(0);
  RxDouble success = RxDouble(0); //
  RxDouble present = RxDouble(0); //حاضر
  RxDouble holiday = RxDouble(0); // عطلة
  StudentModel student = Get.arguments['student'];

  ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    urlsGetRequest = [
      UrlModel(
          url: ParentApiRouts.STATISTICS_ATTENDS,
          parameter: "student_id=${student.id}"),
    ];
    getData();
    EasyLoading.show();
    super.onInit();
  }

  @override
  void onError(String type) {
    EasyLoading.dismiss();
  }

  @override
  void getModelFromJsonUsing(var json, String urlType) {
    EasyLoading.dismiss();
    lost(
      double.parse(
        json['data']['attends']["absence"].toString(),
      ),
    );
    success(
      double.parse(
        json['data']['attends']["presence"].toString(),
      ),
    );
    present(
      double.parse(
        json['data']['attends']["justification"].toString(),
      ),
    );
    // holiday(
    //   double.parse(
    //     response.body['attends']["holiday"].toString(),
    //   ),
    // );
  }
}
