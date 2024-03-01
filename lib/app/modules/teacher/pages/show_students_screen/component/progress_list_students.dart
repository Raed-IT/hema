import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../them/app_colors.dart';

class ProgressListStudentsComponent extends StatelessWidget {
  ProgressListStudentsComponent({Key? key}) : super(key: key);
  final Duration _period = const Duration(seconds: 3);
  final Random _random = Random();

  @override
  Widget build(BuildContext context) {
    return SliverAnimatedList(
      initialItemCount: 50,
      itemBuilder: (BuildContext context, int index, animation) {
        return SlideTransition(
            position: Tween<Offset>(
              begin: Offset(0.5, 0.5),
              end: Offset.zero,
            ).animate(animation),
            child: buildCardList());
      },
    );
  }

  Widget buildCardList() {
    return Padding(
      padding: EdgeInsets.only(top: 8.0.h, left: 6.w, right: 6.w),
      child: Card(
        elevation: 7,
        shadowColor: AppColors.elevation_color,
        margin: EdgeInsets.only(top: 20.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10.sp),
          ),
        ),
         child: SizedBox(
          height: 170.h,
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        top: 5.h, bottom: 5.h, right: 5.w, left: 6.w),
                    height: 89.h,
                    width: 80.w,
                    child: Shimmer.fromColors(
                      // direction: ShimmerDirection.btt,
                      period: _period,
                      baseColor: AppColors.BASEShIMMER_COLOR,
                      highlightColor: AppColors.HIGHLIGHT_SHIMMER_COLOR,
                      child: Container(
                        // height: 10,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.sp))),
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20.h,
                      ),
                      Container(
                        height: 20.h,
                        decoration: const BoxDecoration(color: Colors.white),
                        width: double.parse(
                            (_random.nextInt(150.w.toInt()) + 70).toString()),
                        child: Shimmer.fromColors(
                          // direction: ShimmerDirection.btt,
                          period: _period,
                          baseColor: AppColors.BASEShIMMER_COLOR,
                          highlightColor: AppColors.HIGHLIGHT_SHIMMER_COLOR,
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.sp))),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Container(
                        height: 20.h,
                        decoration: const BoxDecoration(color: Colors.white),
                        width: double.parse(
                            (_random.nextInt(150.w.toInt()) + 70).toString()),
                        child: Shimmer.fromColors(
                          // direction: ShimmerDirection.btt,
                          period: _period,
                          baseColor: AppColors.BASEShIMMER_COLOR,
                          highlightColor: AppColors.HIGHLIGHT_SHIMMER_COLOR,
                          child: Container(
                            // height: 10,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.sp))),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    color: Colors.white,
                    width: 100.w,
                    height: 40.h,
                    child: Shimmer.fromColors(
                      direction: ShimmerDirection.ltr,
                      period: _period,
                      baseColor: AppColors.BASEShIMMER_COLOR,
                      highlightColor: AppColors.HIGHLIGHT_SHIMMER_COLOR,
                      child: Container(
                        width:
                            double.parse((_random.nextInt(90) + 70).toString())
                                .w,
                        // height: 10,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.all(Radius.circular(500.sp)),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    width: 100.w,
                    height: 40.h,
                    child: Shimmer.fromColors(
                      direction: ShimmerDirection.ltr,
                      period: _period,
                      baseColor: AppColors.BASEShIMMER_COLOR,
                      highlightColor: AppColors.HIGHLIGHT_SHIMMER_COLOR,
                      child: Container(
                        width:
                            double.parse((_random.nextInt(90) + 70).toString())
                                .w,
                        // height: 10,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.all(Radius.circular(500.sp)),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    width: 100.w,
                    height: 40.h,
                    child: Shimmer.fromColors(
                      direction: ShimmerDirection.ltr,
                      period: _period,
                      baseColor: AppColors.BASEShIMMER_COLOR,
                      highlightColor: AppColors.HIGHLIGHT_SHIMMER_COLOR,
                      child: Container(
                        width:
                            double.parse((_random.nextInt(90) + 70).toString())
                                .w,
                        // height: 10,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.all(Radius.circular(500.sp)),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
