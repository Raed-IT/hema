import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:school/app/global/data/constants.dart';
import 'package:school/app/global/data/controllers/main_controller.dart';
import 'package:school/app/global_components/appbar_components/main_appbar.dart';
import 'package:school/app/modules/driver/pages/home_screen/home_conteoller.dart';
import 'package:school/app/modules/driver/route/routs.dart';
import 'package:school/app/them/app_colors.dart';

import '../../../../global_components/avatar_component.dart';
import '../../data/mina_driver_controller.dart';

class DriverHomeScreen extends GetView<DriverHomeController> {
  DriverHomeScreen({Key? key}) : super(key: key);
  final MainController _mainController = Get.find<MainController>();

  @override
  Widget build(BuildContext context) {
    return controller.buildScreen(
        widgets: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 70.h,
                ),
                buildButton(
                    json: "assets/json/sunshine.json",
                    tag: 'morning',
                    onTap: () {
                      Get.find<DriverMainController>().time('am');
                      Get.toNamed(DriverAppRoutes.SHOW_STUDENTS_SCREEN,
                          arguments: {'json': "assets/json/sunshine.json"});
                    },
                    context: context,
                    bgAvatarColor: AppColors.SECONDARY_COLOR,
                    label: 'morning_shift',
                    bgColor: AppColors.SECONDARY_GRADIENT_COLOR),
                buildButton(
                    json: "assets/json/Moon-light.json",
                    tag: 'evening',
                    onTap: () {
                      Get.find<DriverMainController>().time('pm');
                      Get.toNamed(DriverAppRoutes.SHOW_STUDENTS_SCREEN,
                          arguments: {'json': "assets/json/Moon-light.json"});
                    },
                    context: context,
                    bgAvatarColor: AppColors.PRIMARY_COLOR,
                    label: 'evening_shift',
                    bgColor: AppColors.MAIN_GRADIENT_COLOR,
                    alignment: Alignment.centerLeft),
              ],
            ),
          )
        ],
        appBar: MainAnimatedAppBarComponent(
            imageProvider: const AssetImage('assets/custom/logo-school.png'),
            openDrawer: (c) => Scaffold.of(c).openDrawer(),
            scrollController: controller.scrollController!,
            supWidgets: [
              Text(
                "welcome".tr,
                style: TextStyle(
                    color: AppColors.ORANG_APP_COLOR,
                    fontSize: 17.sp,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: Get.width,
                child: AutoSizeText(
                  _mainController.currentUser.value!.name.toString(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.SCAFFOLD_COLOR,
                    fontSize: 17.sp,
                  ),
                ),
              )
            ]));
  }

  /*

  */
  Widget buildButton({
    required String label,
    required List<Color> bgColor,
    Alignment? alignment,
    required Color bgAvatarColor,
    required BuildContext context,
    required void Function()? onTap,
    required String tag,
    required String json,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(right: 40.w, left: 40.w),
        height: 100.h,
        child: Stack(
          alignment: Alignment.centerRight,
          children: [
            InkWell(
              onTap: onTap,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: bgColor,
                      begin: Alignment.centerRight,
                      end: Alignment.centerLeft),
                  borderRadius: BorderRadius.circular(500.sp),
                ),
                height: 40.h,
                width: double.infinity,
                child: Center(
                  child: Padding(
                    padding: (alignment == Alignment.centerLeft)
                        ? EdgeInsets.only(left: 40.w)
                        : EdgeInsets.only(right: 40.w),
                    child: Text(
                      label.tr,
                      style: TextStyle(
                          color: AppColors.SCAFFOLD_COLOR,
                          fontWeight: FontWeight.bold,
                          fontSize: 14.sp),
                    ),
                  ),
                ),
              ),
            ),
            Hero(
              transitionOnUserGestures: true,
              tag: tag,
              child: Align(
                alignment: alignment ?? Alignment.centerRight,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(500.sp),
                    ),
                  ),
                  margin: const EdgeInsets.all(0),
                  elevation: 7,
                  child: AvatarComponent(
                    bgColor: Colors.white,
                    radius: 37.sp,
                    widget: CircleAvatar(
                      backgroundColor: bgAvatarColor,
                      radius: 35.sp,
                      child: Lottie.asset(json),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
