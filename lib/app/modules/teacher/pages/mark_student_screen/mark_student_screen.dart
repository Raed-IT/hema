import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:school/app/modules/teacher/pages/mark_student_screen/mark_student_controller.dart';

import '../../../../global_components/appbar_components/main_appbar.dart';
import '../../../../them/app_colors.dart';

class TeacherMarkStudentScreen extends GetView<TeacherMarkStudentController> {
  const TeacherMarkStudentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: controller.scrollController,
        slivers: [
          MainAnimatedAppBarComponent(
            svgUrl: "assets/svg/results.svg",
            openDrawer: (BuildContext context) {},
            scrollController: controller.scrollController,
            supWidgets: [
              Text(''),
              Text(
                "العلامات",
                style: TextStyle(
                    color: AppColors.ORANG_APP_COLOR,
                    fontWeight: FontWeight.bold,
                    fontSize: 25.sp),
              ),
            ],
          )
        ],
      ),
    );
  }
}
