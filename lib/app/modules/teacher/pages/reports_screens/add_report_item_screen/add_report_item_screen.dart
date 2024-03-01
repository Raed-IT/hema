import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
 import 'package:school/app/global/data/models/report_model.dart';
import 'package:school/app/global/data/models/report_state_model.dart';
import 'package:school/app/global/data/models/student_model.dart';
 import 'package:school/app/global_components/appbar_components/main_appbar.dart';
import 'package:school/app/global_components/drop_down_component.dart';
import 'package:school/app/modules/teacher/pages/reports_screens/add_report_item_screen/add_report_item_controller.dart';

import '../../../../../global/data/enums/report_status_enum.dart';
import '../../../../../them/app_colors.dart';

class TeacherAddReportItemScreen
    extends GetView<TeacherAddReportItemController> {
  const TeacherAddReportItemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        controller: controller.scrollController,
        slivers: [
          MainAnimatedAppBarComponent(
            svgUrl: "assets/svg/report.svg",
            openDrawer: (_) {},
            scrollController: controller.scrollController,
            supWidgets: [
              Text(""),
              Text(
                "اضافة تقييم ",
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
                  SizedBox(
                    height: 10.sp,
                  ),
                  Row(
                    children: [
                      controller.buildDropDownSubject(),
                      SizedBox(
                        width: 10.w,
                      ),
                      Expanded(
                        child: DroDownComponent<ReportStateModel>(
                          title: 'حالة التققيم',
                          selectedModel: controller.selectedReportState,
                          list: RxList(ReportItemStatus.values
                              .map(
                                (e) => ReportStateModel(e.name),
                              )
                              .toList()),
                          isLoadModels: RxBool(false),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.sp,
                  ),
                  DroDownComponent<StudentModel>(
                    title: 'الطلاب',
                    list: controller.students,
                    selectedModel: controller.selectedStudent,
                    isLoadModels: controller.isLoadStudent,
                  ),
                  SizedBox(
                    height: 15.sp,
                  ),
                  DroDownComponent<ReportModel>(
                    title: 'التقارير',
                    list: controller.reports,
                    selectedModel: controller.selectedReport,
                    isLoadModels: controller.isLoadReport,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.w),
                    child: Text(
                      "التقييم من 100 ",
                      style: TextStyle(
                        color: AppColors.PRIMARY_COLOR,
                        fontWeight: FontWeight.bold,
                        fontSize: 14.sp,
                      ),
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
                          } else if (!v.isNumericOnly) {
                            return "الرجاء كتابة التقييم ارقام صحيحة";
                          } else if (int.parse(v) > 100 || int.parse(v) < 0) {
                            return "الرجاء ادخال التقيم بين 0 الى ال 100";
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
                      onTap: () => controller.addReportItem(),
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
                                  Text("إضافة تقييم"),
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
