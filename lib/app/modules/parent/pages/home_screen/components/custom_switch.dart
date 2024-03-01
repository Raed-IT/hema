 import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:school/app/modules/parent/pages/home_screen/home_controller.dart';
 import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:school/app/them/app_colors.dart';
class ParentCustomSwitch extends StatefulWidget {
  ParentCustomSwitch({Key? key}) : super(key: key);

  @override
  State<ParentCustomSwitch> createState() => _ParentCustomSwitchState();
}

class _ParentCustomSwitchState extends State<ParentCustomSwitch> {
  final ParentHomeController _homeController = Get.find<ParentHomeController>();
  int value = 0;

  bool positive = true;

  @override
  Widget build(BuildContext context) {
    return AnimatedToggleSwitch<bool>.dual(
      current: positive,
      first: true,
      second: false,
      borderColor: Colors.transparent,
      borderWidth: 0.sp,
      height: 25.h,
      boxShadow: [
        BoxShadow(
          color: Colors.black12.withOpacity(.1),
          spreadRadius: 1,
          blurRadius: 4,
          offset: Offset(0, 1),
        ),
      ],
      onChanged: (b) {},
      colorBuilder: (b) =>
          b ? AppColors.SECONDARY_COLOR : AppColors.PRIMARY_COLOR,
      iconBuilder: (value) => value
          ? const Icon(
              Icons.coronavirus_rounded,
              color: Colors.white,
            )
          : const Icon(Icons.mode_night_outlined, color: Colors.white),
      textBuilder: (value) => value
          ? Center(child: Text("Present".tr))
          : Center(child: Text("absent".tr)),
    );
  }
}
