import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:school/app/global_components/appbar_components/main_appbar.dart';
import 'package:school/app/global_components/drawer_component.dart';
import '../../../../../them/app_colors.dart';
import 'add_home_work_controller.dart';
import 'components/date_picker_component.dart';

class TeacherAddHomeWorkScreen extends GetView<TeacherAddHomeWorkController> {
  const TeacherAddHomeWorkScreen({super.key});

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
                  Text(""),
                  Text(
                    "اضافة وظيفة",
                    style: TextStyle(
                        color: AppColors.ORANG_APP_COLOR,
                        fontWeight: FontWeight.bold,
                        fontSize: 25.sp),
                  )
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
                                width: 10.w,
                              ),
                              //TODO build date picker
                              DatePickerAddJobComponent(),
                              SizedBox(
                                width: 10.w,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10.w,
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0.w),
                            // child: const PickerImageAddHomeWorkComponent(),
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
                                    return "مطلوب";
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
                                  hintText: 'عنوان الوظيفة',
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(15.sp),
                            child: controller.buildPickerImagesWidget(
                                context: context, imageCount: 3),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 15.w, left: 15.w),
                            child: TextFormField(
                              controller: controller.infoController,
                              decoration: InputDecoration(
                                hintText: 'شرح عن الوظيفة',
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
                              controller.addHomeWork();
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
                                child: Center(
                                  child: Text(
                                    "اضافة",
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
