import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school/app/global/data/models/section_model.dart';

import '../../../../global/data/models/department_model.dart';

class TeacherDepartmentController extends GetxController {
  ScrollController scrollController = ScrollController();
  DepartmentModel department = Get.arguments['department'];
  SectionModel section = Get.arguments['section'];
}
