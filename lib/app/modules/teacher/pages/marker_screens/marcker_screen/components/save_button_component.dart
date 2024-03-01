import 'package:async_button/async_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:flutter/material.dart';

import '../../../../../../them/app_colors.dart';
import '../marker_controller.dart';

class TeacherAddMarksButtonComponents extends StatefulWidget {
  const TeacherAddMarksButtonComponents({super.key});

  @override
  State<TeacherAddMarksButtonComponents> createState() =>
      _TeacherAddAttendButtonComponentsState();
}

class _TeacherAddAttendButtonComponentsState
    extends State<TeacherAddMarksButtonComponents> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<TeacherMarkerController>(
        builder: (controller) {

          if (controller.students.isNotEmpty) {
            return Padding(
              padding: EdgeInsets.all(10.w),
              child: SizedBox(
                height: 50.h,
                child: AsyncElevatedBtn(
                  asyncBtnStatesController: controller.btnStateController,
                  onPressed: () => controller.addMarks(),
                  loadingStyle: AsyncBtnStateStyle(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.ORANG_APP_COLOR,
                    ),
                    widget: const SizedBox.square(
                      dimension: 24,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  successStyle: AsyncBtnStateStyle(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                    ),
                    widget: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Icon(Icons.check),
                        SizedBox(width: 4),
                        Text('تم حفظ العلامات ')
                      ],
                    ),
                  ),
                  failureStyle: AsyncBtnStateStyle(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                    ),
                    widget: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.error),
                        SizedBox(width: 4),
                        Text(
                          'خطاء ',
                          style: TextStyle(fontSize: 20.sp),
                        ),
                      ],
                    ),
                  ),
                  style: ButtonStyle(
                      backgroundColor:
                      MaterialStateProperty.all(AppColors.PRIMARY_COLOR)),
                  child: Text(
                    'حفظ العلامات ',
                    style: TextStyle(
                        color: AppColors.ORANG_APP_COLOR,
                        fontWeight: FontWeight.bold,
                        fontSize: 15.sp),
                  ),
                ),
              ),
            );
          }
          else {
            return Container();
          }
        });
  }}
