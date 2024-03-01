import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:school/app/global_components/appbar_components/main_appbar.dart';
import 'package:school/app/global_components/drawer_component.dart';
import 'package:school/app/global_components/refresh_load_component.dart';
import '../../../global_components/button_group_progress_component.dart';
import '../../../global_components/lists_components/animation_sliver_list_component.dart';
import '../../../global_components/lists_components/no_data_component.dart';
import '../../../them/app_colors.dart';
import '../../data/models/shift_model.dart';
import 'components/group_button.dart';
import 'components/progress_shifts_list.dart';
import 'weekly_program_controlleer.dart';
import 'package:intl/intl.dart';

class WeeklyProgramScreen extends GetView<WeeklyProgramController> {
  WeeklyProgramScreen({super.key});

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        drawer: const DrawerComponent(),
        body: Builder(builder: (context) {
          return RefreshLoadComponent(
            onRefresh: () async {
              controller.getData();
            },
            scrollController: _scrollController,
            widgets: [
              MainAnimatedAppBarComponent(
                  herTag: "weakly-program",
                  openDrawer: (conte) {
                    Scaffold.of(context).openDrawer();
                  },
                  svgUrl: "assets/svg/weakly.svg",
                  scrollController: _scrollController,
                  supWidgets: [
                    Text(""),
                    Text(
                      "البرنامج الاسبوعي ",
                      style: TextStyle(
                          color: AppColors.ORANG_APP_COLOR,
                          fontWeight: FontWeight.bold,
                          fontSize: 25.sp),
                    )
                  ]),
              SliverToBoxAdapter(
                child: Obx(
                  () {
                    return SizedBox(
                      height: 70.h,
                      child: Center(
                        child: (controller.isLoad.value)
                            ? Container(
                                padding:
                                    EdgeInsets.only(top: 19.h, bottom: 10.h),
                                child: ButtonGroupProgressComponent(),
                              )
                            : const ButtonGroupDayComponent(),
                      ),
                    );
                  },
                ),
              ),
              SliverToBoxAdapter(
                child: Divider(
                  thickness: 1.2.sp,
                  endIndent: 30.w,
                  indent: 30.w,
                ),
              ),
              Obx(
                () => (controller.isLoad.value)
                    ? ProgressShiftsComponent()
                    : (controller.shiftsByDay.isNotEmpty)
                        ? AnimationSliverList(
                            length: controller.shiftsByDay.length,
                            builder: (context, index, animation) {
                              return FadeTransition(
                                alwaysIncludeSemantics: true,
                                opacity: Tween<double>(
                                  begin: 0,
                                  end: 1,
                                ).animate(animation),
                                child: SlideTransition(
                                  position: Tween<Offset>(
                                    begin: Offset(0, .7),
                                    end: Offset.zero,
                                  ).animate(animation),
                                  child: buildCardList(
                                    context: context,
                                    model: controller.shiftsByDay[index],
                                  ),
                                ),
                              );
                            },
                          )
                        : NoDataSliverComponent(
                            onTap: () => controller.getData(),
                          ),
              )
            ],
          );
        }));
  }

  Widget buildCardList(
      {required BuildContext context, required ShiftModel model}) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10.sp),
        ),
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(right: 10.w, left: 10.w),
            height: 30.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10.sp)),
                color: AppColors.PRIMARY_COLOR),
            child: Row(
              children: [
                SvgPicture.asset(
                  "assets/svg/Class_icon.svg",
                  width: 20.w,
                  height: 20.h,
                  color: AppColors.SECONDARY_COLOR,
                ),
                SizedBox(
                  width: 10.w,
                ),
                Text(
                  model.section?.name ?? "",
                  style: TextStyle(
                    fontSize: 15.sp,
                    color: AppColors.SCAFFOLD_COLOR,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
                Row(
                  children: [
                    Text(
                      "${model.start}",
                      style: TextStyle(
                          fontFamily: "",
                          fontSize: 12.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    const Icon(
                      Icons.access_time_filled_rounded,
                      color: AppColors.SECONDARY_COLOR,
                    )
                  ],
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 10.w),
            height: 70.h,
            child: Row(
              children: [
                SizedBox(
                  width: 10.w,
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        "assets/svg/Door.svg",
                        width: 20.w,
                        height: 20.h,
                        color: AppColors.SECONDARY_COLOR,
                      ),
                      SizedBox(width: 10.w),
                      SizedBox(
                        width: 80.w,
                        child: AutoSizeText(
                          '${"department".tr} : ${model.department?.name ?? ''}  ',
                          maxLines: 1,
                          style: TextStyle(fontSize: 12.sp),
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      "assets/svg/Book.svg",
                      width: 20.w,
                      height: 20.h,
                      color: AppColors.SECONDARY_COLOR,
                    ),
                    SizedBox(width: 10.w),
                    AutoSizeText(
                      '${"material".tr} : ${model.subject?.name ?? ''}',
                      style: TextStyle(fontSize: 12.sp),
                    )
                  ],
                ),
                SizedBox(
                  width: 10.w,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
