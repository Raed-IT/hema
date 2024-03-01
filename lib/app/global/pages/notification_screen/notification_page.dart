import 'package:get/get.dart';

import '../../route/routs.dart';
import 'notification_binding.dart';
import 'notification_screen.dart';

class NotificationPage extends GetPage {
  NotificationPage()
      : super(
            name: GlobalAppRoutes.NOTIFICATION_SCREEN,
            page: () => NotificationScreen(),
            binding: NotificationBinding(),
            transitionDuration: Duration(milliseconds: 700));
}
