 import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../them/app_colors.dart';

class FloatAddButtonComponent extends StatelessWidget {
  String title;
  void Function()? onTap;
  IconData icon;
  String tag;

  FloatAddButtonComponent(
      {Key? key,
      required this.title,
      this.icon = Icons.add,
      required this.onTap,
      required this.tag})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      backgroundColor: Colors.transparent,
      heroTag: tag,
      extendedPadding: EdgeInsets.all(0),
      isExtended: true,
      elevation: 0,
      onPressed: onTap,
      label: Stack(
        alignment: (Get.locale!.languageCode == "ar")
            ? Alignment.centerRight
            : Alignment.centerLeft,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20.sp)),
              color: const Color.fromRGBO(230, 230, 230, 1),
            ),
            margin: EdgeInsets.all(10.w),
            padding: (Get.locale!.languageCode == "ar")
                ? EdgeInsets.only(right: 55.w, left: 10.w)
                : EdgeInsets.only(left: 55.w, right: 10.w),
            height: 30.h,
            child: Center(
              child: Text(
                title,
                maxLines: 1,
                style: TextStyle(
                    fontSize: 10.sp,
                    color: AppColors.DARK_COLOR,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Card(
            elevation: 5,
            margin: EdgeInsets.all(0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(500.sp),
              ),
            ),
            child: Container(
              height: 50.h,
              width: 60.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(500.sp)),
                  gradient: LinearGradient(
                      colors: AppColors.SECONDARY_GRADIENT_COLOR)),
              child: Center(
                child: Icon(icon),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
