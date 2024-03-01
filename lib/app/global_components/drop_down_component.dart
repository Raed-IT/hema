import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:school/app/global/data/models/main_model.dart';

import '../them/app_colors.dart';

class DroDownComponent<T extends Model> extends StatelessWidget {
  RxList<T> list;
  Rxn<T> selectedModel;
  RxBool isLoadModels;
  String title;

  DroDownComponent({
    super.key,
    required this.title,
    required this.list,
    required this.selectedModel,
    required this.isLoadModels,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => DottedBorder(
        padding: EdgeInsets.only(right: 10.w, left: 10.w),
        radius: Radius.circular(50.sp),
        strokeWidth: 1.sp,
        color: AppColors.PRIMARY_COLOR,
        dashPattern: const [3, 4],
        borderType: BorderType.RRect,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(50.sp)),
          ),
          height: 30.h,
          child: DropdownButton<T>(
             value: selectedModel.value,
            underline: Container(),
            disabledHint: (isLoadModels.value)
                ? SizedBox(
                    height: 20.h,
                    width: 20.w,
                    child: CircularProgressIndicator(
                      color: AppColors.SECONDARY_COLOR,
                      strokeWidth: 2.sp,
                    ),
                  )
                : Center(
                    child: Text("لايوجد $title"),
                  ),
            elevation: 0,
            alignment: Alignment.center,
            isExpanded: true,
            hint: Text(
              title,
            ),
            onChanged: (newValue) {},
            iconDisabledColor: AppColors.PRIMARY_COLOR,
            iconEnabledColor: AppColors.SECONDARY_COLOR,
            items: list.map((model) {
              return DropdownMenuItem(
                enabled: (selectedModel.value == model) ? false : true,
                onTap: () {
                  selectedModel.value = model;
                },
                value: model,
                child: Text(model.getName()),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
