import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:school/app/global_components/appbar_components/main_appbar.dart';
import 'package:school/app/modules/teacher/pages/notes_screens/update_note_screen/update_note_controller.dart';

import '../../../../../them/app_colors.dart';
import 'components/drop_down_status.dart';

class TeacherUpdateNoteScreen extends GetView<TeacherUpdateNoteController> {
  const TeacherUpdateNoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        controller: controller.scrollController,
        slivers: [
          MainAnimatedAppBarComponent(
              svgUrl: "assets/svg/sticky-notes.svg",
              openDrawer: (_) {},
              scrollController: controller.scrollController,
              supWidgets: [
                Text(""),
                Text(
                  "تعديل ملاحظة",
                  style: TextStyle(
                      color: AppColors.ORANG_APP_COLOR,
                      fontWeight: FontWeight.bold,
                      fontSize: 25.sp),
                ),
              ]),
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
                          const DropdownStatusUpdateNote(),
                          Expanded(
                            child: Container(),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.w,
                      ),
                      SizedBox(height: 20.h),
                      SizedBox(
                        height: 30.h,
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 15.w, left: 15.w),
                        child: DottedBorder(
                          strokeWidth: 1.sp,
                          color: AppColors.DARK_COLOR.withOpacity(.7),
                          dashPattern: const [3, 4],
                          borderType: BorderType.RRect,
                          radius: Radius.circular(10.sp),
                          child: TextFormField(
                            minLines: 10,
                            validator: (v) {
                              if (v!.isEmpty) {
                                return "required".tr;
                              }
                              return null;
                            },
                            controller: controller.descController,
                            decoration: InputDecoration(
                              hintText: 'desc_note'.tr,
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
                        onTap: () => controller.updateNote(),
                        child: DottedBorder(
                          strokeWidth: 1.sp,
                          color: AppColors.DARK_COLOR.withOpacity(.7),
                          dashPattern: const [3, 4],
                          borderType: BorderType.RRect,
                          radius: Radius.circular(500.sp),
                          child: SizedBox(
                            width: 130.w,
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
                                  Text("update".tr),
                                  const Spacer(),
                                ],
                              )),
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
      ),
    );
  }
}
