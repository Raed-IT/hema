import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:school/app/global/data/controllers/main_controller.dart';
import 'package:school/app/them/app_colors.dart';

void showQrCode({required BuildContext context}) {
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
      return Container(
        height: Get.height / 2,
        child: Center(
          child: (Get.find<MainController>().currentUser.value?.qr != null)
              ? SizedBox(
                  width: 200.w,
                  height: 240.h,
                  child: Column(
                    children: [
                      Text(
                        "الباركود الخاص بك",
                        style: TextStyle(
                            color: AppColors.ORANG_APP_COLOR,
                            fontSize: 22.sp,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      QrImageView(
                        data:
                            "${Get.find<MainController>().currentUser.value?.qr}",
                        version: QrVersions.auto,
                        size: 200.0,
                      ),
                    ],
                  ),
                )
              : Container(
                  child: Center(
                    child: Text(
                      "لايود لك باركود الرجاء التواصل مع الادارة",
                      style: TextStyle(
                          color: AppColors.PRIMARY_COLOR,
                          fontWeight: FontWeight.bold,
                          fontSize: 15.sp),
                    ),
                  ),
                ),
        ),
      );
    },
  );
}
