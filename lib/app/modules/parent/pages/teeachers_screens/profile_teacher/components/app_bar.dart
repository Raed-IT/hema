import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:school/app/modules/parent/pages/teeachers_screens/profile_teacher/profile_teacher_controller.dart';
import 'package:school/app/them/app_colors.dart';

import '../../../../../../global_components/avatar_component.dart';

class ParentAppBarProfileTeacher
    extends GetView<ParentProfileTeacherController> {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      pinned: true,
      toolbarHeight: 180.h,
      expandedHeight: 220.h,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: AppColors.MAIN_GRADIENT_COLOR,
          ),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20.sp),
            bottomRight: Radius.circular(20.sp),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(''),
                IconButton(
                  onPressed: () => Get.back(),
                  icon: const Icon(
                    Icons.arrow_forward_rounded,
                    color: Colors.white,
                  ),
                )
              ],
            ),
            Hero(
              tag: controller.teacher.id.toString(),
              child: AvatarComponent(
                bgColor: AppColors.SECONDARY_COLOR,
                radius: 55.sp,
                widget: (controller.teacher.img != '' &&
                        controller.teacher.img != null)
                    ? CircleAvatar(
                        radius: 50.sp,
                        backgroundColor: Colors.red,
                        backgroundImage:
                            NetworkImage("${controller.teacher.img}"),
                      )
                    : CircleAvatar(
                        radius: 50.sp,
                        backgroundColor: Colors.white,
                        child: Image.asset(
                          "assets/images/avatar.png",
                          height: 70.sp,
                        ),
                      ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              "${controller.teacher.name}",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22.sp,
                  color: AppColors.SECONDARY_COLOR),
            ),
            SizedBox(
              height: 20.h,
            ),
          ],
        ),
      ),
    );
  }
}
