import 'package:get/get.dart';

import '../../../../global/data/providers/marker_provider.dart';
import '../../../../global/data/providers/subject_provider.dart';
import 'marks_controller.dart';
class ParentMarkersBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SubjectProvider());
    Get.lazyPut(() => MarkersProvider());
    Get.put(ParentMarkersController());
  }
}