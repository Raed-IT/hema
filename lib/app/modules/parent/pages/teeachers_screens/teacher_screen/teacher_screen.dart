import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:school/app/modules/parent/pages/teeachers_screens/teacher_screen/teacher_controller.dart';
import 'package:school/app/modules/parent/route/routs.dart';
import '../../../../../global/data/models/teacher_model.dart';
import '../../../../../global_components/appbar_components/main_appbar.dart';
import '../../../../../global_components/drawer_component.dart';
import '../../../../../global_components/lists_components/animation_sliver_list_component.dart';
import '../../../../../global_components/lists_components/no_data_component.dart';
import '../../../../../them/app_colors.dart';
import 'components/progress_list.dart';

class ParentTeacherScreen extends GetView<ParentTeacherController> {
  const ParentTeacherScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerEnableOpenDragGesture: false,
      drawer: const DrawerComponent(),
      body: Builder(builder: (context) {
        return CustomScrollView(
          controller: controller.scrollController,
          physics: const BouncingScrollPhysics(),
          slivers: [
            MainAnimatedAppBarComponent(
              herTag: "teacher-tag",
              openDrawer: (conte) => Scaffold.of(conte).openDrawer(),
              scrollController: controller.scrollController,
              svgUrl: "assets/svg/teacher.svg",
              supWidgets: [
                Text(""),
                Text(
                  "المدرسين",
                  style: TextStyle(
                      color: AppColors.ORANG_APP_COLOR,
                      fontWeight: FontWeight.bold,
                      fontSize: 25.sp),
                ),
              ],
            ),
            Obx(
              () => (controller.isLoad.value)
                  ? const ParentProgressListTeacher()
                  : (controller.teachers.isNotEmpty)
                      ? AnimationSliverList(
                          builder: (BuildContext context, int index,
                              Animation<double> animation) {
                            return buildCardTeacher(
                                teacher: controller.teachers[index],
                                context: context);
                          },
                          length: controller.teachers.length,
                        )
                      : NoDataSliverComponent(
                          onTap: () => controller.getData( ),
                        ),
            )
          ],
        );
      }),
    );
  }

  Widget buildCardTeacher(
      {required TeacherModel teacher, required BuildContext context}) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10.sp),
        ),
      ),
      elevation: 10,
      shadowColor: AppColors.elevation_card_color,
      margin: EdgeInsets.only(left: 10.w, right: 10.w, top: 10.h),
      child: Container(
        padding: EdgeInsets.all(10.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Hero(
                  tag: teacher.id.toString(),
                  child: (teacher.img!.isEmpty)
                      ? Container(
                          padding: EdgeInsets.all(12.sp),
                          height: 70.h,
                          width: 70.w,
                          child: SvgPicture.asset(
                            'assets/svg/teacher.svg',
                            fit: BoxFit.contain,
                            color: AppColors.PRIMARY_COLOR,
                          ),
                        )
                      : Container(
                          height: 70.h,
                          width: 70.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(15.sp),
                            ),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage("${teacher.img}"),
                            ),
                          ),
                        ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("${teacher.name}"),
                    Text(
                        "${controller.student.section?.name ?? ''} / ${controller.student.department?.name ?? ''}"),
                  ],
                ),
              ],
            ),
            Column(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 10.w, right: 10.w),
                  width: 90.w,
                  height: 30.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.sp),
                    ),
                  ),
                  child: GestureDetector(
                    onTap: () => Get.toNamed(ParentAppRoutes.SHOW_TEACHER,
                        arguments: {"teacher": teacher}),
                    child: DottedBorder(
                      radius: Radius.circular(12.sp),
                      strokeWidth: 1.sp,
                      color: AppColors.PRIMARY_COLOR,
                      dashPattern: const [3, 4],
                      borderType: BorderType.RRect,
                      child: Center(
                        child: Text('profile'.tr),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
