import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:school/app/modules/driver/data/mina_driver_controller.dart';
import 'package:school/app/modules/driver/pages/show_student/show_student_controller.dart';
import '../../../../global/pages/map_screen/map_screen.dart';
import '../../../../global_components/avatar_component.dart';
import '../../../../them/app_colors.dart';

class DriverShowStudentScreen extends GetView<DriverShowStudentController> {
  TextStyle? style;

  TextStyle? dec;

  @override
  Widget build(BuildContext context) {
    style = Theme.of(context).textTheme.headline1;
    dec = TextStyle(
      fontSize: style!.fontSize! - 5.sp,
      color: AppColors.DARK_COLOR,
    );

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(
          310.h,
        ),
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 35.h),
              height: 280.h,
              decoration: BoxDecoration(
                color: (Get.find<DriverMainController>().time.value == "pm")
                    ? AppColors.PRIMARY_COLOR
                    : AppColors.SECONDARY_COLOR,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(20.sp),
                  bottomLeft: Radius.circular(20.sp),
                ),
              ),
            ),
            Positioned(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: AvatarComponent(
                  radius: 75.h,
                  widget: Hero(
                    transitionOnUserGestures: true,
                    tag: controller.student.id!,
                    child: CircleAvatar(
                      radius: 70.h,
                      backgroundImage:
                      NetworkImage(controller.student.img ?? ""),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 20.h,
          ),
          Text(
            "${'student_name'.tr} : ${controller.student.fullName}",
            style: TextStyle(
              fontSize: style!.fontSize,
              color: AppColors.DARK_COLOR,
              fontWeight: style!.fontWeight,
            ),
          ),
          Divider(
            endIndent: 30.0.w,
            thickness: 1.2.sp,
            indent: 30.0.w,
            height: 20.h,
          ),
          Row(
            children: [
              SizedBox(
                width: 50.w,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      style: BorderStyle.solid,
                      color: AppColors.DARK_COLOR.withOpacity(.2),
                      width: 1.2.sp,
                    ),
                  ),
                ),
                child: Text(
                  "${'section'.tr}:",
                  style: dec,
                ),
              ),
              SizedBox(
                width: 40.w,
              ),
              Text(
                controller.student.section?.name ?? '',
                style: dec,
              ),
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: 50.w,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      style: BorderStyle.solid,
                      color: AppColors.DARK_COLOR.withOpacity(.2),
                      width: 1.2.sp,
                    ),
                  ),
                ),
                child: Text(
                  "${'department'.tr}:",
                  style: dec,
                ),
              ),
              SizedBox(
                width: 40.w,
              ),
              Text(
                controller.student.department?.name ?? '',
                style: dec,
              ),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            children: [
              SizedBox(
                width: 50.w,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      style: BorderStyle.solid,
                      color: AppColors.DARK_COLOR.withOpacity(.2),
                      width: 1.2.sp,
                    ),
                  ),
                ),
                child: Text(
                  "العنوان كاملا :",
                  style: dec,
                ),
              ),
              SizedBox(
                width: 20.w,
              ),
              Expanded(
                child: Wrap(
                  children: [
                    Text(
                      "${controller.student.address??'لايوجد '}",
                    )
                  ],
                ),
              )
            ],
          ),
          Expanded(
            child: Obx(
                  () => (controller.studentsLocation.value != null)
                  ? Container(
                margin: EdgeInsets.all(30.sp),
                child: SizedBox(
                  height: 130.h,
                  child: GoogleMap(
                    zoomControlsEnabled: false,
                    onTap: (d) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MapScreen(
                                latLong:
                                controller.studentsLocation.value!,
                                marker: controller.markers.value)),
                      );
                    },
                    //Map widget from google_maps_flutter package
                    zoomGesturesEnabled: true,
                    //enable Zoom in, out on map
                    initialCameraPosition: CameraPosition(
                      //innital position in map
                      target: controller.studentsLocation.value!,
                      //initial position
                      zoom: 17.0, //initial zoom level
                    ),
                    markers: controller.markers.value,
                    //markers to show on map
                    mapType: MapType.satellite,
                    //map type
                    onMapCreated: (controller) {
                      //method called when map is created
                    },
                  ),
                ),
              )
                  : Container(),
            ),
          ),
        ],
      ),
    );
  }
}
