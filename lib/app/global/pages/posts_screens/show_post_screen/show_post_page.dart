import 'package:get/get.dart';
import 'package:school/app/global/pages/posts_screens/show_post_screen/show_post_binding.dart';
import 'package:school/app/global/pages/posts_screens/show_post_screen/show_post_screen.dart';
import 'package:school/app/global/route/routs.dart';

class ShowPostPage extends GetPage {
  ShowPostPage()
      : super(
          name: GlobalAppRoutes.SHOW_POSTE_SCREEN,
          page: () => ShowPostScreen(),
          binding: ShowPostBinding(),
        );
}
