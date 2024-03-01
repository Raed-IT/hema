import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../../global_components/lists_components/animation_sliver_list_component.dart';
import '../../../../../../them/app_colors.dart';


class TeacherListProgressMarks extends StatelessWidget {
  const TeacherListProgressMarks({Key? key}) : super(key: key);

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
      height: 90.h,
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
            Container(
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
                      SvgPicture.asset(
                        'assets/svg/Book.svg',
                        height: 25.h,
                        color: Colors.white,
                      ),
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
            Padding(
              padding: EdgeInsets.only(right: 10.0.w, left: 10.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/svg/results.svg',
                        height: 20.h,
                        color: AppColors.SECONDARY_COLOR,
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
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
                  ),
                  Container(
                    height: 40.h,
                    decoration: BoxDecoration(
                        border: Border(
                            left: BorderSide(
                                color: AppColors.DARK_COLOR.withOpacity(.3)))),
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/svg/results.svg',
                        height: 20.h,
                        color: AppColors.SECONDARY_COLOR,
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
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
          ],
        ),
      ),
    );
  }
}