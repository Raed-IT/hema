import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:school/app/global/data/models/subject_model.dart';

import '../../them/app_colors.dart';

class SubjectComponent extends StatefulWidget {
  bool isOptional;
  Rxn<SubjectModel> selectedSubject;
  RxBool isLoadSubject = RxBool(false);
  RxList<SubjectModel> subjects = RxList([]);
   void Function(SubjectModel subject) onTap;

  SubjectComponent({
    Key? key,
     this.isOptional = false,
    required this.selectedSubject,
    required this.isLoadSubject,
    required this.onTap,
    required this.subjects,
  }) : super(key: key);

  @override
  State<SubjectComponent> createState() => _SubjectComponentState();
}

class _SubjectComponentState extends State<SubjectComponent> {
  bool validateSubjectPiker = false;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Expanded(
        child: DottedBorder(
          padding: EdgeInsets.only(right: 10.w, left: 10.w),
          radius: Radius.circular(50.sp),
          strokeWidth: 1.sp,
          color:AppColors.PRIMARY_COLOR,
          dashPattern: const [3, 4],
          borderType: BorderType.RRect,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(50.sp)),
            ),
            height: 30.h,
            child: DropdownButton(
              value: widget.selectedSubject.value,
              underline: Container(),
              disabledHint: (widget.isLoadSubject.value)
                  ? SizedBox(
                      height: 20.h,
                      width: 20.w,
                      child: CircularProgressIndicator(
                        color: AppColors.SECONDARY_COLOR,
                        strokeWidth: 2.sp,
                      ))
                  : Center(
                      child: Text('no_subjects'.tr),
                    ),
              elevation: 0,
              alignment: Alignment.center,
              isExpanded: true,
              hint: Text(
                'material'.tr,
              ),
              onChanged: (newValue) {},
              iconDisabledColor: AppColors.PRIMARY_COLOR,
              iconEnabledColor: AppColors.SECONDARY_COLOR,
              items: widget.subjects.map((selectedSubject) {
                return DropdownMenuItem(
                  enabled: (widget.selectedSubject.value == selectedSubject)
                      ? false
                      : true,
                  onTap: () {
                    widget.selectedSubject.value = selectedSubject;
                    widget.onTap(selectedSubject);
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
