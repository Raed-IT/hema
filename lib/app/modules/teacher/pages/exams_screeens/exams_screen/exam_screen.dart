import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:helper_plugin/ui/images/componentes/privew_image.dart';
import 'package:school/app/global/data/models/exam_model.dart';
import 'package:school/app/global_components/appbar_components/main_appbar.dart';
import 'package:school/app/global_components/drawer_component.dart';
import 'package:school/app/modules/teacher/pages/exams_screeens/exams_screen/exam_controller.dart';
import 'package:school/app/modules/teacher/route/routs.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../global_components/delete_dialog.dart';
import '../../../../../global_components/lists_components/animation_sliver_list_component.dart';
import '../../../../../global_components/lists_components/no_data_component.dart';
import '../../../../../them/app_colors.dart';
import 'components/progress_list.dart';

class TeacherExamScreen extends GetView<TeacherExamController> {
  const TeacherExamScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerComponent(),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: AppColors.PRIMARY_COLOR,
        heroTag: "add_quizzes",
        onPressed: () async {
          var res = await Get.toNamed(TeacherAppRoutes.ADD_EXAM_CREEN,
              arguments: {
                "department": controller.department,
                "section": controller.section
              });
          if (res == null) {
            return;
          } else {
            controller.getData();
          }
        },
        label: Row(
          children: [
            const Icon(Icons.add),
            Text("إضافة إختبار".tr),
          ],
        ),
      ),
      body: Builder(
        builder: (context) {
          return CustomScrollView(
            controller: controller.scrollController,
            physics: const BouncingScrollPhysics(),
            slivers: [
              MainAnimatedAppBarComponent(
                  svgUrl: "assets/svg/report.svg",
                  openDrawer: (_) {
                    Scaffold.of(context).openDrawer();
                  },
                  scrollController: controller.scrollController,
                  supWidgets: [
                    Text(''),
                    Text(
                      "الإختبارات ",
                      style: TextStyle(
                          color: AppColors.ORANG_APP_COLOR,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold),
                    )
                  ]),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 20.h,
                ),
              ),
              Obx(
                () => (controller.isLoad.value)
                    ? ProgressListExamsComponent()
                    : (controller.exams.isNotEmpty)
                        ? AnimationSliverList(
                            builder: (context, index, animation) {
                              return buildCard(
                                  context: context, exam: controller.exams[index]);
                            },
                            length: controller.exams.length,
                          )
                        : NoDataSliverComponent(
                            onTap: () {
                              controller.getData();
                            },
                          ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 70.h,
                ),
              ),
            ],
          );
        }
      ),
    );
  }

  Widget buildCard({required ExamModel exam, required BuildContext context}) {
    return Card(
      margin: EdgeInsets.all(10.w),
      elevation: 7,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10.sp),
        ),
      ),
      shadowColor: AppColors.elevation_color,
      child: Padding(
        padding: EdgeInsets.all(10.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(10.sp),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10.sp)),
                    gradient: const LinearGradient(
                      colors: AppColors.MAIN_GRADIENT_COLOR,
                    ),
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      'assets/svg/Homework.svg',
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${exam.title}",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20.sp),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      "${exam.department}",
                      style: TextStyle(
                          fontSize: 14.sp, color: AppColors.DARK_COLOR),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: AppColors.DARK_COLOR.withOpacity(.3),
                          ),
                        ),
                      ),
                      child: Text(
                        " ${'date'.tr}  ${exam.startDate}",
                        style: TextStyle(
                            fontSize: 14.sp, color: AppColors.DARK_COLOR),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Obx(
              () => (exam.images.isNotEmpty)
                  ? Card(
                      margin: EdgeInsets.all(10.w),
                      elevation: 7,
                      shadowColor: AppColors.elevation_color,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.sp),
                        ),
                      ),
                      child: Stack(
                        children: [
                          Container(
                            height: 200.h,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(10.sp),
                              ),
                            ),
                            width: double.maxFinite,
                            child: Shimmer.fromColors(
                              // direction: ShimmerDirection.btt,
                              period: const Duration(seconds: 3),
                              baseColor: AppColors.BASEShIMMER_COLOR,
                              highlightColor: AppColors.HIGHLIGHT_SHIMMER_COLOR,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10.sp),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () => previewImage(
                              context: context,
                              imagesUrls: exam.images,
                            ),
                            child: Stack(
                              children: [
                                Container(
                                  height: 200.h,
                                  width: double.maxFinite,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10.sp),
                                    ),
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image:
                                          NetworkImage("${exam.images[0].url}"),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 200.h,
                                  width: double.maxFinite,
                                  decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(.5),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10.sp),
                                    ),
                                  ),
                                  child: Center(
                                    // child: Text('  عدد الصور${quizzes.images!.length}',style: TextStyle(color: Colors.white ,fontSize: 15.sp),),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          FontAwesomeIcons.photoFilm,
                                          color: Colors.white,
                                          size: 30.sp,
                                        ),
                                        SizedBox(
                                          width: 20.sp,
                                        ),
                                        Text(
                                          "${exam.images.length}",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 30.sp),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  : Container(),
            ),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 12.0.w, right: 12.w),
              child: Text("${exam.info}"),
            ),
            SizedBox(
              height: 20.h,
            ),
            Divider(
              height: 30.h,
            ),
            (exam.isTeacher!)
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      buildButton(
                        colors: AppColors.MAIN_GRADIENT_COLOR,
                        title: "تعديل".tr,
                        onTap: () async {
                          var res = await Get.toNamed(
                              TeacherAppRoutes.UPDATE_EXAM,
                              arguments: {
                                "section": controller.section,
                                "exam": exam,
                                "department": Get.arguments['department']
                              });
                          if (res == null) {
                            return;
                          } else {
                            if (res) {
                              controller.getData();
                            }
                          }
                        },
                      ),
                      buildButton(
                        colors: AppColors.SECONDARY_GRADIENT_COLOR,
                        title: "عرض العلامات  ",
                        onTap: () {
                          Get.toNamed(TeacherAppRoutes.SHOW_MARKERS_SCREN,
                              arguments: {
                                "exam": exam,
                                "department": controller.department
                              });
                        },
                      ),
                      buildButton(
                        colors: AppColors.SECONDARY_GRADIENT_COLOR,
                        title: "حذف ",
                        onTap: () {
                          if (!exam.hasMark!) {
                            showDeleteDialog(
                                context: context,
                                title: "حذف امتحان",
                                content: exam.title ?? '',
                                onDelete: () => controller.deleteExam(exam));
                          } else {
                            Fluttertoast.showToast(
                                msg: "لايمكنك حذف الاختبار ");
                            Fluttertoast.showToast(
                                msg: "لقد تم رفع علامات خاصة به");
                          }
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
      {required List<Color> colors,
      required String title,
      required void Function()? onTap}) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Card(
          elevation: 7,
          shadowColor: AppColors.DARK_COLOR.withOpacity(.4),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(50.sp),
            ),
          ),
          child: Container(
            height: 30.h,
            child: Center(
              child: Text(
                title,
                style: TextStyle(color: Colors.white),
              ),
            ),
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: colors),
              borderRadius: BorderRadius.all(
                Radius.circular(50.sp),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
