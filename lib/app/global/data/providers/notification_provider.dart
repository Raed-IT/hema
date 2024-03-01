
import 'package:get/get.dart';
import 'package:helper_plugin/utilitis/base_get_connect.dart';

class NotificationProvider extends BaseGetConnect {
  Future<Response> getNotifications({required String url}) => get(url);
}
