import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../them/app_colors.dart';

showDeleteDialog(
    {required BuildContext context,
    required Function() onDelete,
    required String title,
    required String content}) async {
  await Get.dialog(
    AlertDialog(
      backgroundColor: Colors.white,
      title: Text(
        title,
      ),
      content: Text(
        content,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      actions: [
        SizedBox(
          width: 70.w,
          child: MaterialButton(
            child: Text(
              "no".tr,
              style: const TextStyle(
                  color: AppColors.PRIMARY_COLOR, fontWeight: FontWeight.bold),
            ),
            onPressed: () {
              Get.back();
            },
          ),
        ),
        SizedBox(
          width: 90.w,
          child: MaterialButton(
            child: Text(
              "حذف".tr,
              style: const TextStyle(
                  color: AppColors.SECONDARY_COLOR,
                  fontWeight: FontWeight.bold),
            ),
            onPressed: () async {
              Get.back();
              onDelete();
            },
          ),
        ),
      ],
    ),
  );
}
