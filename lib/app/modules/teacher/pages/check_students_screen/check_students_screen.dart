import 'package:async_button/async_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:school/app/global/data/controllers/main_controller.dart';
import 'package:school/app/global/data/models/student_model.dart';
import 'package:school/app/global_components/appbar_components/main_appbar.dart';
import 'package:school/app/global_components/drawer_component.dart';
import '../../../../global_components/lists_components/animation_sliver_list_component.dart';
import '../../../../global_components/lists_components/no_data_component.dart';
import '../../../../them/app_colors.dart';
import 'check_students_controller.dart';
import 'components/build_add_button.dart';
import 'components/build_card.dart';
import 'components/custom_switch.dart';
import 'components/progress_list.dart';

class CheckStudentsScreen extends GetView<CheckStudentsController> {
  CheckStudentsScreen({Key? key}) : super(key: key);
  final ScrollController _searchController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerComponent(),
      body: Builder(builder: (context) {
        return CustomScrollView(
          physics: const BouncingScrollPhysics(),
          controller: _searchController,
          slivers: [
            MainAnimatedAppBarComponent(
              svgUrl: "assets/svg/check.svg",
              openDrawer: (_) {
                Scaffold.of(context).openDrawer();
              },
              scrollController: _searchController,
              supWidgets: [
                Column(
                  children: [
                    Text(
                      "التفقد اليومي".tr,
                      style: TextStyle(
                          color: AppColors.ORANG_APP_COLOR,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Text(
                  "welcome".tr,
                  style: TextStyle(fontSize: 15.sp, color: Colors.white),
                ),
              ],
            ),
            SliverToBoxAdapter(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 20.h,
                    ),
                    const CustomSwitch(),
                    Divider(
                      thickness: 1.2.sp,
                      height: 40.h,
                      endIndent: 30.w,
                      indent: 30.w,
                    ),
                  ],
                ),
              ),
            ),
            Obx(
              () => (controller.isLoad.value)
                  ? ProgressCheckStudentsList()
                  : (controller.students.isNotEmpty)
                      ? AnimationSliverList(
                          length: controller.students.length,
                          builder: (context, index, animation) {
                            return SlideTransition(
                              position: Tween<Offset>(
                                begin: const Offset(0, 1),
                                end: Offset.zero,
                              ).animate(animation),
                              child: BuildCardAttendStudentComponent(
                                isUpdate: controller.attendsDaly.indexWhere(
                                        (element) =>
                                            element.studentId ==
                                            controller.students[index].id!) !=
                                    -1,
                                student: Rx<StudentModel>(
                                    controller.students[index]),
                                attend: controller.attends.firstWhereOrNull(
                                    (p0) =>
                                        p0.studentId ==
                                        controller.students[index].id),
                              ),
                            );
                          },
                        )
                      : NoDataSliverComponent(
                          onTap: () => controller.getData(),
                        ),
            ),
            SliverToBoxAdapter(
              child: (Get.find<MainController>()
                          .setting
                          .value
                          ?.allowAttendTeacher ??
                      false)
                  ? const TeacherAddAttendButtonComponents()
                  : Container(),
            )
          ],
        );
      }),
    );
  }
}
/*
lost غائب
absent غياب مبرر
present حاضر key success
*/
