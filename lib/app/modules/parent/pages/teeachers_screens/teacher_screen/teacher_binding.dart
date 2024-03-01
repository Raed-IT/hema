import 'package:get/get.dart';
import 'package:school/app/modules/parent/pages/teeachers_screens/teacher_screen/teacher_controller.dart';

import '../../../../../global/data/providers/teacher_provider.dart';

class ParentTeacherBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => TeacherProvider());
    Get.put(ParentTeacherController());
  }

}