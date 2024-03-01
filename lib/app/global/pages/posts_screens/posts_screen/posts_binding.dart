import 'package:get/get.dart';

import 'posts_controller.dart';

class PostsBinding extends Bindings {
  @override
  void dependencies() {
    // Get.lazyPut(() => ArticlesProvider());
    Get.put(PostsController());
  }
}
