import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../them/app_colors.dart';
import '../weekly_program_controlleer.dart';

class ButtonGroupDayComponent extends StatelessWidget {
  const ButtonGroupDayComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WeeklyProgramController>(builder: (controller) {
      return ListView.separated(
        itemCount: controller.days.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => InkWell(
          child: FilterChip(
            padding:
                EdgeInsets.only(left: 30.w, right: 30.w, bottom: 0.h, top: 0.h),
            labelStyle: const TextStyle(color: Colors.white),
            selectedShadowColor: AppColors.DARK_COLOR,
            checkmarkColor: AppColors.SECONDARY_COLOR,
            backgroundColor: AppColors.PRIMARY_COLOR.withOpacity(.6),
            selectedColor: AppColors.PRIMARY_COLOR,
            selected: controller.selectedDay.value == index ? true : false,
            label: Text(
                "${(Get.locale!.languageCode == "ar") ? controller.days[index].labelAr : controller.days[index].labelEn}"),
            elevation: 5,
            onSelected: (value) {
              controller.selectedDaySetter = index;
            },
          ),
        ),
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(
            width: 10.w,
          );
        },
      );
    });
  }
}
