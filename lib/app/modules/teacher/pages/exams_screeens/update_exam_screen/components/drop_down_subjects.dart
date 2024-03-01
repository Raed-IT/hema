import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../../them/app_colors.dart';
import '../update_exam_controller.dart';

class DropdownUpdateExamSubjects extends GetView<TeacherUpdateExamController> {
  const DropdownUpdateExamSubjects({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Expanded(
        child: DottedBorder(
          padding: EdgeInsets.only(right: 10.w, left: 10.w),
          radius: Radius.circular(50.sp),
          strokeWidth: 1.sp,
          color: (controller.validateDateSubjectPiker.value)
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
              value: controller.selectedSubject.value,
              underline: Container(),
              disabledHint: (controller.isLoad.value)
                  ? SizedBox(
                      height: 20.h,
                      width: 20.w,
                      child: CircularProgressIndicator(
                        color: AppColors.SECONDARY_COLOR,
                        strokeWidth: 2.sp,
                      ))
                  : Container(
                      child: Center(
                        child: Text('no_subjects'.tr),
                      ),
                    ),
              elevation: 0,
              alignment: Alignment.center,
              isExpanded: true,
              hint: Text(
                'material'.tr,
              ),
              onChanged: (newValue) {
                print(newValue);
              },
              iconDisabledColor: AppColors.PRIMARY_COLOR,
              iconEnabledColor: AppColors.SECONDARY_COLOR,
              items: controller.subjects.map((selectedSubject) {
                return DropdownMenuItem(
                  enabled: (controller.selectedSubject.value == selectedSubject)
                      ? false
                      : true,
                  onTap: () {
                    controller.selectedSubject(selectedSubject);
                  },
                  value: selectedSubject,
                  child: Text(
                    "${selectedSubject.name}",
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
