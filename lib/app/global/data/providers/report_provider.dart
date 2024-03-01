import 'package:get/get.dart';
import 'package:helper_plugin/utilitis/base_get_connect.dart';
 import 'package:school/app/modules/parent/data/routes_api.dart';

class ReportProvider extends BaseGetConnect {
  Future<Response> getReports({
    required int studentId,
    /*int? subjectId, required String
          date*/
  }) async {
    /*return get(
      "${ParentApiRouts.REPORTS}?student_id=$studentId&date=$date${(subjectId == null ? '' : '&subject_id=$subjectId')}",
    ); */
    return get(
      "${ParentApiRouts.REPORTS}?student_id=$studentId",
    );
  }
}
