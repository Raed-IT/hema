import 'package:get/get.dart';
import 'package:school/app/modules/parent/pages/present_tabel_screens/show_table_present/show_present_controller.dart';

import '../../../../../global/data/providers/absents_provider.dart';

class ParentShowPresentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AbsentsProvider());
    Get.put(ParentShowPresentController());
  }
}
