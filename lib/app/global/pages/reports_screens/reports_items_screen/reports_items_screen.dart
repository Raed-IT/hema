import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:school/app/global/data/enums/report_status_enum.dart';
import 'package:school/app/global/pages/reports_screens/reports_items_screen/reports_items_controller.dart';
import 'package:school/app/global/route/routs.dart';
import 'package:school/app/global_components/delete_dialog.dart';
import 'package:school/app/global_components/lists_components/animation_sliver_list_component.dart';
import 'package:school/app/modules/teacher/route/routs.dart';

import '../../../../global_components/appbar_components/main_appbar.dart';
import '../../../../global_components/lists_components/no_data_component.dart';
import '../../../../modules/teacher/pages/components/floate_add_button.dart';
import '../../../../modules/teacher/pages/notes_screens/components/progress_list_notes.dart';
import '../../../../them/app_colors.dart';
import '../../../data/models/report_item_model.dart';

class ReportsItemsScreen extends GetView<ReportsItemsController> {
  const ReportsItemsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return controller.buildScreen(
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: (controller.isTeacher)
          ? FloatAddButtonComponent(
              title: 'إضافة تقييم'.tr,
              onTap: () async {
                var result = await Get.toNamed(TeacherAppRoutes.ADD_REPORT_ITEM,
                    arguments: {
                      'student': controller.department,
                      "department": controller.cuurentDepartment
                    });
                if (result != null) {
                  if (result) {
                    controller.getPaginationData(isRefresh: true);
                  }
                }
              },
              tag: "add_report",
            )
          : Container(),
      appBar: MainAnimatedAppBarComponent(
        svgUrl: "assets/svg/report.svg",
        openDrawer: (c) {
          Scaffold.of(c).openDrawer();
        },
        scrollController: controller.scrollController!,
        supWidgets: [
          Text(""),
          Text(
            "التقييمات",
            style: TextStyle(
                color: AppColors.ORANG_APP_COLOR,
                fontWeight: FontWeight.bold,
                fontSize: 25.sp),
          )
        ],
      ),
      widgets: [
        SliverToBoxAdapter(
          child: (controller.isTeacher)
              ? Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () => Get.offNamed(TeacherAppRoutes.NOTES,
                              arguments: {'student': Get.arguments['student']}),
                          child: SizedBox(
                            height: 50.h,
                            child: Card(
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10.sp),
                                ),
                              ),
                              color: AppColors.PRIMARY_COLOR,
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10.sp),
                                    ),
                                    gradient: const LinearGradient(
                                        colors: AppColors.MAIN_GRADIENT_COLOR)),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    SvgPicture.asset(
                                      'assets/svg/sticky-notes.svg',
                                      width: 50.w,
                                      height: 30.h,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    Text('notes'.tr,
                                        style: const TextStyle(
                                            color: Colors.white)),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () => Get.toNamed(
                              GlobalAppRoutes.PROFILE_STUDENT,
                              arguments: {'student': Get.arguments['student']}),
                          child: SizedBox(
                            height: 50.h,
                            child: Card(
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10.sp),
                                ),
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10.sp),
                                    ),
                                    gradient: const LinearGradient(
                                        colors: AppColors
                                            .SECONDARY_GRADIENT_COLOR)),
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    SvgPicture.asset(
                                      'assets/svg/Studemt.svg',
                                      width: 50.w,
                                      height: 30.h,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    Text(
                                      'profile'.tr,
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                )
              : Container(),
        ),
        Obx(
          () => (controller.isLoadPagination.value)
              ? ProgressNotesList()
              : (controller.paginationData.isNotEmpty)
                  ? AnimationSliverList(
                      length: controller.paginationData.length,
                      builder: (context, index, animation) {
                        return SlideTransition(
                          position: Tween<Offset>(
                            begin: Offset(0, 1),
                            end: Offset.zero,
                          ).animate(animation),
                          child: buildCard(
                              context: context,
                              report: controller.paginationData[index]),
                        );
                      },
                    )
                  : NoDataSliverComponent(
                      onTap: () =>
                          controller.getPaginationData(isRefresh: true),
                    ),
        )
      ],
    );
  }

  Widget buildCard(
      {required ReportItemModel report, required BuildContext context}) {
    print ((double.parse((report.ratio??"0"))*5)/100);
    return Container(
      margin: EdgeInsets.only(top: 10.h),
      constraints: BoxConstraints(minHeight: 100.h),
      child: Card(
        elevation: 7,
        shadowColor: AppColors.elevation_color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(15.sp),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.sp),
                      bottomLeft: Radius.circular(10.sp),
                    ),
                    color: AppColors.ORANG_APP_COLOR.withOpacity(.1),
                  ),
                  padding: EdgeInsets.only(right: 25.sp, left: 20.sp),
                  child: Text(
                    "${report.date}",
                    style: const TextStyle(
                        color: AppColors.PRIMARY_COLOR,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                Text(
                  report.status?.name.toReportItemName() ?? '',
                  style:
                      TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.sp),
                  child: Text(
                    report.subject?.name ?? "",
                    style:
                        TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 15.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "التقييم  :",
                  style: TextStyle(
                      color: AppColors.PRIMARY_COLOR,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold),
                ),
                RatingBar.builder(
                  initialRating:  (double.parse((report.ratio??"0"))*5)/100,
                   direction: Axis.horizontal,
                  ignoreGestures: true,
                  itemCount: 5,
                  allowHalfRating: true,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => SizedBox(
                    height: 10.h,
                    child: Icon(
                      size: 8.sp,
                      Icons.star,
                      color: Colors.amber,
                    ),
                  ),
                  onRatingUpdate: (double value) {},
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(25.sp),
              child: Text(report.info ?? ""),
            ),
            SizedBox(
              height: 10.h,
            ),
            (report.isTeacher! && controller.isTeacher)
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      buildButton(
                        colors: AppColors.MAIN_GRADIENT_COLOR,
                        title: "تعديل".tr,
                        onTap: () async {
                          var res = await Get.toNamed(
                              TeacherAppRoutes.UPDATE_REPORT_ITEM,
                              arguments: {
                                "current_department":
                                    controller.cuurentDepartment,
                                "report_item": report,
                                "student": controller.student,
                              });
                          if (res == null) {
                            return;
                          } else {
                            if (res) {
                              controller.getPaginationData(isRefresh: true);
                            }
                          }
                        },
                      ),
                      buildButton(
                        colors: AppColors.SECONDARY_GRADIENT_COLOR,
                        title: "حذف ",
                        onTap: () {
                          showDeleteDialog(
                              context: context,
                              onDelete: () =>
                                  controller.deleteReportItem(report),
                              title: "حذف تقييم",
                              content:
                                  "  تقرير  مادة   ${report.subject?.name ?? '__'}");
                        },
                      ),
                    ],
                  )
                : Container()
          ],
        ),
      ),
    );
  }

  Widget buildButton(
      {required String title,
      List<Color>? colors = AppColors.MAIN_GRADIENT_COLOR,
      required void Function()? onTap}) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: SizedBox(
          height: 40.h,
          child: Card(
            elevation: 7,
            shadowColor: AppColors.elevation_color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(15.sp),
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15.sp)),
                  gradient: LinearGradient(colors: colors!)),
              child: Center(
                child: Text(
                  title,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
