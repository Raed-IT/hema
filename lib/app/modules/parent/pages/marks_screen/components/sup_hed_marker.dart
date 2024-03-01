import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../them/app_colors.dart';
import '../marks_controller.dart';

class ParentSupHeadMarke extends GetView<ParentMarkersController> {
  const ParentSupHeadMarke({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.all(18.0.sp),
        child: Column(
          children: [
            Row(
              children: [
                controller.buildDropDownSubject(),
              ],
            ),
            Divider(
              height: 30.h,
              thickness: 1.2.sp,
            ),
            Row(
              children: [
                Text(
                  "${'evaluation_subject'.tr} : ",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                )
                    .animate()
                    .slideY(
                  begin: 1,
                  duration: const Duration(milliseconds: 700),
                )
                    .fadeIn(),
                SizedBox(
                  width: 20.w,
                ),
                Icon(
                  Icons.star,
                  color: Colors.amber,
                  size: 20.sp,
                )
                    .animate()
                    .slideX(begin: -1.5, duration: Duration(seconds: 1))
                    .fadeIn(),
                SizedBox(
                  width: 10.w,
                ),
                Obx(
                      () => Text(
                    controller.avg.value,
                    style: TextStyle(fontFamily: "", fontSize: 12.sp),
                  ),
                )
                    .animate()
                    .slideX(begin: -1.5, duration: Duration(seconds: 1))
                    .fadeIn(),
              ],
            ),
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
                          backgroundColor: Colors.orange,
                        ).animate().flip(duration: Duration(seconds: 1)),
                        SizedBox(
                          width: 10.w,
                        ),
                        Text('متوسط'.tr)
                            .animate()
                            .slideX(begin: -2, duration: Duration(seconds: 1)),
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