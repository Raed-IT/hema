import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:school/app/global_components/delete_dialog.dart';
import '../../../../global/data/models/notes_model.dart';
import '../../../../global_components/appbar_components/main_appbar.dart';
import '../../../../global_components/lists_components/animation_sliver_list_component.dart';
import '../../../../global_components/lists_components/no_data_component.dart';
import '../../../../them/app_colors.dart';
import 'components/button_status_conponent.dart';
import 'components/progress_list_notes.dart';
import 'notes_controller.dart';

class ParentNotesScreen extends GetView<ParentNotesController> {
  const ParentNotesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return controller.buildScreen(
      widgets: [
        SliverToBoxAdapter(
          child: SizedBox(
            height: 50.sp,
            child: ParentButtonStatusComponent(),
          ),
        ),
        Obx(
          () => (controller.isLoadPagination.value)
              ? ParentProgressNotesList()
              : (controller.paginationData.isNotEmpty)
                  ? AnimationSliverList(
                      builder: (BuildContext context, int index,
                          Animation<double> animation) {
                        return buildNotesCard(
                            note: controller.paginationData[index]);
                      },
                      length: controller.paginationData.length,
                    )
                  : NoDataSliverComponent(
                      onTap: () =>
                          controller.getPaginationData(isRefresh: true)),
        )
      ],
      appBar: MainAnimatedAppBarComponent(
        herTag: "sticky-notes-tag",
        openDrawer: (conte) => Scaffold.of(conte).openDrawer(),
        svgUrl: "assets/svg/sticky-notes.svg",
        scrollController: controller.scrollController!,
        supWidgets: [
          Text(""),
          Text(
            "الملاحظات",
            style: TextStyle(
                color: AppColors.ORANG_APP_COLOR,
                fontWeight: FontWeight.bold,
                fontSize: 25.sp),
          ),
        ],
      ),
    );
  }

  Widget buildNotesCard({required NotesModel note}) {
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
                          "${note.subjectName!=null &&note.subjectName!.isNotEmpty ?note.subjectName: 'لم يتم تحديد المادة'}",
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
          ],
        ),
      ),
    );
  }
}
