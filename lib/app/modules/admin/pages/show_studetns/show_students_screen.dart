import 'package:auto_size_text/auto_size_text.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:school/app/global/data/models/student_model.dart';
import 'package:school/app/global_components/appbar_components/main_appbar.dart';
import 'package:school/app/global_components/drawer_component.dart';
import 'package:school/app/modules/admin/pages/show_studetns/show_students_controller.dart';
import 'package:school/app/modules/parent/route/routs.dart';
import 'package:school/app/them/app_colors.dart';

import '../../../../global_components/lists_components/animation_sliver_list_component.dart';
import '../../../../global_components/lists_components/no_data_component.dart';

class AdminShowStudentsScreen extends GetView<AdminShowStudentsController> {
  const AdminShowStudentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Scaffold(
        bottomNavigationBar: Container(
          height: 70.h,
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: AppColors.MAIN_GRADIENT_COLOR),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25.sp),
              topRight: Radius.circular(25.sp),
            ),
          ),
          child: Center(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 30.h,
                  width: 120.w,
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.SCAFFOLD_COLOR),
                    borderRadius: BorderRadius.all(
                      Radius.circular(55.sp),
                    ),
                  ),
                  child: Center(
                      child: Obx(
                    () => Text(
                      "${controller.total.value} \$",
                      style: TextStyle(
                          fontFamily: "", color: AppColors.SCAFFOLD_COLOR),
                    ),
                  )),
                ),
                SizedBox(
                  width: 10.w,
                ),
                SizedBox(
                  height: 30.h,
                  width: 120.w,
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(55.sp))),
                    color: AppColors.ORANG_APP_COLOR,
                    onPressed: () {
                      controller.save();
                    },
                    child: Center(
                      child: Text("حغظ"),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        drawer: const DrawerComponent(),
        body: Builder(builder: (context) {
          return CustomScrollView(
            physics: const BouncingScrollPhysics(),
            controller: controller.scrollController,
            slivers: [
              MainAnimatedAppBarComponent(
                  svgUrl: "assets/svg/Studemt.svg",
                  openDrawer: (_) => Scaffold.of(context).openDrawer(),
                  scrollController: controller.scrollController,
                  supWidgets: [
                    Obx(
                      () => (controller.user.value != null)
                          ? Column(
                              children: [
                                Text(
                                  "طلاب السيد ",
                                  style: TextStyle(
                                      color: AppColors.ORANG_APP_COLOR,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.sp),
                                ),
                                Text(
                                  "${controller.user.value?.name}",
                                  style: TextStyle(
                                      color: AppColors.SCAFFOLD_COLOR,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.sp),
                                ),
                              ],
                            )
                          : Container(),
                    )
                  ]),
              Obx(
                () => (controller.isLoad.value)
                    ? SliverToBoxAdapter(
                        child: SizedBox(
                          height: Get.height / 2,
                          child: Center(
                            child: Lottie.asset('assets/json/loading.json'),
                          ),
                        ),
                      )
                    : (controller.students.isNotEmpty)
                        ? AnimationSliverList(
                            length: controller.students.length,
                            builder: (BuildContext context, int index,
                                Animation<double> animation) {
                              return buildCard(
                                student: controller.students[index],
                              );
                            },
                          )
                        : NoDataSliverComponent(
                            onTap: () => controller.getData(),
                          ),
              ),
            ],
          );
        }),
      );
    });
  }

  Widget buildCard({required StudentModel student}) {
    return SizedBox(
      height: 100.h,
      child: Card(
        shadowColor: AppColors.elevation_color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10.sp),
          ),
        ),
        elevation: 10,
        child: Padding(
          padding: EdgeInsets.all(8.0.sp),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Get.toNamed(ParentAppRoutes.EXPENSES_SCREEN,
                        arguments: {"student": student}),
                    child: Container(
                      margin: EdgeInsets.only(right: 5.w, left: 5.w),
                      height: 80.h,
                      width: 70.w,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage("${student.img}"),
                        ),
                        color: AppColors.PRIMARY_COLOR.withOpacity(.3),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.sp),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () => Get.toNamed(
                            ParentAppRoutes.EXPENSES_SCREEN,
                            arguments: {"student": student}),
                        child: SizedBox(
                          width: 100.w,
                          child: AutoSizeText(
                            maxLines: 1,
                            "${student.fullName}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17.sp),
                          ),
                        ),
                      ),
                      Text(
                        "${student.section?.name}",
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(
                width: 100.w,
                height: 35,
                child: DottedBorder(
                  strokeWidth: 1.sp,
                  color: AppColors.PRIMARY_COLOR,
                  dashPattern: const [3, 4],
                  borderType: BorderType.RRect,
                  radius: Radius.circular(10.sp),
                  padding: const EdgeInsets.all(0),
                  child: SizedBox(
                    height: 35.h,
                    child: TextFormField(
                      initialValue: "${student.amount ?? ''}",
                      onChanged: (val) {
                        if (val.isNotEmpty) {
                          student.amount = double.parse(val);
                        } else {
                          student.amount = null;
                        }
                        controller.calculateTotal();
                      },
                      style: const TextStyle(fontFamily: ""),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.only(right: 10.w, left: 10.w),
                          hintText: "قيمة الدفعة",
                          border: InputBorder.none),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
