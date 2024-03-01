import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../../../them/app_colors.dart';
import '../check_students_controller.dart';
class CustomSwitch extends StatefulWidget {
  const CustomSwitch({Key? key}) : super(key: key);

  @override
  State<CustomSwitch> createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  final CheckStudentsController _studentsController =
      Get.find<CheckStudentsController>();
  int value = 0;

  bool positive = DateFormat('a').format(DateTime.now()) == "AM" ? true : false;

  @override
  Widget build(BuildContext context) {
    return AnimatedToggleSwitch<bool>.dual(
      current: positive,
      first: true,
      second: false,
      borderColor: Colors.transparent,
      borderWidth: 1.0.sp,
      height: 40.h,
      boxShadow: const [
        BoxShadow(
          color: Colors.black12,
          spreadRadius: 2,
          blurRadius: 8,
          offset: Offset(0, 5.5),
        ),
      ],
      onChanged: (b) {
        if (b) {
          _studentsController.shiftTime = "am";
        } else {
          _studentsController.shiftTime = "pm";
        }
        _studentsController.getDataWithDuration();
        setState(() => positive = b);
      },
      colorBuilder: (b) =>
          b ? AppColors.SECONDARY_COLOR : AppColors.PRIMARY_COLOR,
      iconBuilder: (value) => value
          ? const Icon(
              Icons.coronavirus_rounded,
              color: Colors.white,
            )
          : const Icon(Icons.mode_night_outlined, color: Colors.white),
      textBuilder: (value) => value
          ? Center(
              child: Text("الدوام الصباحي ".tr),
            )
          : Center(
              child: Text("الدوام المسائي ".tr),
            ),
    );
  }
}
