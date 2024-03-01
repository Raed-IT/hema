import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../them/app_colors.dart';
import '../notes_controller.dart';

class ParentButtonStatusComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ParentNotesController>(
        init: ParentNotesController(),
        builder: (controller) {
          return ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemCount: controller.status.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => InkWell(
              child: FilterChip(
                padding: EdgeInsets.only(
                    left: 10.w, right: 10.w, bottom: 0.h, top: 0.h),
                labelStyle: const TextStyle(color: Colors.white),
                selectedShadowColor: AppColors.DARK_COLOR.withOpacity(.4),
                checkmarkColor: (index == 1)
                    ? AppColors.PRIMARY_COLOR
                    : AppColors.SECONDARY_COLOR,
                backgroundColor: (index == 1)
                    ? AppColors.SECONDARY_COLOR.withOpacity(.6)
                    : AppColors.PRIMARY_COLOR.withOpacity(.6),
                selectedColor: (index == 1)
                    ? AppColors.SECONDARY_COLOR
                    : AppColors.PRIMARY_COLOR,
                selected:
                    controller.selectedStatus.value == index ? true : false,
                label: Text(
                    "${(Get.locale!.languageCode == "ar") ? controller.status[index].labelAr : controller.status[index].labelEn}"),
                elevation: 5,
                shadowColor: AppColors.elevation_card_color,
                onSelected: (value) {
                  if (!controller.isLoadPagination.value) {
                    controller.selectedStatusSetter = index;
                  }
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
