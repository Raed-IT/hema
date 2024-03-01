import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../../../them/app_colors.dart';
import '../update_note_controller.dart';
 class DropdownStatusUpdateNote extends GetView<TeacherUpdateNoteController> {
  const DropdownStatusUpdateNote({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Expanded(
        child: DottedBorder(
          padding: EdgeInsets.only(right: 10.w, left: 10.w),
          radius: Radius.circular(50.sp),
          strokeWidth: (controller.validateStatusNote.value) ? 2.sp : 1.sp,
          color: (controller.validateStatusNote.value)
              ? Colors.red
              : AppColors.DARK_COLOR.withOpacity(.7),
          dashPattern: const [3, 4],
          borderType: BorderType.RRect,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(50.sp)),
            ),
            height: 30.h,
            child: DropdownButton(
              icon: SizedBox(
                height: 20.h,
                child: SvgPicture.asset(
                  'assets/svg/sticky-notes.svg',
                  color: AppColors.PRIMARY_COLOR,
                ),
              ),
              value: controller.selectedStatusNote.value,
              underline: Container(),
              elevation: 0,
              alignment: Alignment.center,
              isExpanded: true,
              hint: Text(
                "حالة الملاحظة".tr,
              ),
              onChanged: (newValue) {
                print(newValue);
              },
              iconDisabledColor: AppColors.PRIMARY_COLOR,
              iconEnabledColor: AppColors.SECONDARY_COLOR,
              items: controller.status.map((status) {
                return DropdownMenuItem(
                  onTap: () {
                    controller.selectedStatusNote(status);
                  },
                  value: status,
                  child: Text(
                    "${(Get.locale!.languageCode == 'ar' ? status.labelAr : status.labelEn)}",
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
