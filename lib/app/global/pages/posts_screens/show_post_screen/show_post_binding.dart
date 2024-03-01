import 'package:get/get.dart';
import 'package:school/app/global/pages/posts_screens/show_post_screen/show_post_controller.dart';

class ShowPostBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ShowPostController());
  }
}
