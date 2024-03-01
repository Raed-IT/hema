import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:school/app/modules/teacher/pages/marker_screens/marcker_screen/marker_controller.dart';

import '../../../../../../them/app_colors.dart';

class CustomSwitchMarker extends StatefulWidget {
  const CustomSwitchMarker({Key? key}) : super(key: key);

  @override
  State<CustomSwitchMarker> createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitchMarker> {
  final TeacherMarkerController _controller =
      Get.find<TeacherMarkerController>();
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
      boxShadow: [
        BoxShadow(
          color: Colors.black12.withOpacity(0.1),
          spreadRadius: 2,
          blurRadius: 8,
          offset: Offset(0, 3),
        ),
      ],
      onChanged: (b) {
        if (b) {
          _controller.shiftTime = "am";
        } else {
          _controller.shiftTime = "pm";
        }
        _controller.getStudentWithData();
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
