import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:school/app/them/app_colors.dart';

class NoDataSliverComponent extends StatelessWidget {
  String? title;
  void Function() onTap;

  NoDataSliverComponent({Key? key, this.title, required this.onTap})
      : super(key: key);
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return LiveSliverList(
      delay: const Duration(milliseconds: 0),
      controller: _scrollController,
      itemCount: 1,
      itemBuilder: (context, index, animation) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: Offset(0, .7),
            end: Offset.zero,
          ).animate(animation),
          child: SizedBox(
            height: 350.h,
            child: GestureDetector(
              onTap: onTap,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      title ?? 'no_department_found'.tr,
                      style: TextStyle(
                          color: AppColors.DARK_COLOR,
                          fontWeight: FontWeight.bold,
                          fontSize: 17.sp),
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  const Icon(Icons.refresh),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
