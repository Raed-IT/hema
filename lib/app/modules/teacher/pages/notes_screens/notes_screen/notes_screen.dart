import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:school/app/global/data/routes_api.dart';
import 'package:school/app/global/route/routs.dart';
import 'package:school/app/global_components/appbar_components/main_appbar.dart';
import 'package:school/app/modules/teacher/route/routs.dart';

import '../../../../../global/data/models/notes_model.dart';
import '../../../../../global_components/delete_dialog.dart';
import '../../../../../global_components/lists_components/animation_sliver_list_component.dart';
import '../../../../../global_components/lists_components/no_data_component.dart';
import '../../../../../them/app_colors.dart';
import '../../components/floate_add_button.dart';
import '../components/progress_list_notes.dart';
import 'notes_controller.dart';

class TeacherNotesScreen extends GetView<TeacherNotesController> {
  const TeacherNotesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return controller.buildScreen(
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FloatAddButtonComponent(
        title: 'اضافة ملاحظة',
        onTap: () async {
          var result = await Get.toNamed(TeacherAppRoutes.ADD_NOTES,
              arguments: {
                'student': Get.arguments['student'],
                "department": Get.arguments['department']
              });
          if (result != null) {
            if (result) {
              controller.getPaginationData(isRefresh: true);
            }
          }
        },
        tag: "add_note",
      ),
      widgets: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () => Get.offNamed(GlobalAppRoutes.REPORT_ITEMS,
                        arguments: {
                          'student': Get.arguments['student'],
                          "isTeacher": true
                        }),
                    child: SizedBox(
                      height: 50.h,
                      child: Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.sp),
                          ),
                        ),
                        color: AppColors.PRIMARY_COLOR,
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10.sp),
                              ),
                              gradient: const LinearGradient(
                                  colors: AppColors.MAIN_GRADIENT_COLOR)),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 10.w,
                              ),
                              SvgPicture.asset(
                                'assets/svg/report.svg',
                                width: 50.w,
                                height: 30.h,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              const Text('التقييمات',
                                  style: TextStyle(color: Colors.white)),
                              SizedBox(
                                width: 10.w,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () => Get.toNamed(GlobalAppRoutes.PROFILE_STUDENT,
                        arguments: {'student': Get.arguments['student']}),
                    child: SizedBox(
                      height: 50.h,
                      child: Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.sp),
                          ),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10.sp),
                              ),
                              gradient: const LinearGradient(
                                  colors: AppColors.SECONDARY_GRADIENT_COLOR)),
                          padding: EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 10.w,
                              ),
                              SvgPicture.asset(
                                'assets/svg/Studemt.svg',
                                width: 50.w,
                                height: 30.h,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Text(
                                'profile'.tr,
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Divider(
                thickness: 1.2.sp,
                indent: 30.w,
                endIndent: 30.w,
                height: 40.h,
              ),
            ],
          ),
        ),
        Obx(
          () => (controller.isLoadPagination.value)
              ? ProgressNotesList()
              : (controller.paginationData.isNotEmpty)
                  ? AnimationSliverList(
                      length: controller.paginationData.length,
                      builder: (context, index, animation) {
                        return SlideTransition(
                          position: Tween<Offset>(
                            begin: Offset(0, 1),
                            end: Offset.zero,
                          ).animate(animation),
                          child: buildNotesCard(
                              context: context,
                              note: controller.paginationData[index]),
                        );
                      },
                    )
                  : NoDataSliverComponent(
                      onTap: () =>
                          controller.getPaginationData(isRefresh: true),
                    ),
        )
      ],
      appBar: MainAnimatedAppBarComponent(
          svgUrl: "assets/svg/title.svg",
          openDrawer: (c) {
            Scaffold.of(c).openDrawer();
          },
          scrollController: controller.scrollController!,
          supWidgets: [
            Text(
              "ملاحظات الطالب",
              style: TextStyle(
                  color: AppColors.ORANG_APP_COLOR,
                  fontWeight: FontWeight.bold,
                  fontSize: 25.sp),
            ),
            Text(
              "${controller.student.fullName} ",
              style:
                  TextStyle(color: AppColors.SCAFFOLD_COLOR, fontSize: 17.sp),
            ),
          ]),
    );
  }

  Widget buildNotesCard(
      {required NotesModel note, required BuildContext context}) {
    return Container(
      margin: EdgeInsets.only(top: 10.h),
      constraints: BoxConstraints(minHeight: 100.h),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(15.sp),
          ),
        ),
        elevation: 7,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(10.sp),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          width: 1,
                          color: AppColors.DARK_COLOR.withOpacity(.2),
                        ),
                      ),
                    ),
                    child: Text(note.createdAt!),
                  ),
                  SizedBox(
                    width: 30.w,
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 5.h),
                      decoration: BoxDecoration(
                          color: (note.status == "success")
                              ? AppColors.SECONDARY_COLOR.withOpacity(0.5)
                              : Colors.red.withOpacity(0.5).withOpacity(0.5),
                          borderRadius:
                              BorderRadius.all(Radius.circular(55.sp))),
                      child: Center(
                        child: Text(
                          "${note.subjectName != null && note.subjectName!.isNotEmpty ? note.subjectName : 'لم يتم تحديد المادة'}",
                          style: TextStyle(
                            color: AppColors.SCAFFOLD_COLOR,
                            fontSize: 15.sp,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 30.w,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      (note.status == 'success')
                          ? const Icon(Icons.check_box_outlined,
                              color: Colors.green)
                          : const Icon(Icons.cancel_outlined,
                              color: Colors.red),
                      SizedBox(
                        width: 10.w,
                      ),
                    ],
                  )
                ],
              ),
            ),
            Divider(
              thickness: 1.2.sp,
              indent: 10.w,
              endIndent: 10.w,
            ),
            Row(
              children: [
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.all(10.sp),
                    child: Text("${note.note}"),
                  ),
                )
              ],
            ),
            Row(
              children: [
                SizedBox(
                  width: 10.w,
                ),
                Text(
                  note.sender ?? '',
                  style: TextStyle(
                      color: AppColors.PRIMARY_COLOR,
                      fontWeight: FontWeight.bold,
                      fontSize: 12.sp),
                ),
                Expanded(
                  child: Container(),
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              children: [
                buildButton(
                  title: 'تعديل',
                  onTap: () async {
                    var result = await Get.toNamed(TeacherAppRoutes.UPDATE_NOTE,
                        arguments: {
                          "note": note,
                          "student": controller.student
                        });
                    if (result != null) {
                      if (result) {
                        controller.getPaginationData(isRefresh: true);
                      }
                    }
                  },
                ),
                buildButton(
                    title: 'حذف',
                    onTap: () => showDeleteDialog(
                        context: context,
                        content: note.note ?? '',
                        title: "حذف ملاحظة",
                        onDelete: () => controller.deleteNote(note)),
                    colors: AppColors.SECONDARY_GRADIENT_COLOR),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget buildButton(
      {required String title,
      List<Color>? colors = AppColors.MAIN_GRADIENT_COLOR,
      required void Function()? onTap}) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: SizedBox(
          height: 40.h,
          child: Card(
            elevation: 7,
            shadowColor: AppColors.elevation_color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(15.sp),
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15.sp)),
                  gradient: LinearGradient(colors: colors!)),
              child: Center(
                child: Text(
                  title,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
