import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class Constants {
  Constants._();

  static final Constants instants = Constants._();
  static double MAIN_APP_BAR_HIEIGHT = 70.h;
  static double EXPANDED_MAIN_APP_BAR_HIEIGHT = 250.h;
  static String SCHOOL_NAME = "مدارس جيل المستقبل  ";

  static Effect fadeEffect = FadeEffect(
    duration: 700.milliseconds,
    curve: Curves.linear,
  );
  static Effect blurEffect = BlurEffect(
    duration: 700.milliseconds,
    curve: Curves.linear,
  );
  static Effect boxShadowEffect = BoxShadowEffect(
    duration: 700.milliseconds,
    curve: Curves.linear,
  );
  static Effect moveUpEffect = MoveEffect(
    duration: 700.milliseconds,
    curve: Curves.linear,
  );
  static Effect scaleEffect = ScaleEffect(
    duration: 700.milliseconds,
    curve: Curves.linear,
  );
  static Effect shimmerEffect = ShimmerEffect(
    duration: 700.milliseconds,
    curve: Curves.linear,
  );
  static Effect slideEffect = SlideEffect(
    duration: 700.milliseconds,
    curve: Curves.linear,
  );

  static Effect flipEffect = FlipEffect(
    duration: 700.milliseconds,
    curve: Curves.linear,
  );
  static Effect saturateEffect = SaturateEffect(
    duration: 700.milliseconds,
    curve: Curves.linear,
  );
}
