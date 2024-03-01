import 'package:get/get.dart';
import 'package:school/app/modules/parent/pages/expenses_screen/expenses_controller.dart';

class ParentExpensesBinding extends Bindings{
  @override
  void dependencies() {
    // Get.lazyPut(() => BalanceProvider());
    Get.put(ParentExpensesController());
  }

}