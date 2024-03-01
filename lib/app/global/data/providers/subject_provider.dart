
import 'package:get/get.dart';
import 'package:helper_plugin/utilitis/base_get_connect.dart';

class SubjectProvider extends BaseGetConnect {
  Future<Response> getSubjects(
      {required String url, required int departmentId}) async {
    return get(
      "$url?department_id=$departmentId",
    );
  }
}
