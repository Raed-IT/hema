import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:school/app/global/data/models/local_models/attends_model.dart';
import 'package:school/app/global/data/models/student_model.dart';
import 'package:school/app/modules/teacher/data/models/attend_model.dart';
import 'package:school/app/them/app_colors.dart';
import '../../../../../global/data/enums/attendees_enum.dart';
import '../../../../../global_components/animated_check_component.dart';
import '../check_students_controller.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BuildCardAttendStudentComponent extends StatefulWidget {
  Rx<StudentModel> student;
  AttendsModel? attend;
  bool isUpdate;

  late Rx<AttendStateModel> attState;

  BuildCardAttendStudentComponent(
      {super.key, required this.student, this.attend, required this.isUpdate}) {
        // Get.find<CheckStudentsController>().attends.forEach((element) {print (element.toJson());});

    if (attend != null) {
      attState = Rx(
        AttendStateModel(
            studentId: student.value.id!,
            isJustification: attend!.type == AttendeesEnum.justification.name,
            isAbsent: attend!.type == AttendeesEnum.absence.name,
            isPresence: attend!.type == AttendeesEnum.presence.name),
      );
    } else {
      attState = Rx(
        AttendStateModel(studentId: student.value.id!),
      );
    }
  }

  @override
  State<BuildCardAttendStudentComponent> createState() =>
      _BuildCardAttendStudentComponentState();
}

class _BuildCardAttendStudentComponentState
    extends State<BuildCardAttendStudentComponent> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckStudentsController>(
      builder: (controller) => SizedBox(
        height: 160.h,
        child: Card(
          margin: EdgeInsets.only(left: 10.w, right: 10.w, top: 10.h),
          elevation: 7,
          shadowColor: AppColors.elevation_color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10.sp),
            ),
          ),
          child: Stack(
            children: [
              DottedBorder(
                color: widget.isUpdate
                    ? AppColors.PRIMARY_COLOR
                    : Colors.transparent,
                dashPattern: const [3, 4],
                borderType: BorderType.RRect,
                radius: Radius.circular(10.sp),
                strokeWidth: 1.sp,
                child: Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                            width: 90.w,
                            child: CachedNetworkImage(
                                imageUrl: "${widget.student.value.img}")),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 15.h),
                                child: AutoSizeText(
                                  "${widget.student.value.name}  ",
                                  maxLines: 1,
                                  style: TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.sp),
                                ),
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              Text(widget.student.value.section?.name ?? '')
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Column(
                          children: [
                            const Text(
                              "حضور ",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            AnimatedCheckComponent(
                              onChange: (selected) {
                                widget.attState.value = AttendStateModel(
                                    studentId: widget.student.value.id!,
                                    type: AttendeesEnum.presence.name);
                                controller.addMainAttendToMainDalyList(
                                  widget.attState.value,
                                );
                                widget.isUpdate = true;
                                setState(() {});
                              },
                              isChecked: widget.attState.value.isPresence,
                            ),
                          ],
                        )),
                        Expanded(
                          child: Column(
                            children: [
                              const Text(
                                "غياب",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              AnimatedCheckComponent(
                                onChange: (selected) {
                                  widget.attState.value = AttendStateModel(
                                      studentId: widget.student.value.id!,
                                      isPresence: false,
                                      isAbsent: true,
                                      type: AttendeesEnum.absence.name);
                                  controller.addMainAttendToMainDalyList(
                                    widget.attState.value,
                                  );
                                  widget.isUpdate = true;
                                  setState(() {});
                                },
                                isChecked: widget.attState.value.isAbsent,
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                            child: Column(
                          children: [
                            const Text(
                              " غياب مبرر",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            AnimatedCheckComponent(
                              onChange: (selected) {
                                widget.attState.value = AttendStateModel(
                                    studentId: widget.student.value.id!,
                                    isPresence: false,
                                    isJustification: true,
                                    type: AttendeesEnum.justification.name);
                                controller.addMainAttendToMainDalyList(
                                  widget.attState.value,
                                );
                                widget.isUpdate = true;
                                setState(() {});
                              },
                              isChecked: widget.attState.value.isJustification,
                            ),
                          ],
                        )),
                      ],
                    )
                  ],
                ),
              ),
              (widget.isUpdate)
                  ? Positioned(
                      left: 5.w,
                      top: 5.h,
                      child: GestureDetector(
                        onTap: () {
                          controller.removerAttendFromMainDalyList(
                              widget.attState.value);
                          widget.attState.value = AttendStateModel(
                              studentId: widget.student.value.id!);
                          widget.isUpdate = false;
                          setState(() {});
                        },
                        child: Transform.rotate(
                          angle: 160,
                          child: Icon(
                            Icons.add_circle_outline_sharp,
                            color: AppColors.PRIMARY_COLOR,
                            size: 20.sp,
                          ),
                        ),
                      ),
                    )
                  : Container()
            ],
          ),
        ),
      ),
    );
  }
}
