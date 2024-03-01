import 'package:get/get.dart';

import '../../data/providers/notification_provider.dart';
import 'notification_controller.dart';

class NotificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NotificationProvider());
    Get.put(NotificationController());
  }
}
