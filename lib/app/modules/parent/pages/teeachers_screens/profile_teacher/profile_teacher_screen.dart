import 'package:clipboard/clipboard.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:school/app/modules/parent/pages/teeachers_screens/profile_teacher/components/app_bar.dart';
import 'package:school/app/modules/parent/pages/teeachers_screens/profile_teacher/profile_teacher_controller.dart';
import 'package:school/app/them/app_colors.dart';
import 'package:url_launcher/url_launcher.dart';

class ParentProfileTeacherScreen
    extends GetView<ParentProfileTeacherController> {
  ParentProfileTeacherScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          ParentAppBarProfileTeacher(),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(18.0.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  Text('email'.tr),
                  SizedBox(
                    height: 10.h,
                  ),
                  DottedBorder(
                    radius: Radius.circular(12.sp),
                    strokeWidth: 1.sp,
                    color: AppColors.PRIMARY_COLOR,
                    dashPattern: const [3, 4],
                    borderType: BorderType.RRect,
                    child: Container(
                      padding: EdgeInsets.all(10.w),
                      width: double.maxFinite,
                      child: Center(
                        child: Text("${controller.teacher.email}"),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text('phone'.tr),
                  SizedBox(
                    height: 10.h,
                  ),
                  DottedBorder(
                    radius: Radius.circular(12.sp),
                    strokeWidth: 1.sp,
                    color: AppColors.PRIMARY_COLOR,
                    dashPattern: const [3, 4],
                    borderType: BorderType.RRect,
                    child: Container(
                      padding: EdgeInsets.all(10.w),
                      width: double.maxFinite,
                      child: Center(
                        child: (controller.teacher.phone != "لايوجد")
                            ? TextButton(
                                style: ButtonStyle(
                                  padding:
                                      MaterialStateProperty.all<EdgeInsets>(
                                          EdgeInsets.all(10)),
                                ),
                                onPressed: () {
                                  launchUrl(Uri.parse(
                                      "https://wa.me/${controller.teacher.phone}"));
                                },
                                child: Text(
                                  "${controller.teacher.phone}",
                                  style: TextStyle(
                                      fontFamily: "", fontSize: 12.sp),
                                ))
                            : Text("${controller.teacher.phone}"),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    'about_teacher'.tr,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  DottedBorder(
                    radius: Radius.circular(12.sp),
                    strokeWidth: 1.sp,
                    color: AppColors.PRIMARY_COLOR,
                    dashPattern: const [3, 4],
                    borderType: BorderType.RRect,
                    child: Container(
                        padding: EdgeInsets.all(10.w),
                        width: double.maxFinite,
                        child: Text("${controller.teacher.bio}")),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
