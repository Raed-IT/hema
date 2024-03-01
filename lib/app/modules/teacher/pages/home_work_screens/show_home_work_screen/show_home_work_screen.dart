import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:helper_plugin/ui/images/componentes/privew_image.dart';
import 'package:school/app/global_components/drawer_component.dart';
import 'package:school/app/modules/teacher/pages/home_work_screens/show_home_work_screen/show_home_work_controller.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../global_components/appbar_components/main_appbar.dart';
import '../../../../../them/app_colors.dart';

class TeacherShowHomeWorkScreen extends GetView<TeacherShowHomeWorkController> {
  final Duration _period = const Duration(seconds: 3);

  const TeacherShowHomeWorkScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerComponent(),
      body: Builder(builder: (context) {
        return CustomScrollView(
          controller: controller.scrollController,
          physics: const BouncingScrollPhysics(),
          slivers: [
            MainAnimatedAppBarComponent(
              svgUrl: "assets/svg/Homework.svg",
              openDrawer: (_) {
                Scaffold.of(context).openDrawer();
              },
              scrollController: controller.scrollController,
              supWidgets: [
                Text(
                  "عرض الوظيفة",
                  style: TextStyle(
                      color: AppColors.ORANG_APP_COLOR,
                      fontWeight: FontWeight.bold,
                      fontSize: 22.sp),
                ),
              ],
            ),
            SliverToBoxAdapter(
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.sp),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(10.w),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.all(14.sp),
                                width: 60.w,
                                height: 60.h,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10.sp)),
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
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    controller.workHome.title!,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.sp),
                                  ),
                                  Text(
                                      " ${'material'.tr} : ${controller.workHome.subject!}"),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  Container(
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
                                            "${controller.workHome.endDate}",
                                            style: TextStyle(
                                                fontFamily: "",
                                                fontSize: 10.sp),
                                          )
                                        ],
                                      )),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    if (controller.workHome.images.isNotEmpty)
                      Container(
                        margin: EdgeInsets.all(10.w),
                        child: GestureDetector(
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10.sp),
                              ),
                            ),
                            elevation: 3,
                            child: Stack(
                              children: [
                                Container(
                                  height: 170.h,
                                  width: double.maxFinite,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10.sp),
                                    ),
                                  ),
                                  child: Shimmer.fromColors(
                                    // direction: ShimmerDirection.btt,
                                    period: _period,
                                    baseColor: AppColors.BASEShIMMER_COLOR,
                                    highlightColor:
                                        AppColors.HIGHLIGHT_SHIMMER_COLOR,
                                    child: Container(
                                      // height: 10,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10.sp))),
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
                                          "${controller.workHome.images.length}",
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
                          onTap: () => previewImage(
                              imagesUrls: controller.workHome.images,
                              context: context),
                        ),
                      )
                    else
                      Container(),
                    Padding(
                      padding: EdgeInsets.all(20.0.w),
                      child: Text(controller.workHome.info ?? ''),
                    ),
                  ],
                ),
              ),
            )
          ],
        );
      }),
    );
  }
}
