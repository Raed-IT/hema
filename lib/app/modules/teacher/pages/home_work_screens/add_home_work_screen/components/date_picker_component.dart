import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart'
    as date_picker;
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../../../them/app_colors.dart';
import '../add_home_work_controller.dart';

class DatePickerAddJobComponent extends GetView<TeacherAddHomeWorkController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() => Expanded(
          child: InkWell(
            onTap: () => showDate(controller: controller, context: context),
            child: DottedBorder(
              radius: Radius.circular(50.sp),
              strokeWidth: 1.sp,
              color: (controller.validateDateDatePiker.value)
                  ? Colors.red
                  : AppColors.DARK_COLOR.withOpacity(.7),
              dashPattern: const [3, 4],
              borderType: BorderType.RRect,
              child: Container(
                padding: EdgeInsets.only(left: 10.w, right: 10.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(50.sp),
                  ),
                ),
                height: 27.h,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      (controller.selectedTime.value == null)
                          ? Text('delivery_date'.tr)
                          : Text(
                              "${controller.selectedTime.value}",
                              style: TextStyle(fontFamily: "", fontSize: 12.sp),
                            ),
                      const Icon(
                        Icons.date_range,
                        color: AppColors.PRIMARY_COLOR,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }

  void showDate(
      {required BuildContext context,
      required TeacherAddHomeWorkController controller}) {
    date_picker.DatePicker.showDatePicker(context,
        theme: const date_picker.DatePickerTheme(
          doneStyle: TextStyle(
            fontFamily: "font_app",
            color: AppColors.SECONDARY_COLOR,
          ),
          cancelStyle:
              TextStyle(fontFamily: "font_app", color: AppColors.PRIMARY_COLOR),
          itemStyle: TextStyle(fontFamily: "font_app"),
        ),
        minTime: DateTime.parse("${DateTime.now().year}-01-01"),
        maxTime: DateTime.parse("${DateTime.now().year}-12-31"),
        showTitleActions: true, onConfirm: (date) {
      controller
          .selectedTime('${DateFormat('yyyy-MM-dd').format(date).toString()} ');
    },
        currentTime: DateTime.now(),
        locale:
            Get.locale!.languageCode == "ar" ? LocaleType.ar : LocaleType.en);
  }
}
