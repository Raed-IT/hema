import 'package:animated_number/animated_number.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:school/app/global/data/constants.dart';
import 'package:school/app/global/data/controllers/main_controller.dart';
import 'package:school/app/global_components/appbar_components/main_appbar.dart';
import 'package:school/app/modules/admin/pages/home_screen/home_controller.dart';
import 'package:school/app/modules/admin/route/routs.dart';
import 'package:school/app/them/app_colors.dart';

import '../../../../global_components/drawer_component.dart';
import 'package:lottie/lottie.dart';

class AdminHomeScreen extends GetView<AdminHomeController> {
  const AdminHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerComponent(),
      body: Builder(builder: (context) {
        return CustomScrollView(
          physics: const BouncingScrollPhysics(),
          controller: controller.scrollController,
          slivers: [
            MainAnimatedAppBarComponent(
                imageProvider:
                    const AssetImage("assets/custom/logo-school.png"),
                openDrawer: (_) => Scaffold.of(context).openDrawer(),
                scrollController: controller.scrollController,
                supWidgets: [
                  const Text(""),
                  Text(
                    Constants.SCHOOL_NAME,
                    style: TextStyle(
                        color: AppColors.ORANG_APP_COLOR,
                        fontWeight: FontWeight.bold,
                        fontSize: 17.sp),
                  )
                ]),
            Obx(() => (controller.isLoad.value)
                ? SliverToBoxAdapter(
                    child: SizedBox(
                      height: Get.height / 2,
                      child: Center(
                        child: Lottie.asset('assets/json/loading.json'),
                      ),
                    ),
                  )
                : SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.all(10.sp),
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () async {
                              String barcodeScanRes =
                                  await FlutterBarcodeScanner.scanBarcode(
                                      "#FAAF2DFF", "الغاء", true, ScanMode.QR);
                              if (barcodeScanRes != "-1") {
                                Get.toNamed(AdminAppRoutes.SHOW_STUDENTS,
                                    arguments: {'qr': barcodeScanRes});
                              }
                            },
                            child: SizedBox(
                              height: 100.h,
                              width: Get.width,
                              child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10.sp),
                                    ),
                                  ),
                                  elevation: 10,
                                  shadowColor: Colors.black45,
                                  child: Padding(
                                    padding: EdgeInsets.all(10.sp),
                                    child: Row(
                                      children: [
                                        Icon(
                                          FontAwesomeIcons.qrcode,
                                          size: 40.sp,
                                          color: AppColors.ORANG_APP_COLOR,
                                        ),
                                        SizedBox(
                                          width: 20.w,
                                        ),
                                        Text(
                                          "قراءة براكود ",
                                          style: TextStyle(
                                              fontSize: 20.sp,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ],
                                    ),
                                  )),
                            ).animate().slide(
                                begin: const Offset(0, 1),
                                duration: const Duration(milliseconds: 150)),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              buildCubWidget(
                                      endVal: controller.statistics!.section!,
                                      title: "عدد الصفوف",
                                      icon: FontAwesomeIcons.buildingFlag)
                                  .animate()
                                  .slide(
                                      begin: const Offset(0, 1),
                                      duration:
                                          const Duration(milliseconds: 200))
                                  .fadeIn(),
                              buildCubWidget(
                                      endVal: controller.statistics!.section!,
                                      title: "عدد الشعب",
                                      icon: FontAwesomeIcons.building)
                                  .animate()
                                  .slide(
                                      begin: const Offset(0, 1),
                                      duration:
                                          const Duration(milliseconds: 250))
                                  .fadeIn(),
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              buildCubWidget(
                                      endVal: controller.statistics!.student!,
                                      title: "عدد الطلاب",
                                      icon: FontAwesomeIcons.buildingFlag)
                                  .animate()
                                  .slide(
                                      begin: Offset(0, 1),
                                      duration: Duration(milliseconds: 200))
                                  .fadeIn(),
                              buildCubWidget(
                                      endVal: controller.statistics!.employee!,
                                      title: "عدد الموظفين",
                                      icon: FontAwesomeIcons.building)
                                  .animate()
                                  .slide(
                                      begin: const Offset(0, 1),
                                      duration:
                                          const Duration(milliseconds: 250))
                                  .fadeIn(),
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              buildCubWidget(
                                      endVal: controller.statistics!.exams!,
                                      title: "عدد الامتحانات",
                                      icon: FontAwesomeIcons.readme)
                                  .animate()
                                  .slide(
                                      begin: const Offset(0, 1),
                                      duration:
                                          const Duration(milliseconds: 200))
                                  .fadeIn(),
                              buildCubWidget(
                                      endVal:
                                          controller.statistics!.futureExams!,
                                      title: "عدد الامتحانات القادمة",
                                      icon: FontAwesomeIcons.readme)
                                  .animate()
                                  .slide(
                                      begin: const Offset(0, 1),
                                      duration:
                                          const Duration(milliseconds: 250))
                                  .fadeIn(),
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              buildCubWidget(
                                      endVal:
                                          controller.statistics!.totalBalances!,
                                      title: "اجمالي الرصيد",
                                      icon: FontAwesomeIcons.scaleBalanced)
                                  .animate()
                                  .slide(
                                      begin: const Offset(0, 1),
                                      duration:
                                          const Duration(milliseconds: 200))
                                  .fadeIn(),
                              // buildCubWidget(
                              //         endVal: controller.statistics!.total!,
                              //         title: "اجمالي الرصيد",
                              //         icon: FontAwesomeIcons.scaleBalanced)
                              //     .animate()
                              //     .slide(
                              //         begin: const Offset(0, 1),
                              //         duration:
                              //             const Duration(milliseconds: 250))
                              //     .fadeIn(),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ))
          ],
        );
      }),
    );
  }

  Widget buildCubWidget(
      {required num endVal, required String title, required IconData icon}) {
    return SizedBox(
      height: 160.h,
      width: 165.w,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10.sp),
          ),
        ),
        elevation: 10,
        shadowColor: Colors.black45,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: AppColors.ORANG_APP_COLOR,
                size: 30.sp,
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                title,
                style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10.h,
              ),
              AnimatedNumber(
                startValue: 0,
                endValue: endVal,
                duration: const Duration(seconds: 1),
                isFloatingPoint: false,
                style: TextStyle(
                  fontFamily: "",
                  fontWeight: FontWeight.bold,
                  color: AppColors.ORANG_APP_COLOR,
                  fontSize: 17.sp,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
