import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
 import 'package:shimmer/shimmer.dart';

import '../them/app_colors.dart';

class ButtonGroupProgressComponent extends StatelessWidget {
  ButtonGroupProgressComponent({Key? key}) : super(key: key);
  final Duration _period = const Duration(seconds: 5);
  final Random _random = Random();

  @override
  Widget build(BuildContext context) {

    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemCount: 10,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) => InkWell(
        child: Shimmer.fromColors(
          direction: ShimmerDirection.ltr,
          period: _period,
          baseColor: AppColors.BASEShIMMER_COLOR,
          highlightColor: AppColors.HIGHLIGHT_SHIMMER_COLOR,
          child: Container(
            width: double.parse((_random.nextInt(90) + 70).toString()),
            // height: 10,
            decoration: BoxDecoration(
              color: AppColors.PRIMARY_COLOR,
              borderRadius: BorderRadius.all(Radius.circular(500.sp)),
            ),
          ),
        ),
      ),
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(
          width: 10.w,
        );
      },
    );
  }
}
