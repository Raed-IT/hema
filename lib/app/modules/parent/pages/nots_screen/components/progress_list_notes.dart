import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
 import 'package:shimmer/shimmer.dart';

import '../../../../../them/app_colors.dart';

class ParentProgressNotesList extends StatelessWidget {
  ParentProgressNotesList({Key? key}) : super(key: key);
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
        shadowColor: AppColors.elevation_card_color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10.sp),
          ),
        ),
        elevation: 5,
        child: SizedBox(
          height: 140.h,
          child: Stack(
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 10.w,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20.h,
                        ),
                        Container(
                          height: 25.h,
                          padding: EdgeInsets.only(bottom: 5.h),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border(
                              bottom: BorderSide(
                                width: 1,
                                color: AppColors.DARK_COLOR.withOpacity(.5),
                              ),
                            ),
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
                              (_random.nextInt(150.w.toInt()) + 200).toString()),
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
                              (_random.nextInt(150.w.toInt()) + 200).toString()),
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
                    ),
                  )
                ],
              ),
              Align(
                alignment: (Get.locale!.languageCode == "ar")
                    ? Alignment.topLeft
                    : Alignment.topRight,
                child: Container(
                  height: 40.h,
                  width: 60.h,
                  decoration: BoxDecoration(
                    color: AppColors.PRIMARY_COLOR,
                    borderRadius: (Get.locale!.languageCode == "ar")
                        ? BorderRadius.only(
                            topLeft: Radius.circular(15.sp),
                            bottomRight: Radius.circular(15.sp),
                          )
                        : BorderRadius.only(
                            topRight: Radius.circular(15.sp),
                            bottomLeft: Radius.circular(15.sp),
                          ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
