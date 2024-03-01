import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:school/app/global/route/routs.dart';
import 'package:school/app/global_components/appbar_components/main_appbar.dart';
import 'package:school/app/modules/teacher/pages/show_students_screen/show_students_controller.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:school/app/modules/teacher/route/routs.dart';

import '../../../../global/data/models/student_model.dart';
import '../../../../global_components/lists_components/animation_sliver_list_component.dart';
import '../../../../global_components/lists_components/no_data_component.dart';
import '../../../../them/app_colors.dart';
import 'component/progress_list_students.dart';

class ShowStudentsScreen extends GetView<ShowStudentsController> {
  const ShowStudentsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return controller.buildScreen(
        appBar: MainAnimatedAppBarComponent(
            svgUrl: "assets/svg/class.svg",
            openDrawer: (c) => Scaffold.of(c).openDrawer(),
            scrollController: controller.scrollController!,
            supWidgets: [
              Text(
                "طلاب الشعبة ",
                style: TextStyle(
                    color: AppColors.ORANG_APP_COLOR,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "${controller.department.name}",
                style:
                    TextStyle(fontSize: 15.sp, color: AppColors.SCAFFOLD_COLOR),
              )
            ]),
        widgets: [
          SliverToBoxAdapter(
            child: SizedBox(
              height: 90,
              child: Column(
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    "  ${controller.department.name}",
                    style: const TextStyle(
                      color: AppColors.DARK_COLOR,
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  const Divider(),
                ],
              ),
            ),
          ),
          Obx(
            () => (controller.isLoadPagination.value)
                ? ProgressListStudentsComponent()
                : (controller.paginationData.isNotEmpty)
                    ? AnimationSliverList(
                        builder: (context, index, animation) {
                          // print (_controller.students[index].img);
                          return SlideTransition(
                            position: Tween<Offset>(
                              begin: const Offset(0, 1),
                              end: Offset.zero,
                            ).animate(animation),
                            child: buildStudentCard(
                                student: controller.paginationData[index]),
                          );
                        },
                        length: controller.paginationData.length,
                      )
                    : NoDataSliverComponent(
                        onTap: () =>
                            controller.getPaginationData(isRefresh: true),
                      ),
          )
        ]);
  }

  Widget buildStudentCard({required StudentModel student}) {
    return SizedBox(
      height: 180.h,
      child: Card(
        elevation: 7,
        shadowColor: AppColors.elevation_color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10.sp),
          ),
        ),
        margin: EdgeInsets.only(top: 15.h, right: 10.w, left: 10.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Hero(
                  transitionOnUserGestures: true,
                  tag: student.id.toString(),
                  child: Container(
                    margin: EdgeInsets.all(5.sp),
                    height: 80.h,
                    width: 80.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10.sp)),
                      image: DecorationImage(
                        image: NetworkImage(student.img!),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 7.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20.h,
                    ),
                    SizedBox(
                      width: 170.w,
                      child: AutoSizeText(
                        student.fullName!,
                        maxLines: 1,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.sp,
                            color: AppColors.DARK_COLOR),
                      ),
                    ),
                    Text("${student.section!.name}"),
                  ],
                ),
                const Spacer(),
                Padding(
                  padding: EdgeInsets.only(top: 18.0.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      RatingBar.builder(
                        maxRating: 5,
                        itemSize: 20,
                        initialRating: 3,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 1,
                        itemPadding:
                            const EdgeInsets.symmetric(horizontal: 4.0),
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          print(rating);
                        },
                      ),
                      Text(
                        ((student.ratio! * 5) / 100).toStringAsFixed(1),
                        style: const TextStyle(fontFamily: ''),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                    ],
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 10.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  buildButton(
                      onTap: () => Get.toNamed(GlobalAppRoutes.PROFILE_STUDENT,
                          arguments: {'student': student}),
                      title: " الملف الشخصي ",
                      colors: AppColors.SECONDARY_GRADIENT_COLOR),
                  buildButton(
                      onTap: () =>
                          Get.toNamed(GlobalAppRoutes.REPORT_ITEMS, arguments: {
                            "isTeacher": true,
                            'student': student,
                          }),
                      title: "التقييمات"),
                  buildButton(
                      onTap: () {
                        Get.toNamed(TeacherAppRoutes.NOTES, arguments: {
                          'student': student,
                          "department": Get.arguments['department']
                        });
                      },
                      title: "الملاحظات "),
                ],
              ),
            ),
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
              elevation: 5,
              // shadowColor: AppColors.elevation_color,
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
            )),
      ),
    );
  }
}
