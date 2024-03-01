import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:school/app/global/data/models/student_model.dart';
import 'package:school/app/global_components/appbar_components/main_appbar.dart';
import 'package:school/app/global_components/drawer_component.dart';
import 'package:school/app/modules/teacher/pages/marker_screens/marcker_screen/marker_controller.dart';

import '../../../../../global/data/models/exam_model.dart';
import '../../../../../global_components/drop_down_component.dart';
import '../../../../../global_components/lists_components/animation_sliver_list_component.dart';
import '../../../../../global_components/lists_components/no_data_component.dart';
import '../../../../../them/app_colors.dart';
import '../../check_students_screen/components/progress_list.dart';
import 'components/build_card.dart';
import 'components/custom_switch.dart';
import 'components/save_button_component.dart';

class TeacherMarkerScreen extends GetView<TeacherMarkerController> {
  const TeacherMarkerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerComponent(),
      body: Form(
        key: controller.formKye,
        child: Builder(
          builder: (context) {
            return CustomScrollView(
              controller: controller.scrollController,
              physics: const BouncingScrollPhysics(),
              slivers: [
                MainAnimatedAppBarComponent(
                    svgUrl: "assets/svg/results.svg",
                    openDrawer: (_) {
                   Scaffold.of(context).openDrawer();
                    },
                    scrollController: controller.scrollController,
                    supWidgets: [
                      Text(
                        "العلامات ",
                        style: TextStyle(
                            color: AppColors.ORANG_APP_COLOR,
                            fontWeight: FontWeight.bold,
                            fontSize: 25.sp),
                      ),
                      Text(
                        "اضافة العلامات",
                        style: TextStyle(
                            color: AppColors.SCAFFOLD_COLOR, fontSize: 15.sp),
                      ),
                    ]),
                SliverToBoxAdapter(
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.all(10.sp),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 20.h,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: SizedBox(
                                    height: 35.h, child: CustomSwitchMarker()),
                              ),
                              SizedBox(
                                width: 15.w,
                              ),
                              Expanded(
                                child: DroDownComponent<ExamModel>(
                                  title: 'الاختبار',
                                  list: controller.exams,
                                  selectedModel: controller.selectedExam,
                                  isLoadModels: controller.isLoadExams,
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          Divider(
                            thickness: 1.2.sp,
                            height: 10.h,
                            endIndent: 30.w,
                            indent: 30.w,
                          ),
                        ],
                      ),
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
                                  child: TeacherBuildCardMarkStudentComponent(
                                    student: Rx<StudentModel>(
                                        controller.students[index]),
                                    mark: controller.localActualMarks.firstWhereOrNull(
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
                Obx(() => (controller.students.isNotEmpty)
                    ? SliverToBoxAdapter(child: TeacherAddMarksButtonComponents())
                    : SliverToBoxAdapter())
              ],
            );
          }
        ),
      ),
    );
  }
}
