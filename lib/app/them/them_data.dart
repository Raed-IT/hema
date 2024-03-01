import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school/app/them/app_colors.dart';

class ThemeAppData {
  static ThemeData themeData = ThemeData(
    // floatingActionButtonTheme: const FloatingActionButtonThemeData(
    //   backgroundColor: Color.fromRGBO(230, 230, 230, 0),
    // ),
    fontFamily: "app",
    scaffoldBackgroundColor: AppColors.SCAFFOLD_COLOR,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.PRIMARY_COLOR,
    ),
    pageTransitionsTheme: const PageTransitionsTheme(builders: {
      TargetPlatform.android: CupertinoPageTransitionsBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
    }),
    textTheme: TextTheme(
      headline1: TextStyle(
          fontSize: 16.sp,
          overflow: TextOverflow.ellipsis,
          fontWeight: FontWeight.bold,
          color: Colors.black),
      headline2: TextStyle(
        fontSize: 14.sp,
        overflow: TextOverflow.ellipsis,
        fontWeight: FontWeight.bold,
      ),
      headline3: TextStyle(
        overflow: TextOverflow.ellipsis,
        fontSize: 12.sp,
      ),
      headline4: TextStyle(
        fontSize: 10.sp,
        color: AppColors.HEAD2_COLOR,
        overflow: TextOverflow.ellipsis,
      ),
    ),
  );
}
