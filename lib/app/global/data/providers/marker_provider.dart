
import 'package:get/get.dart';
import 'package:helper_plugin/utilitis/base_get_connect.dart';

class MarkersProvider extends BaseGetConnect {
  Future<Response> getMarkers(
      {required String
      url,
      required int subjectId,
      required int studentId
      }) async {
    return get(
      "$url?subject_id=$subjectId&student_id=$studentId ",
    );
  }
}
