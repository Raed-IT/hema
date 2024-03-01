import 'package:get/get.dart';
import 'package:helper_plugin/mixings/api/pagination_mixing.dart';

import '../../data/models/notification_model.dart';
import '../../data/routes_api.dart';

class NotificationController extends GetxController
    with PaginationMixin<NotificationModel> {
  RxInt notificationUnReadCount = RxInt(0);

  @override
  void onInit() {
    super.onInit();
    url = GlobalApiRouts.NOTIFICATION;
    getPaginationData(
      isRefresh: true,
    );
  }

  @override
  List<NotificationModel> getModelFromPaginationJsonUsing(Map<String, dynamic> json) {
    List<NotificationModel> notifications = [];
    for (var item in json['data']['notifications']) {
      notifications.add(NotificationModel.fromJson(item));
    }
    notificationUnReadCount.value = json["data"]['un_read_notifications_count'];
    return notifications;
  }
}
