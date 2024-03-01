import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:school/app/them/app_colors.dart';
 import 'package:shimmer/shimmer.dart';

class DriverStudentsProgressList extends StatelessWidget {
  const DriverStudentsProgressList({Key? key}) : super(key: key);
  final Duration _period = const Duration(seconds:3 );

  @override
  Widget build(BuildContext context) {
    return  SliverAnimatedList
      (
      initialItemCount: 50,
      itemBuilder:
          (BuildContext context, int index, Animation<double> animation) {
        return ScaleTransition(
          filterQuality: FilterQuality.high,
          scale: animation,
          child: buildCardProgressStudent(context: context),
          // child: buildCardProgressStudent(context: context),
          // child: buildCardStudent(context: context),
        );
      },
    );
  }
  Widget buildCardProgressStudent({required BuildContext context}) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 60.h,
        margin: EdgeInsets.only(top: 5.h, right: 20.w, left: 20.w),
        child: SizedBox(
          child: Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(1500.0.sp),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  right: Get.locale!.languageCode == "ar" ? 0 : null,
                  left: Get.locale!.languageCode == "en" ? 0 : null,
                  child: Shimmer.fromColors(
                    period: _period,
                    baseColor:AppColors.BASEShIMMER_COLOR,
                    highlightColor: AppColors.HIGHLIGHT_SHIMMER_COLOR,
                    child: Container(
                      height: 55.h,
                      width: 55.h,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(500.sp)),),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 31.sp,
                    ),
                    SizedBox(
                      width: 150.w,
                      height: 20.h,
                      child:  Shimmer.fromColors(
                        period: _period,
                        baseColor:AppColors.BASEShIMMER_COLOR,
                        highlightColor: AppColors.HIGHLIGHT_SHIMMER_COLOR,
                        child: Container(
                          height: 55.h,
                          width: 55.h,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(500.sp)),),
                        ),
                      ),
                    ),
                    Container(
                      padding: (Get.locale!.languageCode == "ar")
                          ? EdgeInsets.only(left: 20.w)
                          : EdgeInsets.only(right: 20.w),
                      child:SizedBox(
                        height: 20.sp,
                        width: 20.sp,
                        child:  Shimmer.fromColors(
                          period: _period,
                          baseColor:AppColors.BASEShIMMER_COLOR,
                          highlightColor: AppColors.HIGHLIGHT_SHIMMER_COLOR,
                          child: Container(
                            height: 55.h,
                            width: 55.h,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(500.sp)),),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}
