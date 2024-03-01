import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school/app/them/app_colors.dart';
import 'package:shimmer/shimmer.dart';
class ParentProgressStudentList extends StatelessWidget {
  const ParentProgressStudentList({Key? key}) : super(key: key);
  final Duration _period = const Duration(seconds: 3);

  @override
  Widget build(BuildContext context) {
    return SliverAnimatedList(
      initialItemCount: 20,
      itemBuilder: (context, index, animation) {
        return Container(
          width: double.maxFinite,
          margin: EdgeInsets.only(right: 10.w, left: 10.w),
          height: 110.h,
          child: Card(
            shadowColor: AppColors.elevation_card_color,
            elevation: 15,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15.sp))),
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                              top: 5.h, bottom: 5.h, right: 5.w, left: 6.w),
                          height: 19.h,
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
                        Container(
                          margin: EdgeInsets.only(
                              top: 5.h, bottom: 5.h, right: 5.w, left: 6.w),
                          height: 19.h,
                          width: 180.w,
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
              ],
            ),
          ),
        );
      },
    );
  }
}
