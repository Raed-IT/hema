 import 'package:get/get.dart';
import 'package:helper_plugin/utilitis/base_get_connect.dart';
import 'package:school/app/global/data/controllers/main_controller.dart';

class TeacherProvider extends BaseGetConnect {
  final MainController mainController = Get.find();

  Future<Response> getTeachers({required String url, required int id}) async {

    return get("$url?student_id=$id",);
  }
}
