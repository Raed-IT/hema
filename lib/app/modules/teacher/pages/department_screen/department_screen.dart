import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:school/app/global/data/constants.dart';
import 'package:school/app/global/route/routs.dart';
import 'package:school/app/global_components/appbar_components/main_appbar.dart';
import 'package:school/app/global_components/drawer_component.dart';
import 'package:school/app/modules/teacher/route/routs.dart';
import '../../../../them/app_colors.dart';
import 'department_controller.dart';

class TeacherDepartmentScreen extends GetView<TeacherDepartmentController> {
  const TeacherDepartmentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: AppColors.PRIMARY_COLOR,
        onPressed: () => Get.toNamed(TeacherAppRoutes.ADD_POST_SCREEN,
            arguments: {
              "section": controller.section,
              "department": controller.department
            }),
        label: const Row(
          children: [Icon(Icons.add), Text('إضافة خبر')],
        ),
        heroTag: "add_posts",
      ),
      drawer: const DrawerComponent(),
      body: Builder(builder: (context) {
        return CustomScrollView(
          physics: const BouncingScrollPhysics(),
          controller: controller.scrollController,
          slivers: [
            MainAnimatedAppBarComponent(
                svgUrl: "assets/svg/class_chaire.svg",
                openDrawer: (_) {
                  Scaffold.of(context).openDrawer();
                },
                scrollController: controller.scrollController,
                supWidgets: [
                  Text(
                    Constants.SCHOOL_NAME,
                    style: TextStyle(
                        color: AppColors.ORANG_APP_COLOR,
                        fontSize: 17.sp,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "اهلا وسهلا بك / ة",
                    style: TextStyle(
                        color: AppColors.SCAFFOLD_COLOR, fontSize: 14.sp),
                  )
                ]),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(top: 30.h),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        buildCardWidget(
                          duration: 300,
                          onTap: () => Get.toNamed(
                              TeacherAppRoutes.SHOW_STUDENTS,
                              arguments: {'department': controller.department}),
                          context: context,
                          image: 'Studemt.svg',
                          title: 'طلاب الشعبة',
                          supTitle: "عرض الطلاب",
                        ),
                        buildCardWidget(
                            duration: 500,
                            onTap: () => Get.toNamed(
                                    TeacherAppRoutes.CHECK_STUDENTS,
                                    arguments: {
                                      "department": controller.department
                                    }),
                            context: context,
                            image: 'daily.svg',
                            title: 'التفقد اليومي ',
                            supTitle: DateFormat('yyyy-MM-dd')
                                .format(DateTime.now())
                                .toString())
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        buildCardWidget(
                          duration: 700,
                          onTap: () => Get.toNamed(
                              TeacherAppRoutes.HOME_WORK_SCREEN,
                              arguments: {
                                "department": controller.department,
                                "section": controller.section
                              }),
                          context: context,
                          image: 'Homework.svg',
                          title: 'الوظائف ',
                          supTitle: "${controller.department.name}",
                        ),
                        buildCardWidget(
                            duration: 900,
                            onTap: () => Get.toNamed(
                                    GlobalAppRoutes.WEEKLY_PROGRAM,
                                    arguments: {
                                      "departmentId":
                                          controller.department.id.toString()
                                    }),
                            context: context,
                            image: 'weakly.svg',
                            title: 'البرنامج الاسبوعي ',
                            supTitle: 'هذا الاسبوع  ')
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        buildCardWidget(
                            duration: 1100,
                            onTap: () => Get.toNamed(
                                    GlobalAppRoutes.POSTES_SCREEN,
                                    arguments: {
                                      "department": controller.department
                                    }),
                            context: context,
                            image: 'news.svg',
                            title: 'الاخبار'.tr,
                            supTitle: "${controller.department.name}"),
                        buildCardWidget(
                            duration: 1300,
                            onTap: () => Get.toNamed(TeacherAppRoutes.MARKERS,
                                    arguments: {
                                      "department": controller.department,
                                    }),
                            context: context,
                            image: 'results.svg',
                            title: 'العلامات '.tr,
                            supTitle: 'إضافة علامات '.tr)
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        buildCardWidget(
                            duration: 1500,
                            onTap: () => Get.toNamed(
                                    TeacherAppRoutes.EXAMS_SCREEN,
                                    arguments: {
                                      "department": controller.department,
                                      "section": controller.section
                                    }),
                            context: context,
                            image: 'sticky-notes.svg',
                            title: 'الاختبارات',
                            supTitle: "الاختبارات")
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(height: 30.h),
            ),
          ],
        );
      }),
    );
  }

  Widget buildCardWidget({
    required BuildContext context,
    required String image,
    required String title,
    required String supTitle,
    required int duration,
    required void Function()? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        // color: Colors.red,
        height: 140.h,
        width: 160.w,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            SizedBox(
              height: 120.h,
              width: double.maxFinite,
              child: Card(
                shadowColor: AppColors.DARK_COLOR.withOpacity(0.2),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20.sp),
                  ),
                ),
                elevation: 9,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(title,
                          style: const TextStyle(
                              color: Color.fromRGBO(67, 67, 67, 1),
                              fontWeight: FontWeight.bold)),
                      Text(
                        supTitle,
                        style: const TextStyle(
                            color: AppColors.DARK_COLOR, wordSpacing: -1),
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                    ],
                  ),
                ),
              )
                  .animate()
                  .slideY(
                      begin: 0.5,
                      duration: Duration(milliseconds: duration + 100))
                  .fadeIn(),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                padding: EdgeInsets.all(10.sp),
                decoration: BoxDecoration(
                    color: AppColors.PRIMARY_COLOR,
                    borderRadius: BorderRadius.all(Radius.circular(10.sp))),
                height: 65.h,
                width: 60.w,
                child: SvgPicture.asset(
                  "assets/svg/$image",
                  color: Colors.white,
                ),
              ),
            )
                .animate()
                .slideY(
                  begin: 1,
                  duration: Duration(milliseconds: duration),
                )
                .fadeIn(),
          ],
        ),
      ),
    );
  }
}
