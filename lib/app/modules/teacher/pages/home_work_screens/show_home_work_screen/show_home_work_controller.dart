import 'package:flutter/material.dart';
 import 'package:get/get.dart';

import '../../../../../global/data/models/home_work_model.dart';

class TeacherShowHomeWorkController extends GetxController {
   final ScrollController scrollController = ScrollController();
  HomeWorkModel workHome = Get.arguments['home_work'];

}
