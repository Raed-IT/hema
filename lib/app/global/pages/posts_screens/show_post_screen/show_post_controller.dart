import 'package:get/get.dart';
import 'package:school/app/global/data/models/post_model.dart';

class ShowPostController extends GetxController {
  PostModel post = Get.arguments['post'];

  @override
  void onReady() {

    super.onReady();
  }
}
