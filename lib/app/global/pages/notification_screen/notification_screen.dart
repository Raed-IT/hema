import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:school/app/them/app_colors.dart';
import '../../../global_components/appbar_components/main_appbar.dart';
 import '../../../global_components/lists_components/animation_sliver_list_component.dart';
import '../../../global_components/lists_components/no_data_component.dart';
import '../../data/models/notification_model.dart';
import 'components/list_progress_notification.dart';
import 'notification_controller.dart';

class NotificationScreen extends GetView<NotificationController> {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return controller.buildScreen(
      appBar: MainAnimatedAppBarComponent(
        herTag: "notification-tag",
        openDrawer: (conte) => Scaffold.of(conte).openDrawer(),
        scrollController: controller.scrollController!,
        svgUrl: "assets/svg/Natiufecations.svg",
        supWidgets: [
          Text(
            "الإشعارات",
            style: TextStyle(
                color: AppColors.ORANG_APP_COLOR,
                fontWeight: FontWeight.bold,
                fontSize: 25.sp),
          ),
          Obx(
            () => Text(
              "لديك  ${controller.notificationUnReadCount.value}  اشعار جديد ",
              style:
                  TextStyle(color: AppColors.SCAFFOLD_COLOR, fontSize: 15.sp),
            ),
          )
        ],
      ),
      widgets: [
        Obx(
          () => (controller.isLoadPagination.value)
              ? ListProgressNotification()
              : (controller.paginationData.isNotEmpty)
                  ? AnimationSliverList(
                      length: controller.paginationData.length,
                      builder: (context, index, animation) {
                        return buildCard(notification: controller.paginationData[index]);
                      },
                    )
                  : NoDataSliverComponent(
                      onTap: () => controller.getPaginationData(isRefresh: true),
                    ),
        ),
      ],
    );
  }

  Widget buildCard({required NotificationModel notification}) {
    return Container(
      margin: EdgeInsets.only(top: 10.h),
      constraints: BoxConstraints(minHeight: 90.h),
      child: Card(
        elevation: 7,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10.sp),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(right: 10.w, left: 10.w),
              height: 30.h,
              decoration: BoxDecoration(
                color: (notification.isRead!)
                    ? const Color.fromRGBO(34, 180, 115, 1)
                    : Colors.red,
                borderRadius: BorderRadius.all(Radius.circular(10.sp)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 7.sp,
                        backgroundColor: Colors.white,
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Text(
                        "${notification.title}",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  Text(
                    "${notification.createdAt}",
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0.w),
              child: Text("${notification.body}"),
            )
          ],
        ),
      ),
    );
  }
}
