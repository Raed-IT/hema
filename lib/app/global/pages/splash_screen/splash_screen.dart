import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:school/app/global/pages/splash_screen/splash_controller.dart';
import 'package:school/app/them/app_colors.dart';

class SplashScreen extends GetView<SplashScreenController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FadedSlideAnimation(
          beginOffset: Offset(0, 1),
          endOffset: Offset(0, 0),
          slideDuration: Duration(seconds: 2),
          fadeDuration: Duration(seconds: 4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/custom/logo-school.png",
                width: 150.w,
              ),
              SizedBox(
                height: 50.h,
              ),
              SvgPicture.asset(
                "assets/svg/logo_port.svg",
                color: AppColors.PRIMARY_COLOR,
                width: 100.w,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
