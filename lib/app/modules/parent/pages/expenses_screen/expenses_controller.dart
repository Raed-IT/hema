import 'package:get/get.dart';
import 'package:helper_plugin/helper.dart';
import 'package:school/app/global/data/models/balance.dart';
import 'package:school/app/global/data/models/student_model.dart';
import 'package:school/app/modules/parent/data/routes_api.dart';

class ParentExpensesController extends GetxController
    with PaginationMixin<BalanceModel> {
  StudentModel studentModel = Get.arguments['student'];

  @override
  void onInit() {
    super.onInit();
    url = ParentApiRouts.BALANCES;
    paginationParameter = "student_id=${studentModel.id}";
    getPaginationData(isRefresh: true);
  }

  @override
  List<BalanceModel> getModelFromPaginationJsonUsing(Map<String, dynamic> json) {
    print(json["data"]);
    List<BalanceModel> balances = [];
    for (var item in json['data']['balances']) {
      balances.add(BalanceModel.fromJson(item));
    }

    return balances;
  }
}
