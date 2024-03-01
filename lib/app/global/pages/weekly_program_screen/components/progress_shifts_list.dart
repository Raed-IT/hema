import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
 import 'package:shimmer/shimmer.dart';

import '../../../../them/app_colors.dart';


class ProgressShiftsComponent extends StatelessWidget {
  ProgressShiftsComponent({Key? key}) : super(key: key);
  final Duration _period = const Duration(seconds: 3);
  final Random _random = Random();

  @override
  Widget build(BuildContext context) {
    return SliverAnimatedList(
      initialItemCount: 50,
      itemBuilder: (BuildContext context, int index, animation) {
        return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0.5, 0.5),
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
        margin: EdgeInsets.only(top: 20.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10.sp),
          ),
        ),
        elevation: 4,
        child: SizedBox(
          height: 110.h,
          child: Column(
            children: [
              Container(
                height: 30.h,
                decoration: BoxDecoration(
                  color: AppColors.PRIMARY_COLOR,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.sp),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(13.0.sp),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(
                            top: 5.h, bottom: 5.h, right: 5.w, left: 6.w),
                        height: 29.h,
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
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(
                            top: 5.h, bottom: 5.h, right: 5.w, left: 6.w),
                        height: 29.h,
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
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(
                            top: 5.h, bottom: 5.h, right: 5.w, left: 6.w),
                        height: 29.h,
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
