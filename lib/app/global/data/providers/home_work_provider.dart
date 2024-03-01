 import 'package:get/get.dart';
import 'package:helper_plugin/utilitis/base_get_connect.dart';

class HomeWorkProvider extends BaseGetConnect {
  Future<Response> getHomeWorks({required String url, required int id}) async {
    return get("$url?student_id=$id");
  }

  Future<Response> getHomeWorkCompleted(
      {required String url,
      required int workId,
      required int studentId}) async {
    return get(
      "$url?homework_id=$workId&student_id=$studentId",
    );
  }


}
