import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:msh_checkbox/msh_checkbox.dart';
import 'package:school/app/global/data/controllers/main_controller.dart';
import 'package:school/app/them/app_colors.dart';

// ignore: must_be_immutable
class AnimatedCheckComponent extends StatefulWidget {
  void Function(bool) onChange;
  bool isChecked = false;

  AnimatedCheckComponent(
      {Key? key, required this.onChange, required this.isChecked})
      : super(key: key);

  @override
  State<AnimatedCheckComponent> createState() => _AnimatedCheckComponentState();
}

class _AnimatedCheckComponentState extends State<AnimatedCheckComponent> {
  @override
  Widget build(BuildContext context) {
    return MSHCheckbox(
      size: 20.sp,
      value: widget.isChecked,
      duration: const Duration(milliseconds: 500),
      colorConfig: MSHColorConfig.fromCheckedUncheckedDisabled(
          checkedColor: AppColors.PRIMARY_COLOR,
          uncheckedColor: AppColors.ORANG_APP_COLOR),
      style: MSHCheckboxStyle.stroke,
      onChanged: (selected) {
        bool allow = Get
            .find<MainController>()
            .setting
            .value!
            .allowAttendTeacher!;
        if (allow) {
          setState(() {
            widget.isChecked = selected;
          });
          widget.onChange(selected);
        }
      },
    );
  }
}
