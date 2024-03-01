import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:school/app/modules/teacher/pages/home_screen/home_conteoller.dart';
import 'package:school/app/them/app_colors.dart';

class TeacherButtonGroupComponent extends StatefulWidget {
  TeacherButtonGroupComponent({Key? key}) : super(key: key);

  @override
  State<TeacherButtonGroupComponent> createState() =>
      _TeacherButtonGroupComponentState();
}

class _TeacherButtonGroupComponentState
    extends State<TeacherButtonGroupComponent> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<TeacherHomeController>(builder: (controller) {
      return ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemCount: controller.sections.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => InkWell(
          child: FilterChip(
            padding:
                EdgeInsets.only(left: 9.w, right: 9.w, bottom: 9.h, top: 9.h),
            labelStyle: const TextStyle(color: Colors.white),
            selectedShadowColor: AppColors.DARK_COLOR,
            checkmarkColor: AppColors.SECONDARY_COLOR,
            backgroundColor: AppColors.PRIMARY_COLOR.withOpacity(.6),
            selectedColor: AppColors.PRIMARY_COLOR,
            selected: controller.selectedSection.value == index ? true : false,
            label: Text(controller.sections[index].name.toString()),
            elevation: 5,
            onSelected: (value) {
              setState(() {});
              controller.selectedSectionSetter = index;
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
