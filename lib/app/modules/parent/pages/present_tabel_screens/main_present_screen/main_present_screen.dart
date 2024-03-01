import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:school/app/global_components/drawer_component.dart';
import 'package:school/app/modules/parent/data/routes_api.dart';
import 'package:school/app/modules/parent/route/routs.dart';

 import '../../../../../global_components/appbar_components/main_appbar.dart';
import '../../../../../them/app_colors.dart';
import 'main_present_controller.dart';

class ParentMainPresentScreen extends GetView<ParentMainPresentController> {
  const ParentMainPresentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerComponent(),
      body: Builder(
        builder: (context) {
          return CustomScrollView(
            controller: controller.scrollController,
            physics: const BouncingScrollPhysics(),
            slivers: [
              MainAnimatedAppBarComponent(
                  herTag: "check-tag",
                  svgUrl: "assets/svg/check.svg",
                  openDrawer: (conte) => Scaffold.of(context).openDrawer(),
                  scrollController: controller.scrollController,
                  supWidgets: [
                    Text(""),
                    Text(
                      "الحضور والغياب  ",
                      style: TextStyle(
                          color: AppColors.ORANG_APP_COLOR,
                          fontWeight: FontWeight.bold,
                          fontSize: 25.sp),
                    ),
                  ]),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 400.h,
                  child: Obx(
                    () => Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 10.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            buildCard(
                            durationMilS:600,
                              onTap: () => Get.toNamed(ParentAppRoutes.SHOE_PRESENT,
                                  arguments: {
                                    "student": controller.student,
                                    "type": "justification",
                                    "label": "ايام الغياب".tr
                                  }),
                              precent: controller.present / 365,
                              content: Center(
                                child: Text(
                                  "${controller.present}",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold, fontFamily: ''),
                                ),
                              ),
                              strokColor: AppColors.SECONDARY_COLOR,
                              footer: Container(
                                margin: EdgeInsets.only(top: 10.h),
                                child: Text(
                                  'days_absence'.tr,
                                  style:
                                      const TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            buildCard(
                                durationMilS:700,
                              onTap: () => Get.toNamed(ParentAppRoutes.SHOE_PRESENT,
                                  arguments: {
                                    "student": controller.student,
                                  "type": "absence",
                                  "label": "absence".tr
                                  } ),
                              precent: controller.lost / 365,
                              content: Center(
                                child: Text(
                                  "${controller.lost}",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold, fontFamily: ''),
                                ),
                              ),
                              strokColor: AppColors.PRIMARY_COLOR,
                              footer: Container(
                                margin: EdgeInsets.only(top: 10.h),
                                child: Text(
                                  "days_absence_excused".tr,
                                  style:
                                      const TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            buildCard(
                              durationMilS:800,
                              precent: controller.success / 365,
                              content: Center(
                                child: Text(
                                  "${controller.success}",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold, fontFamily: ''),
                                ),
                              ),
                              strokColor: AppColors.PRIMARY_COLOR,
                              footer: Container(
                                margin: EdgeInsets.only(top: 10.h),
                                child: Text(
                                  'days_attendance'.tr,
                                  style:
                                      const TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            buildCard(
                              durationMilS:900,
                              precent: controller.holiday / 365,
                              content: Center(
                                child: Text(
                                  '${controller.holiday}',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold, fontFamily: ''),
                                ),
                              ),
                              strokColor: Color(0xff2cc8fa),
                              footer: Container(
                                margin: EdgeInsets.only(top: 10.h),
                                child: Text(
                                  'holidays'.tr,
                                  style:
                                      const TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          );
        }
      ),
    );
  }

  Widget buildCard({
    required Color strokColor,
    required Widget content,
    required Widget footer,
    required double precent,
    required int durationMilS  ,
    void Function()? onTap,
  }) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(12.sp),
        ),
      ),
      shadowColor: AppColors.elevation_card_color,
      elevation: 12,
      child: GestureDetector(
        onTap: onTap,
        child: DottedBorder(
          radius: Radius.circular(10.sp),
          padding: EdgeInsets.all(10.sp),
          strokeWidth: 1.2.sp,
          color: AppColors.PRIMARY_COLOR,
          dashPattern: const [3, 4],
          borderType: BorderType.RRect,
          child: Column(
            children: [
              CircularPercentIndicator(
                footer: footer.animate().slideY(duration: Duration(milliseconds: durationMilS-200) ,begin: 1).fadeIn(),
                radius: 45.sp,
                lineWidth: 7.sp,
                percent: precent,
                animationDuration: 1,
                animateFromLastPercent: true,
                animation: true,
                restartAnimation: true,
                backgroundColor: const Color.fromRGBO(242, 242, 242, 1),
                center: content.animate().slideY(duration: Duration(milliseconds: durationMilS-100) ,begin: 1).fadeIn(),
                progressColor: strokColor,
              ),
            ],
          ),
        ),
      ),
    ).animate().slideY(duration: Duration(milliseconds: durationMilS) ,begin: 1).fadeIn();
  }
}
