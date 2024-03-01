import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
 import 'package:shimmer/shimmer.dart';

import '../../../../global_components/lists_components/animation_sliver_list_component.dart';
import '../../../../them/app_colors.dart';


class ListProgressNotification extends StatelessWidget {
  ListProgressNotification({Key? key}) : super(key: key);
  Random _random = Random();

  @override
  Widget build(BuildContext context) {
    return AnimationSliverList(
      length: 50,
      builder: (context, index, animation) {
        return buildCard();
      },
    );
  }

  Widget buildCard() {
    return SizedBox(
      child: Card(
        elevation: 7,
        shadowColor: AppColors.elevation_card_color,
        margin: EdgeInsets.all(10.w),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10.sp),
          ),
        ),
        child: Column(
          children: [
            Opacity(
              opacity: .6,
              child: Container(
                padding: EdgeInsets.only(right: 10.w, left: 10.w),
                height: 30.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10.sp)),
                  gradient: const LinearGradient(
                    colors: AppColors.MAIN_GRADIENT_COLOR,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 7.sp,
                          backgroundColor: Colors.white38,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                              top: 5.h, bottom: 5.h, right: 5.w, left: 6.w),
                          height: 13.h,
                          width: 80.w,
                          child: Shimmer.fromColors(
                            // direction: ShimmerDirection.btt,
                            period: Duration(seconds: 3),
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
              ),
            ),
            SizedBox(
              height: 9.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          top: 5.h, bottom: 5.h, right: 5.w, left: 6.w),
                      height: 13.h,
                      width: double.parse(
                              (_random.nextInt(int.parse(200.toString())) + 110)
                                  .toString())
                          .w,
                      child: Shimmer.fromColors(
                        // direction: ShimmerDirection.btt,
                        period: const Duration(seconds: 3),
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
                    Container(
                      margin: EdgeInsets.only(
                          top: 5.h, bottom: 5.h, right: 5.w, left: 6.w),
                      height: 13.h,
                      width: double.parse(
                              (_random.nextInt(int.parse(200.toString())) + 110)
                                  .toString())
                          .w,
                      child: Shimmer.fromColors(
                        // direction: ShimmerDirection.btt,
                        period: const Duration(seconds: 3),
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
                    Container(
                      margin: EdgeInsets.only(
                          top: 5.h, bottom: 5.h, right: 5.w, left: 6.w),
                      height: 13.h,
                      width: double.parse(
                              (_random.nextInt(int.parse(200.toString())) + 110)
                                  .toString())
                          .w,
                      child: Shimmer.fromColors(
                        // direction: ShimmerDirection.btt,
                        period: const Duration(seconds: 3),
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
                ),
              ],
            ),
            SizedBox(
              height: 9.h,
            ),
          ],
        ),
      ),
    );
  }
}
