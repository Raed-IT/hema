import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:school/app/modules/parent/pages/home_work_screens/show_home_work_screen/show_home_work_controller.dart';

import '../../../../../../them/app_colors.dart';

Future<void> showBottomSheetSendAnswerHomeWork(
    {required BuildContext context}) async {
  ParentShowHomeWorkController controller =
      Get.find<ParentShowHomeWorkController>();
  showModalBottomSheet(
    elevation: 7,
    isScrollControlled: true,
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(20.sp),
      ),
    ),
    builder: (context) {
      return Form(
        child: SizedBox(
          height: Get.height * 0.7,
          child: Padding(
            padding: EdgeInsets.all(8.sp),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(10.sp),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("لايمكن تعديل الوظيفة في حال تم الرفع ",
                                style: TextStyle(
                                    color: AppColors.PRIMARY_COLOR,
                                    fontWeight: FontWeight.bold))
                          ],
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Text(
                          "اكتب اجابتك او ارفع صورة للوظيفة :",
                        ),
                      ],
                    ),
                  ),
                  DottedBorder(
                    color: AppColors.PRIMARY_COLOR.withOpacity(0.5),
                    borderType: BorderType.RRect,
                    radius: const Radius.circular(12),
                    padding: const EdgeInsets.all(6),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(12.sp)),
                      child: TextFormField(
                        controller: controller.answerController,
                        decoration: const InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                        ),
                        maxLines: null,
                        minLines: 5,
                        keyboardType: TextInputType.multiline,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  controller.buildPickerImagesWidget(context: context, imageCount: 3),
                  SizedBox(
                    height: 30.h,
                  ),
                  MaterialButton(
                    color: AppColors.PRIMARY_COLOR,
                    minWidth: Get.width,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.sp))),
                    onPressed: () =>controller.addHomeWorkCompleted(),
                    child: Text(
                      "رفع الوظيفة",
                      style: TextStyle(color: AppColors.SCAFFOLD_COLOR),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}
