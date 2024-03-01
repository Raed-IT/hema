import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:helper_plugin/ui/images/componentes/privew_image.dart';
import 'package:helper_plugin/utilitis/media_model.dart';
import 'package:school/app/global_components/appbar_components/main_appbar.dart';
import 'package:school/app/modules/teacher/pages/home_work_screens/show_works_completed_screen/show_works_completed_controller.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../global/data/models/home_work_completed_model.dart';
import '../../../../../global_components/lists_components/animation_sliver_list_component.dart';
import '../../../../../global_components/lists_components/no_data_component.dart';
import '../../../../../them/app_colors.dart';
import '../home_work_screen/components/list_progress.dart';

class TeacherShowWorksCompletedScreen
    extends GetView<TeacherShowWorksCompletedController> {
  const TeacherShowWorksCompletedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return controller.buildScreen(
      appBar: MainAnimatedAppBarComponent(
          svgUrl: "assets/svg/results.svg",
          openDrawer: (c) {
            Scaffold.of(c).openDrawer();
          },
          scrollController: controller.scrollController !,
          supWidgets: [
            Text(
              "الوظائف",
              style: TextStyle(
                  fontSize: 17.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.ORANG_APP_COLOR),
            ),
          ]),
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
                                workHome: Rx(controller.paginationData[index])),
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
    );
  }

  Widget buildWorkHomeCard(
      {required BuildContext context,
      required Rx<AnswerHomeWorkModel> workHome}) {
    return Card(
      elevation: 7,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10.sp),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(18.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Wrap(
              children: [
                Text(
                  "الطالب : ",
                  style: TextStyle(
                      color: AppColors.PRIMARY_COLOR,
                      fontWeight: FontWeight.bold,
                      fontSize: 17.sp),
                ),
                Text(
                  "${workHome.value.studentName} ",
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Obx(
              () => (workHome.value.images!.isNotEmpty)
                  ? Card(
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
                              imagesUrls: workHome.value.images!
                                  .map((img) => MediaModel(img, 1))
                                  .toList(),
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
                                      image: NetworkImage(
                                          workHome.value.images![0]),
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
                                          "${workHome.value.images!.length}",
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
              height: 10.h,
            ),
            Text(
              "الوظيفة كتابة",
              style: TextStyle(
                  color: AppColors.PRIMARY_COLOR,
                  fontWeight: FontWeight.bold,
                  fontSize: 17.sp),
            ),
            Text(
              '${workHome.value.answer ?? ""} ',
              style: TextStyle(fontSize: 15.sp),
            ),
          ],
        ),
      ),
    );
  }
}
