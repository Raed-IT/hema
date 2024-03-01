import 'package:auto_size_text/auto_size_text.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
 import 'package:school/app/global/route/routs.dart';
import 'package:school/app/modules/parent/pages/show_student/show_studeent_controller.dart';
import 'package:school/app/modules/parent/route/routs.dart';
import 'package:school/app/them/app_colors.dart';

import '../../../../global_components/appbar_components/main_appbar.dart';
import '../../../../global_components/drawer_component.dart';

class ParentShowStudentScreen extends GetView<ParentShowStudentController> {
  const ParentShowStudentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerEnableOpenDragGesture: false,
      drawer: const DrawerComponent(),
      body: Builder(builder: (context) {
        return CustomScrollView(
          physics: BouncingScrollPhysics(),
          controller: controller.scrollController,
          slivers: [
            MainAnimatedAppBarComponent(
              openDrawer: (conte) {
                Scaffold.of(context).openDrawer();
              },
              imageProvider: NetworkImage(controller.student.img!),
              herTag: "${controller.student.id!}",
              supWidgets: [
                AutoSizeText(
                  maxLines: 1,
                  "${controller.student.fullName}",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22.sp,
                      color: AppColors.SECONDARY_COLOR),
                ),
                AutoSizeText(
                  " ${'class'.tr}:${controller.student.section?.name ?? ''}   ${controller.student.department?.name ?? ''}",
                  style: TextStyle(color: Colors.white, fontSize: 13.sp),
                  maxLines: 1,
                ),
              ],
              scrollController: controller.scrollController,
            ),
            SliverToBoxAdapter(
              child: GestureDetector(
                onTap: () => Get.toNamed(GlobalAppRoutes.POSTES_SCREEN,
                    arguments: {"department": controller.student.department}),
                child: Container(
                  margin: EdgeInsets.all(20.h),
                  width: double.maxFinite,
                  height: 60.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10.sp)),
                    gradient: const LinearGradient(
                        begin: Alignment.centerRight,
                        end: Alignment.centerLeft,
                        colors: AppColors.SECONDARY_GRADIENT_COLOR),
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: 50.h,
                        width: 50.w,
                        padding: EdgeInsets.all(5.w),
                        margin: EdgeInsets.only(left: 5.w, right: 5.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.sp),
                          ),
                          color: Colors.white,
                        ),
                        child: SvgPicture.asset(
                          'assets/svg/news.svg',
                          color: AppColors.PRIMARY_COLOR,
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Text(
                        'news_school'.tr,
                        style: TextStyle(color: Colors.white, fontSize: 17.sp),
                      ),
                    ],
                  ),
                ),
              ).animate(),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      buildCard(
                        tag: "Homework_tag",
                        onTap: () => Get.toNamed(ParentAppRoutes.WORK_HOME,
                            arguments: {"student": controller.student}),
                        imgPath: 'assets/svg/Homework.svg',
                        title: 'home_work'.tr,
                      ),
                      buildCard(
                        tag: "sticky-notes-tag",
                        onTap: () => Get.toNamed(ParentAppRoutes.NOTES,
                            arguments: {"student": controller.student}),
                        imgPath: 'assets/svg/sticky-notes.svg',
                        title: 'notes'.tr,
                      ),
                      buildCard(
                        tag: "results-tag",
                        onTap: () => Get.toNamed(ParentAppRoutes.MARKERS_SCREN,
                            arguments: {"student": controller.student}),
                        imgPath: 'assets/svg/results.svg',
                        title: 'markers'.tr,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      buildCard(
                        tag: "teacher-tag",
                        onTap: () => Get.toNamed(ParentAppRoutes.TEACHER,
                            arguments: {"student": controller.student}),
                        imgPath: 'assets/svg/teacher.svg',
                        title: 'teachers'.tr,
                      ),
                      buildCard(
                        tag: "notification-tag",
                        onTap: () => Get.toNamed(
                            GlobalAppRoutes.NOTIFICATION_SCREEN,
                            arguments: {"student": controller.student}),
                        imgPath: 'assets/svg/Natiufecations.svg',
                        title: 'notification'.tr,
                      ),
                      buildCard(
                        tag: "check-tag",
                        onTap: () => Get.toNamed(ParentAppRoutes.PRESENT,
                            arguments: {"student": controller.student}),
                        imgPath: 'assets/svg/check.svg',
                        title: 'attendees'.tr,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      buildCard(
                        tag: "report-tag",
                        onTap: () => Get.toNamed(GlobalAppRoutes.REPORTS,
                            arguments: {
                              "department": controller.student.department,
                              "student": controller.student
                            }),
                        imgPath: 'assets/svg/report.svg',
                        title: 'report'.tr,
                      ),
                      buildCard(
                        tag: "weakly-program",
                        onTap: () => Get.toNamed(GlobalAppRoutes.WEEKLY_PROGRAM,
                            arguments: {
                              "departmentId": controller.student.department?.id
                            }),
                        imgPath: 'assets/svg/Calender.svg',
                        title: 'weekly'.tr,
                      ),
                      buildCard(
                        tag: "exams_tag",
                        onTap: () => Get.toNamed(ParentAppRoutes.EXAMS_SCREEN,
                            arguments: {"student": controller.student}),
                        imgPath: 'assets/svg/weakly.svg',
                        title: 'exams_table'.tr,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 5.w,
                      ),
                      buildCard(
                        tag: "monney-tag",
                        onTap: () => Get.toNamed(
                            ParentAppRoutes.EXPENSES_SCREEN,
                            arguments: {"student": controller.student}),
                        imgPath: 'assets/svg/monney.svg',
                        title: 'expenses'.tr,
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      buildCard(
                        tag: "Homework",
                        bgColor: AppColors.SECONDARY_COLOR,
                        onTap: () =>
                            Get.toNamed(GlobalAppRoutes.ABOUT_SCHOOL_SCREEN),
                        imgPath: 'assets/svg/Homework.svg',
                        title: 'about_school'.tr,
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      buildCard(
                        tag: "update_location-tag",
                        onTap: () => Get.toNamed(ParentAppRoutes.MAP,
                            arguments: {"student": controller.student}),
                        title: 'update_location'.tr,
                      ),
                    ],
                  )
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: GestureDetector(
                onTap: () => Get.toNamed(ParentAppRoutes.STATISTIC,
                    arguments: {"student": controller.student}),
                child: Container(
                  margin: EdgeInsets.all(20.h),
                  width: double.maxFinite,
                  height: 60.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10.sp)),
                    gradient: const LinearGradient(
                        begin: Alignment.centerRight,
                        end: Alignment.centerLeft,
                        colors: AppColors.SECONDARY_GRADIENT_COLOR),
                  ),
                  child: Row(
                    children: [
                      Hero(
                        tag: "statisitc-tag",
                        child: Container(
                          height: 50.h,
                          width: 50.w,
                          padding: EdgeInsets.all(5.w),
                          margin: EdgeInsets.only(left: 5.w, right: 5.w),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.sp),
                            ),
                            color: Colors.white,
                          ),
                          child: SvgPicture.asset(
                            'assets/svg/statisitc.svg',
                            color: AppColors.PRIMARY_COLOR,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Text(
                        '    احصائيات ',
                        style: TextStyle(color: Colors.white, fontSize: 17.sp),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }

  Widget buildCard(
      {required void Function() onTap,
      String? imgPath,
      required String tag,
      required String title,
      Color bgColor = Colors.white}) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 110.w,
        height: 119.h,
        child: Card(
          color: bgColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.sp))),
          shadowColor: AppColors.elevation_card_color,
          elevation: 9,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                height: 10.h,
              ),
              Hero(
                tag: tag,
                child: DottedBorder(
                  radius: Radius.circular(10.sp),
                  strokeWidth: 1.2.sp,
                  color: AppColors.PRIMARY_COLOR,
                  dashPattern: const [3, 4],
                  borderType: BorderType.RRect,
                  child: Container(
                    width: 50.w,
                    height: 50.h,
                    padding: EdgeInsets.all(5.sp),
                    child: imgPath == null
                        ? const Icon(
                            FontAwesomeIcons.mapMarkedAlt,
                            color: AppColors.PRIMARY_COLOR,
                          )
                        : SvgPicture.asset(
                            imgPath,
                            color: AppColors.PRIMARY_COLOR,
                          ),
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              AutoSizeText(
                title,
                maxLines: 1,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, color: AppColors.DARK_COLOR),
              ),
              SizedBox(height: 5.sp)
            ],
          ),
        ),
      ),
    );
  }
}
