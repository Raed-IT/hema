import 'package:auto_size_text/auto_size_text.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:helper_plugin/ui/images/componentes/privew_image.dart';
import 'package:helper_plugin/utilitis/media_model.dart';
import 'package:school/app/global_components/drawer_component.dart';
import 'package:school/app/modules/parent/pages/home_work_screens/show_home_work_screen/show_home_work_completed.dart';
import 'package:school/app/modules/parent/pages/home_work_screens/show_home_work_screen/show_home_work_controller.dart';

import '../../../../../global_components/appbar_components/main_appbar.dart';
import '../../../../../them/app_colors.dart';
import 'components/send_home_work_bottom_sheet_component.dart';

class ParentShowHomeWorkScreen extends GetView<ParentShowHomeWorkController> {
  ParentShowHomeWorkScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerEnableOpenDragGesture: false,
      drawer: DrawerComponent(),
      body: Builder(builder: (context) {
        return CustomScrollView(
          controller: controller.scrollController,
          physics: const BouncingScrollPhysics(),
          slivers: [
            MainAnimatedAppBarComponent(
              svgUrl: "assets/svg/Homework.svg",
              openDrawer: (conte) => Scaffold.of(conte).openDrawer(),
              scrollController: controller.scrollController,
              supWidgets: [
                const Text(""),
                Text(
                  "عرض اجابتك",
                  style: TextStyle(
                      color: AppColors.ORANG_APP_COLOR,
                      fontWeight: FontWeight.bold,
                      fontSize: 25.sp),
                ),
              ],
            ),
            SliverToBoxAdapter(
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.sp),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(10.w),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.all(14.sp),
                                width: 60.w,
                                height: 60.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10.sp),
                                  ),
                                  gradient: const LinearGradient(
                                      colors: AppColors.MAIN_GRADIENT_COLOR),
                                ),
                                child: SvgPicture.asset(
                                  'assets/svg/Homework.svg',
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 260.w,
                                    child: AutoSizeText(
                                      maxLines: 2,
                                      "${controller.homeWork.title}",
                                      style: TextStyle(
                                          overflow: TextOverflow.ellipsis,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20.sp),
                                    ),
                                  ),
                                  Text(
                                      " ${'material'.tr} : ${controller.homeWork.subject!.name}"),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          width: 1.2,
                                          color: AppColors.DARK_COLOR
                                              .withOpacity(.2),
                                        ),
                                      ),
                                    ),
                                    child: Row(
                                      children: [
                                        Text("${'delivery_date'.tr} : "),
                                        Text(
                                          "${controller.homeWork.endDate}",
                                          style: TextStyle(
                                              fontFamily: "", fontSize: 10.sp),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(),
                    Obx(
                      () => (controller.isShowButton.value)
                          ? GestureDetector(
                              onTap: () => showBottomSheetSendAnswerHomeWork(
                                  context: context),
                              /*showParentSendHomeWorkDialog(
                                  studentId: student.id!, workId: workHome.id!)*/
                              child: Padding(
                                padding: EdgeInsets.all(18.0.sp),
                                child: DottedBorder(
                                  radius: Radius.circular(20.sp),
                                  strokeWidth: 1.sp,
                                  color: AppColors.PRIMARY_COLOR,
                                  dashPattern: const [3, 4],
                                  borderType: BorderType.RRect,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const SizedBox(),
                                      Text(
                                        'send_home_work'.tr,
                                        style: const TextStyle(
                                            color: AppColors.PRIMARY_COLOR),
                                      ),
                                      RotatedBox(
                                        quarterTurns: 2,
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              left: 8.0.w, right: 8.w),
                                          child: const Icon(
                                              Icons.arrow_right_alt_rounded,
                                              color: AppColors.PRIMARY_COLOR),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )
                          : Container(),
                    ),
                    Obx(() {
                      if (controller.homeWorkCompleted.value != null) {
                        return ShowHomeWorkCompleted();
                      } else {
                        return Container();
                      }
                    }),
                    SizedBox(
                      height: 20.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20.w, right: 20.w),
                      child: Text(
                        "شرح الوظيفة:",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15.sp,
                            color: AppColors.PRIMARY_COLOR),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(20.0.w),
                      child: Text(controller.homeWork.info ?? ''),
                    ),
                    (controller.homeWork.images.isNotEmpty)
                        ? Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(8.0.sp),
                                child: GestureDetector(
                                  onTap: () => previewImage(
                                      imagesUrls: controller.homeWork.images
                                          .map((element) => MediaModel(
                                              element.url, element.id))
                                          .toList(),
                                      context: context),
                                  child: Container(
                                    height: 200.h,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20.sp)),
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                              "${controller.homeWork.images[0].url}"),
                                        )),
                                  ),
                                ),
                              ),
                              Center(
                                child: Text(
                                    "${controller.homeWork.images.length}  صورة"),
                              )
                            ],
                          )
                        : Container(),
                  ],
                ),
              ),
            )
          ],
        );
      }),
    );
  }
}
