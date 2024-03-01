import 'package:auto_size_text/auto_size_text.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:school/app/global/data/models/home_work_model.dart';
import 'package:school/app/global_components/appbar_components/main_appbar.dart';
import 'package:school/app/global_components/delete_dialog.dart';
import 'package:school/app/modules/teacher/pages/home_work_screens/home_work_screen/home_work_controller.dart';

import '../../../../../global_components/lists_components/animation_sliver_list_component.dart';
import '../../../../../global_components/lists_components/no_data_component.dart';
import '../../../../../them/app_colors.dart';
import '../../../route/routs.dart';
import '../../components/floate_add_button.dart';
import 'components/list_progress.dart';

class TeacherHomeWorkScreen extends GetView<TeacherHomeWorkController> {
  const TeacherHomeWorkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return controller.buildScreen(
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
        floatingActionButton: FloatAddButtonComponent(
          title: "اضافة وظيفة",
          onTap: () async {
            var result = await Get.toNamed(
                TeacherAppRoutes.ADD_HOME_WORK_SCREEN,
                arguments: {
                  'department': controller.department,
                  "section": controller.section
                });
            if (result != null) {
              if (result) {
                controller.getPaginationData(isRefresh: true);
              }
            }
          },
          tag: "add_job",
        ),
        widgets: [
          Obx(
            () => (controller.isLoadPagination.value)
                ? ProgressListWorkHomeComponent()
                : (controller.paginationData.isNotEmpty)
                    ? AnimationSliverList(
                        builder: (context, index, animation) {
                          return SlideTransition(
                            position: Tween<Offset>(
                              begin: Offset(0, 1),
                              end: Offset.zero,
                            ).animate(animation),
                            child: Padding(
                              padding: EdgeInsets.all(8.0.w),
                              child: buildWorkHomeCard(
                                  context: context,
                                  workHome: controller.paginationData[index]),
                            ),
                          );
                        },
                        length: controller.paginationData.length,
                      )
                    : NoDataSliverComponent(
                        onTap: () =>
                            controller.getPaginationData(isRefresh: true),
                      ),
          ),
        ],
        appBar: MainAnimatedAppBarComponent(
            svgUrl: "assets/svg/Homework.svg",
            openDrawer: (c) {
              Scaffold.of(c).openDrawer();
            },
            scrollController: controller.scrollController !,
            supWidgets: [
              Text(
                "الوظائف",
                style: TextStyle(
                    color: AppColors.ORANG_APP_COLOR,
                    fontWeight: FontWeight.bold,
                    fontSize: 22.sp),
              ),
              Text(
                "${controller.department.name}",
                style:
                    TextStyle(color: AppColors.SCAFFOLD_COLOR, fontSize: 15.sp),
              )
            ]));
  }

  Widget buildWorkHomeCard(
      {required HomeWorkModel workHome, required BuildContext context}) {
    return GestureDetector(
      onTap: () => Get.toNamed(TeacherAppRoutes.SHOW_HOME_WORK_SCREEN,
          arguments: {'home_work': workHome}),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10.sp),
          ),
        ),
        elevation: 4,
        child: Container(
          padding: EdgeInsets.all(10.w),
          height: 210.h,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(14.sp),
                    width: 70.w,
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
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 40.h,
                          width: Get.width,
                          child: AutoSizeText(
                            maxLines: 2,
                            "${workHome.title!}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17.sp,
                                overflow: TextOverflow.ellipsis),
                          ),
                        ),
                        Text(
                            " ${'المادة'.tr} : ${workHome.subject?.name ?? ''}"),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SizedBox(
                              height: 50.h,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    constraints:
                                        BoxConstraints(minWidth: 100.w),
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
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: DottedBorder(
                      radius: Radius.circular(50.sp),
                      padding: EdgeInsets.zero,
                      borderPadding: EdgeInsets.zero,
                      strokeWidth: 1.sp,
                      color: AppColors.PRIMARY_COLOR,
                      dashPattern: const [3, 4],
                      borderType: BorderType.RRect,
                      child: InkWell(
                        onTap: () async {
                          var res = await Get.toNamed(
                              TeacherAppRoutes.UPDATE_HOME_WORK_SCREEN,
                              arguments: {
                                'home_work': workHome,
                                "department": controller.department,
                                "section": controller.section
                              });
                          if (res == null) {
                            return;
                          } else {
                            if (res) {
                              controller.getPaginationData(isRefresh: true);
                            }
                          }
                        },
                        child: Container(
                          height: 30.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20.sp),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              "تعديل".tr,
                              style: const TextStyle(
                                  color: AppColors.PRIMARY_COLOR),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Expanded(
                    child: DottedBorder(
                      radius: Radius.circular(50.sp),
                      padding: EdgeInsets.zero,
                      borderPadding: EdgeInsets.zero,
                      strokeWidth: 1.sp,
                      color: AppColors.ORANG_APP_COLOR,
                      dashPattern: const [3, 4],
                      borderType: BorderType.RRect,
                      child: InkWell(
                        onTap: () => showDeleteDialog(
                            onDelete: () => controller.deleteHomeWork(workHome),
                            title: "حذف وظيفة",
                            content: workHome.title ?? '',
                            context: context),
                        child: Container(
                          height: 30.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20.sp),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              "حذف".tr,
                              style: const TextStyle(
                                  color: AppColors.ORANG_APP_COLOR),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Spacer(),
              DottedBorder(
                radius: Radius.circular(50.sp),
                padding: EdgeInsets.zero,
                borderPadding: EdgeInsets.zero,
                strokeWidth: 1.sp,
                color: AppColors.PRIMARY_COLOR,
                dashPattern: const [3, 4],
                borderType: BorderType.RRect,
                child: InkWell(
                  onTap: () => Get.toNamed(
                      TeacherAppRoutes.SHOW_WORKS_COMPLETED,
                      arguments: {"home_work": workHome}),
                  child: Container(
                    height: 30.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20.sp),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "إجابات الطلاب ",
                        style: const TextStyle(color: AppColors.PRIMARY_COLOR),
                      ),
                    ),
                  ),
                ),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
