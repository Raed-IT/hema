import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:school/app/global_components/appbar_components/main_appbar.dart';
import 'package:school/app/modules/teacher/pages/reports_screens/update_report_item_screen/update_report_item_controller.dart';

import '../../../../../global/data/enums/report_status_enum.dart';
import '../../../../../them/app_colors.dart';

class TeacherUpdateReportItemScreen
    extends GetView<TeacherUpdateReportItemController> {
  const TeacherUpdateReportItemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        controller: controller.scrollController,
        slivers: [
          MainAnimatedAppBarComponent(
            svgUrl: "assets/svg/report.svg",
            openDrawer: (_) {},
            scrollController: controller.scrollController,
            supWidgets: [
              Text(""),
              Text(
                "تعديل تقييم ",
                style: TextStyle(
                    color: AppColors.ORANG_APP_COLOR,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
          SliverToBoxAdapter(
              child: Form(
            key: controller.formState,
            child: Padding(
              padding: EdgeInsets.all(8.0.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      controller.buildDropDownSubject(),
                      SizedBox(
                        width: 10.w,
                      ),
                      Obx(
                        () => Expanded(
                          child: DottedBorder(
                            padding: EdgeInsets.only(right: 10.w, left: 10.w),
                            radius: Radius.circular(50.sp),
                            strokeWidth: 1.sp,
                            color: AppColors.PRIMARY_COLOR,
                            dashPattern: const [3, 4],
                            borderType: BorderType.RRect,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50.sp)),
                              ),
                              height: 30.h,
                              child: DropdownButton(
                                value: controller.selectedReportState.value,
                                underline: Container(),
                                elevation: 0,
                                alignment: Alignment.center,
                                isExpanded: true,
                                hint: Text(
                                  'حالة التقرير'.tr,
                                ),
                                onChanged: (newValue) {},
                                iconDisabledColor: AppColors.PRIMARY_COLOR,
                                iconEnabledColor: AppColors.SECONDARY_COLOR,
                                items:
                                    ReportItemStatus.values.map((reportStatus) {
                                  return DropdownMenuItem(
                                    onTap: () {
                                      controller.selectedReportState.value =
                                          reportStatus.name;
                                    },
                                    value: reportStatus.name,
                                    child: Text(
                                      reportStatus.name.toReportItemName(),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10.sp,
                  ),
                  Obx(() => DottedBorder(
                        padding: EdgeInsets.only(right: 10.w, left: 10.w),
                        radius: Radius.circular(50.sp),
                        strokeWidth: 1.sp,
                        color: AppColors.PRIMARY_COLOR,
                        dashPattern: const [3, 4],
                        borderType: BorderType.RRect,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(50.sp)),
                          ),
                          height: 30.h,
                          child: DropdownButton(
                            value: controller.selectedStudent.value,
                            underline: Container(),
                            disabledHint: (controller.isLoad.value)
                                ? SizedBox(
                                    height: 20.h,
                                    width: 20.w,
                                    child: CircularProgressIndicator(
                                      color: AppColors.SECONDARY_COLOR,
                                      strokeWidth: 2.sp,
                                    ))
                                : Center(
                                    child: Text('لايوجد طلاب'.tr),
                                  ),
                            elevation: 0,
                            alignment: Alignment.center,
                            isExpanded: true,
                            hint: Text(
                              'الطالب'.tr,
                            ),
                            onChanged: (newValue) {},
                            iconDisabledColor: AppColors.PRIMARY_COLOR,
                            iconEnabledColor: AppColors.SECONDARY_COLOR,
                            items: controller.students.map((selectedSubject) {
                              return DropdownMenuItem(
                                enabled: (controller.selectedStudent.value ==
                                        selectedSubject)
                                    ? false
                                    : true,
                                onTap: () {
                                  controller.selectedStudent.value =
                                      selectedSubject;
                                },
                                value: selectedSubject,
                                child: Text(
                                  "${selectedSubject.name}",
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      )),
                  Padding(
                    padding: EdgeInsets.all(10.w),
                    child: Text(
                      "التقييم من 100 ",
                      style: TextStyle(
                          color: AppColors.PRIMARY_COLOR,
                          fontWeight: FontWeight.bold,
                          fontSize: 14.sp),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 10.w, left: 10.w),
                    child: DottedBorder(
                      padding: EdgeInsets.zero,
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
                        controller: controller.ratioController,
                        decoration: InputDecoration(
                          hintText: 'التقييم من 100  '.tr,
                          hintStyle:
                              const TextStyle(color: AppColors.DARK_COLOR),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(500.sp),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.w),
                    child: Text(
                      "اضف الشرح",
                      style: TextStyle(
                          color: AppColors.PRIMARY_COLOR,
                          fontWeight: FontWeight.bold,
                          fontSize: 14.sp),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 10.w, left: 10.w),
                    child: DottedBorder(
                      strokeWidth: 1.sp,
                      color: AppColors.DARK_COLOR.withOpacity(.7),
                      dashPattern: const [3, 4],
                      borderType: BorderType.RRect,
                      radius: Radius.circular(10.sp),
                      child: TextFormField(
                        minLines: 10,

                        controller: controller.infoController,
                        decoration: InputDecoration(
                          hintText: 'اكتب الملاحظة هنا '.tr,
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
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0.sp),
                    child: InkWell(
                      onTap: () => controller.updateReportItem(),
                      child: DottedBorder(
                        strokeWidth: 1.sp,
                        color: AppColors.DARK_COLOR.withOpacity(.7),
                        dashPattern: const [3, 4],
                        borderType: BorderType.RRect,
                        radius: Radius.circular(500.sp),
                        child: SizedBox(
                          height: 30.h,
                          child: Card(
                            elevation: 0,
                            child: Center(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Spacer(),
                                  Icon(
                                    Icons.update,
                                    color: AppColors.DARK_COLOR.withOpacity(.8),
                                    size: 15.sp,
                                  ),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  Text("تعديل التقييم"),
                                  const Spacer(),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }
}
