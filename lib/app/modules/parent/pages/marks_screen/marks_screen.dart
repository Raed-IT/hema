import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:school/app/global/data/models/exam_mark_model.dart';
import '../../../../global_components/appbar_components/main_appbar.dart';
import '../../../../global_components/drawer_component.dart';
import '../../../../global_components/lists_components/animation_sliver_list_component.dart';
import '../../../../global_components/lists_components/no_data_component.dart';
import '../../../../them/app_colors.dart';
import 'components/list_progress_markers.dart';
import 'components/sup_hed_marker.dart';
import 'marks_controller.dart';

class ParentMarkersScreen extends GetView<ParentMarkersController> {
  const ParentMarkersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerEnableOpenDragGesture: false,
      drawer: const DrawerComponent(),
      body: Builder(builder: (context) {
        return CustomScrollView(
          controller: controller.scrollController,
          physics: const BouncingScrollPhysics(),
          slivers: [
            MainAnimatedAppBarComponent(
                herTag: "results-tag",
                svgUrl: "assets/svg/results.svg",
                openDrawer: (conte) => Scaffold.of(conte).openDrawer(),
                scrollController: controller.scrollController,
                supWidgets: [
                  const Text(""),
                  Text(
                    "العلامات ",
                    style: TextStyle(
                        color: AppColors.ORANG_APP_COLOR,
                        fontWeight: FontWeight.bold,
                        fontSize: 25.sp),
                  ),
                ]),
            const ParentSupHeadMarke(),
            Obx(
              () => (controller.isLoadMarkers.value)
                  ? const ParentListProgressMarks()
                  : (controller.markers.isNotEmpty)
                      ? AnimationSliverList(
                          length: controller.markers.length,
                          builder: (context, index, animation) {
                            return buildCard(marker: controller.markers[index]);
                          },
                        )
                      : NoDataSliverComponent(
                          onTap: () {
                            controller.getMarkers();
                          },
                        ),
            )
          ],
        );
      }),
    );
  }

  Widget buildCard({required ExamMarkerModel marker}) {
    return SizedBox(
      height: 90.h,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10.sp),
          ),
        ),
        margin: EdgeInsets.all(10.w),
        elevation: 7,
        shadowColor: AppColors.elevation_card_color,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(right: 10.w, left: 10.w),
              height: 30.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10.sp)),
                gradient: const LinearGradient(
                  colors: AppColors.MAIN_GRADIENT_COLOR,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/svg/Book.svg',
                        height: 20.h,
                        color: Colors.white,
                      ).animate().slideY(begin: 1),
                      Container(
                        margin: EdgeInsets.only(
                            top: 5.h, bottom: 5.h, right: 5.w, left: 6.w),
                        height: 13.h,
                        width: 80.w,
                        child: Text(
                          "${marker.subject} - ${marker.quiz}",
                          style: const TextStyle(color: Colors.white),
                        ),
                      ).animate().slideX(begin: -1).fadeIn(),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${marker.inDay}',
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 7.sp,
                            backgroundColor: getMarkColor(marker.status),
                          ).animate().slideX(
                              begin: -1,
                              duration: const Duration(milliseconds: 20)),
                          SizedBox(
                            width: 5.w,
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0.w, right: 8.0.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: (Get.locale!.languageCode == "ar")
                          ? MainAxisAlignment.start
                          : MainAxisAlignment.end,
                      children: [
                        SvgPicture.asset(
                          'assets/svg/results.svg',
                          height: 20.h,
                          color: AppColors.SECONDARY_COLOR,
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Text(
                            '${"deserved_mark".tr} ${marker.mark!.toStringAsFixed(1)}'),
                      ],
                    ),
                  ),
                  Container(
                    height: 41.h,
                    decoration: BoxDecoration(
                      border: Border(
                        left: BorderSide(
                          width: 1.w,
                          color: AppColors.DARK_COLOR.withOpacity(.3),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: (Get.locale!.languageCode == "ar")
                          ? MainAxisAlignment.end
                          : MainAxisAlignment.start,
                      children: [
                        SvgPicture.asset(
                          'assets/svg/results.svg',
                          height: 20.h,
                          color: AppColors.SECONDARY_COLOR,
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Text('${"top_mark".tr} ${marker.maxMark}'),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Color getMarkColor(String? status) {
    if (status == null) {
      return Colors.transparent;
    }
    if (status == "success") {
      return Colors.green;
    } else if (status == "middle") {
      return Colors.orange;
    }
    return Colors.red;
  }
}
