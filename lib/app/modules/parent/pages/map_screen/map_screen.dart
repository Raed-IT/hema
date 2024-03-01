import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:school/app/global/pages/map_screen/map_screen.dart';
import 'package:school/app/global_components/appbar_components/main_appbar.dart';
import 'package:school/app/global_components/drawer_component.dart';

import '../../../../them/app_colors.dart';
import 'map_controller.dart';

class ParentMapScreen extends GetView<ParentMapController> {
  const ParentMapScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerComponent(),
      body: Builder(
        builder: (context) {
          return CustomScrollView(
            controller: controller.scrollController,
            slivers: [
              MainAnimatedAppBarComponent(
                  herTag: "update_location-tag",
                  svgUrl: "assets/svg/marker.svg",
                  openDrawer: (conte) {
                    Scaffold.of(context).openDrawer();
                  },
                  scrollController: controller.scrollController,
                  supWidgets: [
                    Text(
                      "تحـديد المـوقع",
                      style: TextStyle(
                          color: AppColors.ORANG_APP_COLOR,
                          fontSize: 22.sp,
                          fontWeight: FontWeight.bold),
                    )
                  ]),
              SliverToBoxAdapter(
                child: Card(
                  margin: EdgeInsets.all(10.w),
                  elevation: 7,
                  shadowColor: AppColors.elevation_card_color,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.sp))),
                  child: Padding(
                    padding: EdgeInsets.all(10.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('select_location'.tr),
                        Text('sup_select_location'.tr),
                        SizedBox(
                          height: 20.h,
                        ),
                        buildButton(
                            colors: AppColors.MAIN_GRADIENT_COLOR,
                            title: "select_map".tr,
                            onTap: () => controller.getPotions()),
                        SizedBox(
                          height: 20.h,
                        ),
                        Card(
                          child: SizedBox(
                            height: 200.h,
                            child: Obx(
                              () => (controller.position.value == null)
                                  ? Container()
                                  : GoogleMap(
                                      onTap: (d) {
                                        if (controller.position.value != null) {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => MapScreen(
                                                  latLong: LatLng(
                                                      controller
                                                          .position.value!.latitude,
                                                      controller.position.value!
                                                          .longitude),
                                                  marker: controller.markers.value),
                                            ),
                                          );
                                        }
                                      },
                                      zoomGesturesEnabled: true,
                                      markers: controller.markers.value,
                                      zoomControlsEnabled: false,
                                      mapType: MapType.hybrid,
                                      initialCameraPosition: CameraPosition(
                                          target: LatLng(
                                              controller.position.value!.latitude,
                                              controller.position.value!.longitude),
                                          zoom: 19.151926040649414),
                                    ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        buildButton(
                          colors: AppColors.SECONDARY_GRADIENT_COLOR,
                          title: "save".tr,
                          onTap: () => controller.save(),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          );
        }
      ),
    );
  }

  Widget buildButton(
      {required void Function()? onTap,
      required String title,
      required List<Color> colors}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 30.h,
        width: Get.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(200.sp),
            ),
            gradient: LinearGradient(colors: colors)),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

/*
save
select_map
*/
