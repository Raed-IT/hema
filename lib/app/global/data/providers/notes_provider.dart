import 'package:get/get.dart';
import 'package:helper_plugin/utilitis/base_get_connect.dart';

class NotesProvider extends BaseGetConnect {
  Future<Response> getNotes({required String url, required int id}) async {
    print ("url==> $url");
    return get(
      "$url?student_id=$id",
    );
  }
}
