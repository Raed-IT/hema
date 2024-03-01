import 'package:carousel_slider/carousel_slider.dart';
import 'package:extended_sliver/extended_sliver.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:school/app/global/route/routs.dart';
import 'package:school/app/global_components/cached_network_image_component.dart';
import 'package:school/app/modules/parent/pages/home_screen/components/build_card_student_component.dart';
import 'package:school/app/modules/parent/pages/home_screen/components/progress_student_list.dart';
import 'package:school/app/modules/parent/pages/home_screen/home_controller.dart';
import 'package:school/app/them/app_colors.dart';
import '../../../../global/data/controllers/main_controller.dart';
import '../../../../global_components/appbar_components/main_appbar.dart';
import '../../../../global_components/lists_components/animation_sliver_list_component.dart';
import '../../../../global_components/lists_components/no_data_component.dart';

//RefreshLoadComponent
class ParentHomeScreen extends GetView<ParentHomeController> {
  const ParentHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return controller.buildScreen(
      isClosable: true,
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: AppColors.PRIMARY_COLOR,
        onPressed: () {
          Get.toNamed(GlobalAppRoutes.POSTES_SCREEN,
              arguments: {"student": null});
        },
        label: Row(
          children: [Text('latest_news'.tr)],
        ),
        heroTag: "articles",
      ),
      appBar: Builder(
        builder: (context) {
          return Obx(
            () => (Get.find<MainController>().setting.value != null)
                ? (Get.find<MainController>()
                        .setting
                        .value!
                        .sliderImages!
                        .isNotEmpty)
                    ? SliverPinnedToBoxAdapter(
                        child: Container(
                          padding: EdgeInsets.only(bottom: 25.h),
                          margin: EdgeInsets.only(bottom: 20.h),
                          height: 265.h,
                          decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                  colors: AppColors.MAIN_GRADIENT_COLOR)),
                          child: SafeArea(
                              child: Column(
                            children: [
                              Row(
                                children: [
                                  Spacer(),
                                  InkWell(
                                    onTap: () {
                                      Scaffold.of(context).openDrawer();
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.all(8.sp),
                                      child: Icon(
                                        Icons.menu,
                                        size: 22.sp,
                                        color: Colors.white,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              CarouselSlider(
                                items: Get.find<MainController>()
                                    .setting
                                    .value!
                                    .sliderImages!
                                    .map(
                                      (e) => CachedNetworkImageComponent(
                                        fit: BoxFit.cover,
                                        borderRadius: BorderRadius.zero,
                                        imageUrl: e,
                                      ),
                                    )
                                    .toList(),
                                options: CarouselOptions(
                                    viewportFraction: 1.1,
                                    disableCenter: true,
                                    autoPlay: false,
                                    onPageChanged: (index, reason) {}),
                              ),
                            ],
                          )),
                        ),
                      )
                    : MainAnimatedAppBarComponent(
                        openDrawer: (conte) => Scaffold.of(conte).openDrawer(),
                        imageProvider: const AssetImage(
                          "assets/custom/logo-school.png",
                        ),
                        supWidgets: [
                          Text(
                            "welcome".tr,
                            style: TextStyle(
                                fontSize: 17.sp,
                                fontWeight: FontWeight.bold,
                                color: AppColors.SCAFFOLD_COLOR),
                          ),
                          Text(
                            Get.find<MainController>().currentUser.value?.name ??
                                '',
                            style: TextStyle(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.bold,
                                color: AppColors.SCAFFOLD_COLOR),
                          )
                        ],
                        scrollController: controller.scrollController!,
                      )
                : MainAnimatedAppBarComponent(
                    openDrawer: (conte) => Scaffold.of(conte).openDrawer(),
                    imageProvider: const AssetImage(
                      "assets/custom/logo-school.png",
                    ),
                    supWidgets: [
                      Text(
                        "welcome".tr,
                        style: TextStyle(
                            fontSize: 17.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColors.SCAFFOLD_COLOR),
                      ),
                      Text(
                        Get.find<MainController>().currentUser.value?.name ?? '',
                        style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColors.SCAFFOLD_COLOR),
                      )
                    ],
                    scrollController: controller.scrollController!,
                  ),
          );
        }
      ),
      widgets: [
        Obx(
          () => (controller.isLoadPagination.value)
              ? const ParentProgressStudentList()
              : (controller.paginationData.isNotEmpty)
                  ? AnimationSliverList(
                      length: controller.paginationData.length,
                      builder: (BuildContext context, int index,
                          Animation<double> animation) {
                        return ParentCardStudentComponent(
                          index: index,
                          student: controller.paginationData[index],
                        );
                      },
                    )
                  : NoDataSliverComponent(
                      onTap: () {
                        controller.getPaginationData(
                          isRefresh: true,
                          isPrintResponse: true,
                        );
                      },
                    ),
        )
      ],
    );
  }
}
