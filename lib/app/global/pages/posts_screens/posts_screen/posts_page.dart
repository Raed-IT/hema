import 'package:get/get.dart';
import 'package:school/app/global/pages/posts_screens/posts_screen/posts_binding.dart';
import 'package:school/app/global/pages/posts_screens/posts_screen/posts_screen.dart';
 import 'package:school/app/global/route/routs.dart';

class PostsPage extends GetPage {
  PostsPage()
      : super(
          page: () => const PostsScreen(),
          name: GlobalAppRoutes.POSTES_SCREEN,
          binding: PostsBinding(),
          transitionDuration: const Duration(milliseconds: 500),
        );
}
