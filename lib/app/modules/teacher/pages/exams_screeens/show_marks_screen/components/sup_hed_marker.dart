import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../../them/app_colors.dart';
import '../marks_controller.dart';

class TeacherSupHeadMark extends GetView<TeacherMarkersController> {
  const TeacherSupHeadMark({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.all(18.0.sp),
        child: Column(
          children: [
            SizedBox(
              height: 20.h,
            ),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: AppColors.DARK_COLOR.withOpacity(.2),
                  ),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: (Get.locale!.languageCode == 'ar')
                          ? MainAxisAlignment.start
                          : MainAxisAlignment.end,
                      children: [
                        SizedBox(
                          height: 20.h,
                        ),
                        CircleAvatar(
                          radius: 7.sp,
                          backgroundColor: Colors.green,
                        ).animate().flip(duration: Duration(seconds: 1)),
                        SizedBox(
                          width: 10.w,
                        ),
                        Text('excellent'.tr)
                            .animate()
                            .slideX(
                                begin: -1,
                                duration: Duration(milliseconds: 700))
                            .fadeIn(),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: (Get.locale!.languageCode == 'ar')
                          ? MainAxisAlignment.end
                          : MainAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 7.sp,
                          backgroundColor: Colors.red,
                        ).animate().flip(duration: Duration(seconds: 1)),
                        SizedBox(
                          width: 10.w,
                        ),
                        Text('bad'.tr)
                            .animate()
                            .slideX(begin: -2, duration: Duration(seconds: 1)),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
