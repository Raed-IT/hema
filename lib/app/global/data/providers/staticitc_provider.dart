
import 'package:get/get.dart';
import 'package:school/app/modules/parent/data/routes_api.dart';

class StatisticsProvider extends GetConnect {
  Future<Response> getStatistics({required int id}) async {
    return get(
      "${ParentApiRouts.STATISTICS}?student_id=$id",
    );
  }
}
