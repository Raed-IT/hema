import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:helper_plugin/helper.dart';
import 'package:helper_plugin/utilitis/url_model.dart';
import 'package:school/app/modules/admin/data/routers_api.dart';

import '../../data/models/statistics_model.dart';

class AdminHomeController extends GetxController with ApiHelperMixin {
  ScrollController scrollController = ScrollController();
  StatisticsModel? statistics = StatisticsModel(0, 0, 0, 0, 0, 0, 0, 0);

  @override
  void onInit() {
    urlsGetRequest = [UrlModel(url: AdminApiRouts.STATISTICS)];
    getData();
    super.onInit();
  }

  @override
  void getModelFromJsonUsing(json, String urlType) {
    statistics = StatisticsModel.fromJson(json['data']['statistics']);
  }
}
