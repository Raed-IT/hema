import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:school/app/global/pages/student_profile_screen/student_profile_controller.dart';
import 'package:school/app/global_components/appbar_components/horizontal_appbar_component.dart';
import 'package:school/app/global_components/drawer_component.dart';

import '../../../them/app_colors.dart';

class StudentProfileScreen extends GetView<StudentProfileController> {
  StudentProfileScreen({Key? key}) : super(key: key);
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerComponent(),
      body: Builder(
        builder: (context) {
          return CustomScrollView(
            controller: controller.scrollController,
            slivers: [
              HorizontalAnimatedAppBarComponent(
                imageProvider: NetworkImage("${controller.student.img}"),
                openDrawer: () {
                  Scaffold.of(context).openDrawer();
                },
                scrollController: controller.scrollController,
                supWidgets: [
                  Text(""),
                  Text(
                    "${controller.student.fullName}",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: AppColors.SCAFFOLD_COLOR,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    SizedBox(
                      height: 30.h,
                    ),
                    Divider(
                      endIndent: 20.w,
                      indent: 20.w,
                      height: 45.h,
                      thickness: 1.2.sp,
                    ),
                  ],
                ),
              ),
              LiveSliverList(
                showItemDuration: Duration(milliseconds: 200),
                showItemInterval: Duration(seconds: 0),
                delay: const Duration(milliseconds: 0),
                reAnimateOnVisibility: true,
                controller: _scrollController,
                itemCount: 1,
                itemBuilder: (context, index, animation) {
                  return SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(0, 1.5),
                      end: Offset.zero,
                    ).animate(animation),
                    child: Padding(
                      padding: EdgeInsets.all(18.0.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          buildRow(
                              value: controller.student.section?.name ?? '',
                              key: "${'section'.tr}:"),
                          buildRow(
                              value: controller.student.department?.name ?? '',
                              key: "${'department'.tr}:"),
                          buildRow(
                              value: controller.student.mother ?? '',
                              key: "اسم الأم :"),
                          buildRow(
                              value: controller.student.father ?? '',
                              key: "اسم الأب :"),
                          buildRow(value: "${controller.student.id}", key: "ID:"),
                        ],
                      ),
                    ),
                  );
                },
              )
            ],
          );
        }
      ),
    );
  }

  Widget buildRow({required String key, required String value}) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              width: 20.w,
            ),
            Text(
              key,
              style: const TextStyle(color: AppColors.DARK_COLOR),
            ),
            SizedBox(
              width: 40.w,
            ),
            Text(
              value,
              style: const TextStyle(color: AppColors.DARK_COLOR),
            ),
          ],
        ),
        Divider(
          thickness: 1.2.sp,
        ),
        SizedBox(
          height: 20.h,
        )
      ],
    );
  }
}
