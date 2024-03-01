import 'package:custom_marker/marker_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:helper_plugin/helper.dart';
import 'package:helper_plugin/utilitis/error_type_enum.dart';
import 'package:school/app/global/data/models/student_model.dart';
import 'package:school/app/modules/parent/data/routes_api.dart';
import '../../../../global/data/get_location_user.dart';
import '../../../../them/app_colors.dart';

class ParentMapController extends GetxController with ApiHelperMixin {
  Rxn<Position> position = Rxn();

  StudentModel student = Get.arguments['student'];
  Rx<Set<Marker>> markers = Rx(Set());
  ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    super.onInit();
    getPotions();
  }

  Future<void> addMarker() async {
    Set<Marker> mar = Set();
    mar.add(Marker(
      position: LatLng(
        position.value!.latitude,
        position.value!.longitude,
      ),
      icon: await MarkerIcon.downloadResizePictureCircle("${student.img}",
          size: 90.sp.toInt(),
          addBorder: true,
          borderColor: AppColors.PRIMARY_COLOR,
          borderSize: 15),
      markerId: const MarkerId('student'),
    ));
    markers(mar);
  }

  Future<void> save() async {
    if (position.value == null) {
      return;
    } else {
      EasyLoading.show();
      FormData formData = FormData({
        'lat': position.value!.latitude.toString(),
        'long': position.value!.longitude.toString(),
        "_method": "PUT"
      });
      await postGetConnect(
          url: "${ParentApiRouts.UPDATE_LOCATION}?student_id=${student.id}",
          data: formData);
    }
  }

  Future<void> getPotions() async {
    position(await LocationController.determinePosition());
    if (position.value != null) {
      addMarker();
    }
  }

  @override
  void onError(String type) {
    EasyLoading.showError("");
  }

  @override
  void getModelFromJsonUsing(json, String urlType) {
    EasyLoading.dismiss();
    if (ErrorApiTypeEnum.postGetConnect.name == urlType) {
      Fluttertoast.showToast(msg: "تم تعديل الموقع");
    }
  }
}
