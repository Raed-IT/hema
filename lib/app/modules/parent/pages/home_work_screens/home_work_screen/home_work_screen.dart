import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
 import 'package:school/app/modules/parent/pages/home_work_screens/home_work_screen/home_work_controller.dart';
import 'package:school/app/modules/parent/route/routs.dart';

import '../../../../../global/data/models/home_work_model.dart';
 import '../../../../../global_components/appbar_components/main_appbar.dart';
import '../../../../../global_components/drawer_component.dart';
import '../../../../../global_components/lists_components/animation_sliver_list_component.dart';
import '../../../../../global_components/lists_components/no_data_component.dart';
import '../../../../../them/app_colors.dart';
import 'components/list_progress.dart';

class ParentHomeWorkScreen extends GetView<ParentHomeWorkController> {
  const ParentHomeWorkScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerEnableOpenDragGesture: false,
      drawer: const DrawerComponent(),
      body: Builder(builder: (context) {
        return CustomScrollView(
          physics: const BouncingScrollPhysics(),
          controller: controller.scrollController,
          slivers: [
            MainAnimatedAppBarComponent(
              svgUrl: "assets/svg/Homework.svg",
              herTag: "Homework_tag",
              openDrawer: (conte) => Scaffold.of(conte).openDrawer(),
              scrollController: controller.scrollController,
              supWidgets: [
                const Text(""),
                Text(
                  "الوظائف",
                  style: TextStyle(
                      color: AppColors.ORANG_APP_COLOR,
                      fontWeight: FontWeight.bold,
                      fontSize: 25.sp),
                ),
              ],
            ),
            Obx(
              () => (controller.isLoad.value)
                  ? ParentProgressListWorkHomeComponent()
                  : (controller.workHomes.isNotEmpty)
                      ? AnimationSliverList(
                          builder: (context, index, animation) {
                            return SlideTransition(
                              position: Tween<Offset>(
                                begin: Offset(0, 1),
                                end: Offset.zero,
                              ).animate(animation),
                              child: Padding(
                                padding: EdgeInsets.all(8.0.w),
                                child: buildHomeWorkCard(
                                    workHome: controller.workHomes[index]),
                              ),
                            );
                          },
                          length: controller.workHomes.length,
                        )
                      : NoDataSliverComponent(
                          onTap: () => controller.getHomeWorks()),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 69.h,
              ),
            )
          ],
        );
      }),
    );
  }

  Widget buildHomeWorkCard({required HomeWorkModel workHome}) {
    return Card(
      shadowColor: AppColors.elevation_card_color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10.sp),
        ),
      ),
      elevation: 7,
      child: Container(
        padding: EdgeInsets.all(10.w),
        height: 120.h,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(14.sp),
                  width: 60.w,
                  height: 60.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10.sp)),
                      gradient: const LinearGradient(
                          colors: AppColors.MAIN_GRADIENT_COLOR)),
                  child: SvgPicture.asset(
                    'assets/svg/Homework.svg',
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      workHome.title!,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20.sp),
                    ),
                    Text(" ${'material'.tr} : ${workHome.subject?.name??''}"),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 50.h,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                constraints: BoxConstraints(minWidth: 100.w),
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                        width: 1.2,
                                        color: AppColors.DARK_COLOR
                                            .withOpacity(.2)),
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    Text("${'delivery_date'.tr} : "),
                                    Text(
                                      "${workHome.endDate}",
                                      style: TextStyle(
                                          fontFamily: "", fontSize: 10.sp),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 20.w,
                              ),
                              InkWell(
                                onTap: () => Get.toNamed(
                                    ParentAppRoutes.SHOW_WORK_HOME,
                                    arguments: {
                                      'home_work': workHome,
                                      "student": Get.arguments['student']
                                    }),
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(20.sp),
                                    ),
                                  ),
                                  child: Container(
                                    width: 100.w,
                                    height: 25.h,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(20.sp),
                                        ),
                                        gradient: const LinearGradient(
                                            colors:
                                                AppColors.MAIN_GRADIENT_COLOR)),
                                    child: Center(
                                      child: Text(
                                        "details".tr,
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
