import 'package:custom_marker/marker_icon.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:school/app/global/data/enums/attendees_enum.dart';

import '../../../../global/data/models/student_model.dart';
import '../../../../them/app_colors.dart';
import '../../data/mina_driver_controller.dart';

class DriverShowStudentController extends GetxController {
  Rx<Set<Marker>> markers = Rx(Set());
  Rxn<LatLng> studentsLocation = Rxn();
  StudentModel student = Get.arguments['student'];

  @override
  void onInit() {
    super.onInit();
    print("${student.long} ===== ${student.long}");
    if (student.long != null && student.lat != null) {
      studentsLocation(LatLng(student.lat!, student.long!));
    }
    addMarker();
  }

  Future<void> addMarker() async {
    Set<Marker> _mar = Set();
    if (studentsLocation.value != null) {
      _mar.add(Marker(
        position: studentsLocation.value!,
        icon: await MarkerIcon.downloadResizePictureCircle(
            "${student.img}",
            size: 90.sp.toInt(),
            addBorder: true,
            borderColor: (Get.find<DriverMainController>().time.value == "pm")
                ? AppColors.PRIMARY_COLOR
                : AppColors.SECONDARY_COLOR,
            borderSize: 15),
        markerId: const MarkerId('student'),
      ));
    }
    markers(_mar);
  }
}
