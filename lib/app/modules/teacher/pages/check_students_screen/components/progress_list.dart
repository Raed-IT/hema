import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../them/app_colors.dart';

class ProgressCheckStudentsList extends StatelessWidget {
  ProgressCheckStudentsList({Key? key}) : super(key: key);
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
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10.sp),
          ),
        ),
        elevation: 3,
        child: SizedBox(
          height: 90.h,
          child: Stack(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(7.w),
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        width: 80.w,
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
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.only(bottom: 5.h, top: 5.h),
                            decoration: BoxDecoration(
                              color: Colors.white,
                            ),
                            width: double.parse(
                                    (_random.nextInt(100) + 70).toString())
                                .w,
                            height: 30.h,
                            child: Shimmer.fromColors(
                              // direction: ShimmerDirection.btt,
                              period: _period,
                              baseColor: AppColors.BASEShIMMER_COLOR,
                              highlightColor: AppColors.HIGHLIGHT_SHIMMER_COLOR,
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10.sp))),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(bottom: 5.h, top: 5.h),
                            decoration: const BoxDecoration(
                              color: Colors.white,
                            ),
                            width: double.parse(
                                    (_random.nextInt(90) + 70).toString())
                                .w,
                            height: 30.h,
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
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.all(5.h),
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    width:90.w,
                    height: 40.h,
                    child: Shimmer.fromColors(
                      // direction: ShimmerDirection.btt,
                      period: _period,
                      baseColor: AppColors.BASEShIMMER_COLOR,
                      highlightColor: AppColors.HIGHLIGHT_SHIMMER_COLOR,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(100.sp))),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
