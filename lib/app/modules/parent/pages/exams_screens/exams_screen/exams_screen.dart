import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:school/app/global/data/models/exam_model.dart';
import 'package:school/app/global_components/appbar_components/main_appbar.dart';
import 'package:school/app/global_components/drawer_component.dart';
import 'package:we_slide/we_slide.dart';
import '../../../../../global_components/lists_components/animation_sliver_list_component.dart';
import '../../../../../global_components/lists_components/no_data_component.dart';
import '../../../../../them/app_colors.dart';
import 'components/list_progress_markers.dart';
import 'exams_controller.dart';

class ParentExamsScreen extends GetView<ParentExamsController> {
  ParentExamsScreen({Key? key}) : super(key: key);
  final ScrollController _scrollController = ScrollController();
  EdgeInsets padding =
      EdgeInsets.only(right: 10.w, left: 10.w, top: 5.h, bottom: 5.h);
  EdgeInsets margin = EdgeInsets.all(5.sp);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerComponent(),
      backgroundColor: Colors.black,
      body: Builder(
        builder: (context) => WeSlide(
          blur: true,
          blurSigma: 10,
          panelMinSize: 0,
          parallax: true,
          panelMaxSize: 500,
          backgroundColor: AppColors.SCAFFOLD_COLOR,
          footerController: controller.weSlideController,
          controller: controller.weSlideController,
          body: CustomScrollView(
            controller: _scrollController,
            physics: const BouncingScrollPhysics(),
            slivers: [
              MainAnimatedAppBarComponent(
                  herTag: "exams_tag",
                  svgUrl: "assets/svg/Calender.svg",
                  openDrawer: (conte) {
                    Scaffold.of(conte).openDrawer();
                  },
                  scrollController: _scrollController,
                  supWidgets: [
                    Text(""),
                    Text(
                      "الامتحانات",
                      style: TextStyle(
                          color: AppColors.ORANG_APP_COLOR,
                          fontWeight: FontWeight.bold,
                          fontSize: 25.sp),
                    ),
                  ]),
              Obx(
                () => (controller.isLoad.value)
                    ? const ListProgressExams()
                    : (controller.exams.isNotEmpty)
                        ? AnimationSliverList(
                            length: controller.exams.length,
                            builder: (context, index, animation) {
                              return buildCard(exam: controller.exams[index]);
                            },
                          )
                        : NoDataSliverComponent(
                            onTap: () => controller.getData(),
                          ),
              ),
            ],
          ),
          panel: SizedBox(
            width: Get.width,
            child: Card(
              color: AppColors.SCAFFOLD_COLOR,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10.sp),
                  topLeft: Radius.circular(10.sp),
                ),
              ),
              child: Obx(
                () => SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Container(
                    padding: EdgeInsets.all(10.sp),
                    child: Column(
                      children: [
                        Text(
                          "${controller.exam.value?.title} ",
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Container(
                            width: Get.width,
                            child: Row(children: [
                              Container(
                                margin: margin,
                                padding: padding,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20.sp),
                                  ),
                                  color:
                                      AppColors.PRIMARY_COLOR.withOpacity(0.2),
                                ),
                                child: Text(
                                  "${controller.exam.value?.section}",
                                  style: const TextStyle(
                                      color: AppColors.PRIMARY_COLOR,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                                  .animate(
                                    adapter: ValueNotifierAdapter(
                                        controller.notifier,
                                        animated: true),
                                  )
                                  .slideX(
                                      duration:
                                          const Duration(milliseconds: 500)),
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(20.sp),
                                    ),
                                    color: AppColors.ORANG_APP_COLOR
                                        .withOpacity(0.2)),
                                margin: margin,
                                padding: padding,
                                child: Text(
                                  "${controller.exam.value?.department}",
                                  style: const TextStyle(
                                      color: AppColors.ORANG_APP_COLOR,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                                  .animate(
                                    adapter: ValueNotifierAdapter(
                                        controller.notifier,
                                        animated: true),
                                  )
                                  .slideX(
                                    duration: Duration(milliseconds: 800),
                                  )
                            ])),
                        Padding(
                          padding: EdgeInsets.all(10.sp),
                          child: SizedBox(
                              width: Get.width,
                              child: Text(
                                "${controller.exam.value?.info}",
                                textAlign: TextAlign.right,
                              )),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildCard({required ExamModel exam}) {
    return GestureDetector(
      onTap: () {
        controller.exam.value = exam;
        controller.weSlideController.show();
      },
      child: SizedBox(
        height: 95.h,
        child: Card(
          margin: EdgeInsets.only(top: 10.h, right: 10.w, left: 10.w),
          elevation: 7,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10.sp),
            ),
          ),
          shadowColor: AppColors.elevation_card_color,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(right: 10.w, left: 10.w),
                height: 30.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.sp),
                  ),
                  gradient: const LinearGradient(
                    colors: AppColors.MAIN_GRADIENT_COLOR,
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${"day".tr} : ${exam.startDate} ',
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        Text(
                          '8.45 - 8.00',
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Icon(
                          Icons.access_time_filled_rounded,
                          size: 15.sp,
                          color: AppColors.SECONDARY_COLOR,
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 10.w,
                  right: 10.w,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 50.h,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/svg/Book.svg',
                            height: 25.h,
                            color: AppColors.SECONDARY_COLOR,
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Text(" ${exam.subject?.name} ")
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 50.h,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/svg/weakly.svg',
                            height: 25.h,
                            color: AppColors.SECONDARY_COLOR,
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Text(" ${exam.startDate}")
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
