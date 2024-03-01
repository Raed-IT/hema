import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../them/app_colors.dart';
import '../report_controller.dart';


class ProgressReports extends GetView<ReportController>{
  const ProgressReports({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SliverToBoxAdapter(
      child: Container(
        height: MediaQuery.of(context).size.height / 2,
        margin: EdgeInsets.all(10.w),
        width: MediaQuery.of(context).size.width,
        child: Shimmer.fromColors(
          // direction: ShimmerDirection.btt,
          period: const Duration(seconds: 3),
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
    );
  }

}