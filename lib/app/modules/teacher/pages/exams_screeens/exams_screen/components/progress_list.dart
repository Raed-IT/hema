import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../../them/app_colors.dart';


class ProgressListExamsComponent extends StatelessWidget {
  ProgressListExamsComponent({Key? key}) : super(key: key);
  final Duration _period = const Duration(seconds: 3);
  final Random _random = Random();

  @override
  Widget build(BuildContext context) {
    return SliverAnimatedList(
        initialItemCount: 50,
        itemBuilder: (context, index, animation) {
          return SlideTransition(
              position: Tween<Offset>(
                begin: Offset(0.5, 0.5),
                end: Offset.zero,
              ).animate(animation),
              child: buildCardList());
        });
  }

  Widget buildCardList() {
    return Card(
        elevation: 5,
        shadowColor: AppColors.elevation_color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10.sp),
          ),
        ),
        margin: EdgeInsets.all(10.w),
        child: Padding(
          padding: EdgeInsets.all(8.w),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    height: 75.h,
                    padding: EdgeInsets.only(bottom: 5.h),
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    width: 70.w,
                    child: Shimmer.fromColors(
                      // direction: ShimmerDirection.btt,
                      period: _period,
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
                  SizedBox(
                    width: 10.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 25.h,
                        padding: EdgeInsets.only(bottom: 5.h),
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        width: double.parse(
                                (_random.nextInt(150.w.toInt()) + 50)
                                    .toString())
                            .w,
                        child: Shimmer.fromColors(
                          // direction: ShimmerDirection.btt,
                          period: _period,
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
                      Container(
                        height: 25.h,
                        padding: EdgeInsets.only(bottom: 5.h),
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        width: double.parse(
                            (_random.nextInt(150.w.toInt()) + 50).toString()),
                        child: Shimmer.fromColors(
                          // direction: ShimmerDirection.btt,
                          period: _period,
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
                    ],
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.all(10.w),
                height: 200.h,
                padding: EdgeInsets.only(bottom: 5.h),
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                width: double.maxFinite,
                child: Shimmer.fromColors(
                  // direction: ShimmerDirection.btt,
                  period: _period,
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 25.h,
                    padding: EdgeInsets.only(bottom: 5.h),
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    width: double.parse(
                            (_random.nextInt(150.w.toInt()) + 150).toString())
                        .w,
                    child: Shimmer.fromColors(
                      // direction: ShimmerDirection.btt,
                      period: _period,
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
                  Container(
                    height: 25.h,
                    padding: EdgeInsets.only(bottom: 5.h),
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    width: double.parse(
                        (_random.nextInt(150.w.toInt()) + 150).toString()),
                    child: Shimmer.fromColors(
                      // direction: ShimmerDirection.btt,
                      period: _period,
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
                  Container(
                    height: 25.h,
                    padding: EdgeInsets.only(bottom: 5.h),
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    width: double.parse(
                        (_random.nextInt(150.w.toInt()) + 150).toString()),
                    child: Shimmer.fromColors(
                      // direction: ShimmerDirection.btt,
                      period: _period,
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
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 40.h,
                    padding: EdgeInsets.only(bottom: 5.h),
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    width: 100.w,
                    child: Shimmer.fromColors(
                      // direction: ShimmerDirection.btt,
                      period: _period,
                      baseColor: AppColors.BASEShIMMER_COLOR,
                      highlightColor: AppColors.HIGHLIGHT_SHIMMER_COLOR,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(20.sp),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 40.h,
                    padding: EdgeInsets.only(bottom: 5.h),
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    width: 100.w,
                    child: Shimmer.fromColors(
                      // direction: ShimmerDirection.btt,
                      period: _period,
                      baseColor: AppColors.BASEShIMMER_COLOR,
                      highlightColor: AppColors.HIGHLIGHT_SHIMMER_COLOR,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(20.sp),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
