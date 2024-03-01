 import 'package:get/get.dart';

import '../../../../../global/data/models/teacher_model.dart';

class ParentProfileTeacherController extends GetxController{
  TeacherModel teacher = Get.arguments['teacher'];
@override
  void onInit() {
  print (teacher.bio);
  super.onInit();
  }
}