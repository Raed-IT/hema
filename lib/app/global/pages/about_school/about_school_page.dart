import 'package:get/get.dart';
import 'package:school/app/global/pages/about_school/about_school_binding.dart';
import 'package:school/app/global/route/routs.dart';

import 'about_school_screen.dart';

class AboutSchoolPage extends GetPage {
  AboutSchoolPage()
      : super(
          name: GlobalAppRoutes.ABOUT_SCHOOL_SCREEN,
          page: () => AboutSchoolScreen(),
          binding: AboutSchoolBinding(),
        );
}
