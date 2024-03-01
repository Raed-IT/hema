import 'package:get/get.dart';
import 'package:helper_plugin/utilitis/base_get_connect.dart';

class StudentsProvider extends BaseGetConnect {
  Future<Response> getStudents(
      {required String url, String? time, required String date}) async {
    Response res = await get("$url?time=$time&at_date=$date");
    return res;
  }
}
