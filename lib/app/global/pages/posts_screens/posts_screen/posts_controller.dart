import 'package:get/get.dart';
import 'package:helper_plugin/mixings/api/pagination_mixing.dart';
import 'package:school/app/global/data/models/department_model.dart';

import '../../../data/models/post_model.dart';
import '../../../data/routes_api.dart';

class PostsController extends GetxController with PaginationMixin<PostModel> {
  DepartmentModel? department = Get.arguments["department"];

  @override
  void onInit() {
    super.onInit();
    if (department != null) {
      paginationParameter = "department_id=${department?.id}";
    }
    url = GlobalApiRouts.POSTS;
    getPaginationData(
     isRefresh: true,
    );
  }

  @override
  List<PostModel> getModelFromPaginationJsonUsing(Map<String, dynamic> json) {
    List<PostModel> posts = [];
     for (var item in json['data']['posts']) {
      posts.add(PostModel.fromJson(item));
    }
    return posts;
  }
}
