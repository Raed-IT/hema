import 'package:get/get.dart';
import 'package:school/app/modules/teacher/pages/add_post_screen/add_post_binding.dart';
import 'package:school/app/modules/teacher/pages/add_post_screen/add_post_screen.dart';
import 'package:school/app/modules/teacher/route/routs.dart';

class AddPostTeacherPage extends GetPage {
  AddPostTeacherPage()
      : super(
          page: () => AddPostTeacherScreen(),
          name: TeacherAppRoutes.ADD_POST_SCREEN,
          binding: AddPostTeacherBinding(),
        );
}
