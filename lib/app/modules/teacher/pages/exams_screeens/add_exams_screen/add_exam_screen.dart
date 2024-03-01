import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:school/app/global_components/appbar_components/main_appbar.dart';
import 'package:school/app/global_components/drawer_component.dart';

import '../../../../../them/app_colors.dart';
import 'add_exam_controller.dart';
import 'components/date_picker_component.dart';

class AddQuizzesScreen extends GetView<TeacherAddExamController> {
  const AddQuizzesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerComponent(),
      body: Builder(
        builder: (context) {
          return CustomScrollView(
            controller: controller.scrollController,
            physics: const BouncingScrollPhysics(),
            slivers: [
              MainAnimatedAppBarComponent(
                  svgUrl: "assets/svg/report.svg",
                  openDrawer: (_) {
                    Scaffold.of(context).openDrawer();
                  },
                  scrollController: controller.scrollController,
                  supWidgets: [
                    Text(""),
                    Text(
                      "إضافة إختبار",
                      style: TextStyle(
                          color: AppColors.ORANG_APP_COLOR,
                          fontWeight: FontWeight.bold,
                          fontSize: 25.sp),
                    )
                  ]),
              SliverToBoxAdapter(
                child: Card(
                  margin: EdgeInsets.all(20.w),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.sp),
                    ),
                  ),
                  shadowColor: AppColors.elevation_color,
                  elevation: 7,
                  child: Form(
                    key: controller.formKey,
                    child: Padding(
                      padding: EdgeInsets.all(10.w),
                      child: Column(
                        children: [
                          DottedBorder(
                            strokeWidth: 1.sp,
                            color: AppColors.DARK_COLOR.withOpacity(.7),
                            dashPattern: const [3, 4],
                            borderType: BorderType.RRect,
                            radius: Radius.circular(200.sp),
                            child: SizedBox(
                              height: 40.h,
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
                                  hintText: 'عنوان الإمتحات '.tr,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Row(
                            children: [
                              controller.buildDropDownSubject(),
                              SizedBox(
                                width: 20.w,
                              ),
                              const DatePickerAddQuizzesComponent(),
                            ],
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          DottedBorder(
                            strokeWidth: 1.sp,
                            color: AppColors.DARK_COLOR.withOpacity(.7),
                            dashPattern: const [3, 4],
                            borderType: BorderType.RRect,
                            radius: Radius.circular(10.sp),
                            child: TextFormField(
                              minLines: 3,
                              validator: (v) {
                                if (v!.isEmpty) {
                                  return "required".tr;
                                }
                                return null;
                              },
                              controller: controller.descController,
                              decoration: InputDecoration(
                                hintText: "شرح عن الإمتحان ",
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
                            height: 20.h,
                          ),
                          controller.buildPickerImagesWidget(
                              context: context, imageCount: 3),
                          SizedBox(
                            height: 50.h,
                          ),
                          GestureDetector(
                            onTap: () => controller.addExam(),
                            child: Container(
                              height: 40.h,
                              width: double.maxFinite,
                              margin: EdgeInsets.only(top: 20.w, right: 20.w),
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.sp)),
                                gradient: const LinearGradient(
                                    colors: AppColors.MAIN_GRADIENT_COLOR),
                              ),
                              child: Center(
                                child: Text(
                                  'إضافة الإختبار'.tr,
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
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
