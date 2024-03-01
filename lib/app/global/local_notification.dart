// import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../them/app_colors.dart';

class LocalNotification {
  // static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  //     FlutterLocalNotificationsPlugin();

  static Future<void> initial() async {
    // const AndroidInitializationSettings initializationSettingsAndroid =
    //     AndroidInitializationSettings('ic_flutternotification');
    //
    // await flutterLocalNotificationsPlugin.initialize(
    //     const InitializationSettings(android: initializationSettingsAndroid));
  }

  static Future<void> showProgressNotification(
      {required int progress,
      required String title,
      required String channelName,
      required String desc}) async {
    // final AndroidNotificationDetails androidNotificationDetails =
    //     AndroidNotificationDetails(channelName, channelName,
    //         channelShowBadge: false,
    //         onlyAlertOnce: true,
    //         showProgress: true,
    //         maxProgress: 100,
    //         color: AppColors.SCAFFOLD_COLOR,
    //         icon: "",
    //         playSound: true,
    //         progress: progress);
    // await flutterLocalNotificationsPlugin.show(
    //   0,
    //   title,
    //   desc,
    //   NotificationDetails(android: androidNotificationDetails),
    // );
  }
}
