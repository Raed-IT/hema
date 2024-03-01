import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:school/app/global_components/appbar_components/main_appbar.dart';
import 'package:school/app/global_components/drawer_component.dart';
import 'package:school/app/modules/teacher/pages/home_work_screens/update_home_work/update_home_work_controller.dart';

import '../../../../../them/app_colors.dart';
import 'component/date_picker_component.dart';

class UpdateHomeWorkScreen extends GetView<UpdateHomeWorkController> {
  const UpdateHomeWorkScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerComponent(),
      body: Builder(
        builder: (context) {
          return CustomScrollView(
            physics: const BouncingScrollPhysics(),
            controller: controller.scrollController,
            slivers: [
              MainAnimatedAppBarComponent(
                svgUrl: "assets/svg/Homework.svg",
                openDrawer: (_) {
                  Scaffold.of(context).openDrawer();
                },
                scrollController: controller.scrollController,
                supWidgets: [
                  Text(
                    "تعديل الوظيفة",
                    style: TextStyle(
                        color: AppColors.ORANG_APP_COLOR,
                        fontWeight: FontWeight.bold,
                        fontSize: 22.sp),
                  ),
                ],
              ),
              SliverToBoxAdapter(
                child: Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.sp),
                    ),
                  ),
                  margin: EdgeInsets.all(10.w),
                  child: DottedBorder(
                    strokeWidth: 1.sp,
                    color: AppColors.DARK_COLOR.withOpacity(.7),
                    dashPattern: const [3, 4],
                    borderType: BorderType.RRect,
                    radius: Radius.circular(10.sp),
                    child: Form(
                      key: controller.formKey,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10.w,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 10.w,
                              ),
                              controller.buildDropDownSubject(),
                              SizedBox(
                                width: 30.w,
                              ),
                              //TODO build date picker
                              DatePickerUpdateJobComponent(),
                              SizedBox(
                                width: 10.w,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10.w,
                          ),
                          Padding(
                            padding: EdgeInsets.all(20.w),
                            child: Obx(
                              () => controller.buildPickerImagesWidget(
                                  context: context,
                                  isDeletableNetworkImage: true,
                                  onDeleteNetworkImage: (img) =>
                                      controller.deleteImage(img),
                                  imageCount: 3,
                                  imagesUrls: controller.homeWork.images),
                            ),
                          ),
                          SizedBox(height: 20.h),
                          Container(
                            margin: EdgeInsets.only(right: 15.w, left: 15.w),
                            child: DottedBorder(
                              strokeWidth: 1.sp,
                              color: AppColors.DARK_COLOR.withOpacity(.7),
                              dashPattern: const [3, 4],
                              borderType: BorderType.RRect,
                              radius: Radius.circular(10.sp),
                              child: TextFormField(
                                validator: (v) {
                                  if (v!.isEmpty) {
                                    return "required".tr;
                                  }
                                  return null;
                                },
                                controller: controller.titleController,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(
                                      top: 00.sp,
                                      bottom: 0.sp,
                                      left: 10.w,
                                      right: 10.w),
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(500.sp),
                                  ),
                                  hintText: 'title_home_work'.tr,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 15.w, left: 15.w),
                            child: TextFormField(
                              controller: controller.infoController,
                              decoration: InputDecoration(
                                hintText: 'desc_home_work'.tr,
                                hintStyle:
                                    const TextStyle(color: AppColors.DARK_COLOR),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(500.sp),
                                ),
                              ),
                              maxLines: null,
                              keyboardType: TextInputType.multiline,
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Divider(
                            endIndent: 20.w,
                            indent: 20.w,
                            color: AppColors.DARK_COLOR.withOpacity(.12),
                            thickness: 1.2.sp,
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          InkWell(
                            onTap: () {
                              if (!controller.isUpdate.value) {
                                controller.updateHomeWork();
                              } else {
                                print('ldkflk');
                              }
                            },
                            child: DottedBorder(
                              strokeWidth: 1.sp,
                              color: AppColors.DARK_COLOR.withOpacity(.7),
                              dashPattern: const [3, 4],
                              borderType: BorderType.RRect,
                              radius: Radius.circular(500.sp),
                              child: SizedBox(
                                width: 130.w,
                                height: 30.h,
                                child: const Center(
                                  child: Text(
                                    "تعديل ",
                                    style: TextStyle(
                                        color: AppColors.ORANG_APP_COLOR,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20.w,
                          ),
                        ],
                      ),
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
}
