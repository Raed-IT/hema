import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lottie/lottie.dart';
import 'package:school/app/global/data/models/student_model.dart';
import 'package:school/app/modules/driver/pages/students_screen/students_controller.dart';
import 'package:school/app/modules/driver/route/routs.dart';
import 'package:school/app/them/app_colors.dart';
import '../../../../global_components/avatar_component.dart';
import '../../data/mina_driver_controller.dart';
import 'componnetns/students_progress.dart';

class DriverStudentsScreen extends GetView<DriverStudentsScreenController> {
  final DriverMainController mainController = Get.find<DriverMainController>();

  DriverStudentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: controller.scrollController,
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            backgroundColor: (mainController.time.value == "pm")
                ? AppColors.PRIMARY_COLOR
                : AppColors.SECONDARY_COLOR,
            pinned: true,
            automaticallyImplyLeading: false,
            toolbarHeight: 110.h,
            expandedHeight: 230.h,
            flexibleSpace: SafeArea(
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      margin: EdgeInsets.only(bottom: 20.h),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Obx(
                                  () =>
                                  Hero(
                                    transitionOnUserGestures: true,
                                    tag: (Get
                                        .find<DriverMainController>()
                                        .time
                                        .value ==
                                        "pm")
                                        ? "evening"
                                        : "morning",
                                    child: AnimatedOpacity(
                                      duration: const Duration(
                                          milliseconds: 100),
                                      opacity: controller.opacity.value,
                                      child: Lottie.asset(Get.arguments['json'],
                                          height: 90.h, width: 150.w),
                                    ),
                                  ),
                            ),
                          ),
                          Padding(
                            padding:
                            EdgeInsets.only(right: 18.0.sp, left: 18.0.sp),
                            child: SizedBox(
                              child: TextField(
                                controller: controller.searchController,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(
                                      top: 10.sp, bottom: 10.sp),
                                  filled: true,
                                  fillColor: Colors.white,
                                  prefixIcon: const Icon(Icons.search_outlined),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(500.sp),
                                  ),
                                  hintText: 'search_students'.tr,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(10.sp),
              child: SizedBox(
                height: 40.h,
                child: Obx(
                      () =>
                      Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () => controller.atDate.value = "now",
                              child: Card(
                                color: controller.atDate.value == "now"
                                    ? AppColors.PRIMARY_COLOR
                                    : AppColors.PRIMARY_COLOR.withOpacity(0.5),
                                child: Center(
                                  child: Text("اليوم"),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () => controller.atDate.value = "tomorrow",
                              child: Card(
                                color: controller.atDate.value == "tomorrow"
                                    ? AppColors.YALLO
                                    : AppColors.YALLO.withOpacity(0.5),
                                child: Center(
                                  child: Text("غدا"),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                ),
              ),
            ),
          ),
          Obx(
                () =>
            (controller.isLoadStudents.value)
                ? const DriverStudentsProgressList()
                : (controller.students.isNotEmpty)
                ? SliverAnimatedList(
              initialItemCount: controller.students.length,
              itemBuilder: (BuildContext context, int index,
                  Animation<double> animation) {
                return ScaleTransition(
                  filterQuality: FilterQuality.high,
                  scale: animation,
                  child: buildCardStudent(
                      context: context,
                      student: controller.students[index]),
                );
              },
            )
                : SliverAnimatedList(
              initialItemCount: 1,
              itemBuilder: (BuildContext context, int index,
                  Animation<double> animation) {
                return ScaleTransition(
                  filterQuality: FilterQuality.high,
                  scale: animation,
                  child: SizedBox(
                    height: 300.h,
                    child: Center(
                      child: Text('no_data'.tr),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  Widget buildCardStudent(
      {required BuildContext context, required StudentModel student}) {
    return InkWell(
      onTap: () {
        print("====>>>${DriverAppRoutes.SHOW_STUDENT_SCREEN}");
        Get.toNamed(DriverAppRoutes.SHOW_STUDENT_SCREEN,
            arguments: {"student": student});
      },
      child: Container(
        width: MediaQuery
            .of(context)
            .size
            .width,
        height: 60.h,
        margin: EdgeInsets.only(top: 5.h, right: 20.w, left: 20.w),
        child: SizedBox(
          child: Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(1500.0.sp),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
            Positioned(
            right: Get.locale!.languageCode == "ar" ? 0 : null,
              left: Get.locale!.languageCode == "en" ? 0 : null,
              child: Hero(
                transitionOnUserGestures: true,
                tag: student.id!,
                child: AvatarComponent(
                  bgColor: AppColors.DARK_COLOR,
                  radius: 25.8.h,
                  widget: CircleAvatar(
                    radius: 24.h,
                    backgroundImage: NetworkImage(student.img!),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              SizedBox(
              width: 31.sp,
            ),
            Row(
              children: [
              Text(
              student.fullName!,
            ),
            Text(
                "   (${student.section?.name})",
                style: const TextStyle(color: AppColors.PRIMARY_COLOR),
          ),
          ],
        ),
        Container(
          padding: (Get.locale!.languageCode == "ar")
              ? EdgeInsets.only(left: 20.w)
              : EdgeInsets.only(right: 20.w),
          child: CircleAvatar(
            backgroundColor:
            (student.isAbsent!) ? Colors.green : Colors.red,
            radius: 10.sp,
          ),
        ),
        ],
      ),
      ],
    ),)
    ,
    )
    ,
    )
    ,
    );
  }
}
