import 'package:get/get.dart';
import 'package:school/app/modules/parent/route/routs.dart';

import 'main_present_binding.dart';
import 'main_present_screen.dart';

class ParentMainPresentPage extends GetPage {
  ParentMainPresentPage()
      : super(
          name: ParentAppRoutes.PRESENT,
          page: () => ParentMainPresentScreen(),
          binding: ParentMainPresentBinding(),
        );
}
