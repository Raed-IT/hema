import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

import '../../them/app_colors.dart';

class LocationController {
  static   Future<Position?> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      Future.delayed(const Duration(seconds: 3), () async {
        Get.back();
        await Geolocator.openLocationSettings();
      });
      Get.defaultDialog(
        title: "alert".tr,
        content: Container(
          child: Center(
            child: Text(
              "preemption_access_jps".tr,
              style: TextStyle(
                  color: AppColors.PRIMARY_COLOR,
                  fontWeight: FontWeight.bold,
                  fontSize: 14.sp),
            ),
          ),
        ),
      );
      return null; // Location services are disabled.
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return null; //Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return null;
      // Future.error(  'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }

}