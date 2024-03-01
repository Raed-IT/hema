import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:school/app/global/data/models/local_models/add_marks_model.dart';
import 'package:school/app/global/data/models/local_models/mark_status_model.dart';
import 'package:school/app/global/data/models/student_model.dart';
import 'package:school/app/global/data/models/subject_model.dart';
import 'package:school/app/global_components/animated_check_component.dart';
import 'package:school/app/them/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../../data/models/attend_model.dart';
import '../marker_controller.dart';

// ignore: must_be_immutable
class TeacherBuildCardMarkStudentComponent extends StatefulWidget {
  Rx<StudentModel> student;
  AddMarkModel? mark;

  late Rx<AddMarkModel> actualMark;

  TeacherBuildCardMarkStudentComponent(
      {super.key, required this.student, this.mark}) {
    // Get.find<CheckStudentsController>().attends.forEach((element) {print (element.toJson());});
    if (mark != null) {
      actualMark = Rx(
        AddMarkModel(
          studentId: student.value.id!,
          mark: mark!.mark,
        ),
      );
    } else {
      actualMark = Rx(
        AddMarkModel(studentId: student.value.id!),
      );
    }
  }

  @override
  State<TeacherBuildCardMarkStudentComponent> createState() =>
      _BuildCardAttendStudentComponentState();
}

class _BuildCardAttendStudentComponentState
    extends State<TeacherBuildCardMarkStudentComponent> {
  late TextEditingController markController;
  late StudentModel _studentModel;

  @override
  void initState() {
    _studentModel = widget.student.value;
    markController =
        TextEditingController(text: "${_studentModel.currentMark ?? ''}");
    _studentModel.markStatus = MarkStatusModel(
      bad: _studentModel.markStatusString == "bad",
      middle: _studentModel.markStatusString == "middle",
      success: _studentModel.markStatusString == "success",
    );
    super.initState();
  }

  @override
  void dispose() {
    markController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TeacherMarkerController>(
      builder: (controller) => SizedBox(
        height: 250.h,
        child: Card(
          margin: EdgeInsets.only(left: 10.w, right: 10.w, top: 10.h),
          elevation: 7,
          shadowColor: AppColors.elevation_color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10.sp),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                            "${widget.student.value.fullName??''}   ",
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
              Padding(
                padding: EdgeInsets.all(8.sp),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 8.0.w),
                      child: Text(
                        "الرحاء ملء علامة الطالب",
                        style: TextStyle(fontSize: 14.sp),
                      ),
                    ),
                    TextFormField(
                      controller: markController,
                      onChanged: (mark) {
                        if (controller.selectedExam.value == null) {
                          Fluttertoast.showToast(msg: "الرجاء اختيار الإختبار");
                          return;
                        }
                        double? ma = double.tryParse(mark);
                        widget.student.value.currentMark = ma;
                        if (ma != null) {
                          SubjectModel subject =
                              controller.selectedExam.value!.subject!;
                          double maxMa = subject.maxMark!;
                          double minMa = subject.minMark!;
                          if (ma < minMa) {
                            widget.student.value.markStatus =
                                MarkStatusModel(bad: true);
                          } else if (ma >= maxMa - (maxMa / 5)) {
                            widget.student.value.markStatus =
                                MarkStatusModel(success: true);
                          } else {
                            widget.student.value.markStatus =
                                MarkStatusModel(middle: true);
                          }
                        }
                        setState(() {});
                      },
                      style: TextStyle(fontFamily: "", fontSize: 12.sp),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.zero,
                        border: OutlineInputBorder(
                          gapPadding: 0,
                          borderRadius: BorderRadius.all(
                            Radius.circular(15.sp),
                          ),
                        ),
                      ),
                      validator: (d) {
                        if (d!.isEmpty) {
                          return "الرجاء ملئ علامة الطالب ";
                        }
                        if (controller.selectedExam.value != null) {
                          //  check if entry mark smolar than max exam mark
                          double? mark = double.tryParse(d);
                          if (mark != null) {
                            if (mark >
                                controller
                                    .selectedExam.value!.subject!.maxMark!) {
                              return "  يجب ان تكون علامة الطالب اصغر من العلامة العليى للمادة  _  ${controller.selectedExam.value!.subject?.maxMark ?? ''}  _";
                            }
                          } else {
                            return "لجاء ادخال رقم صحيح ";
                          }
                        }
                        return null;
                      },
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
                              "ممتاز",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            AnimatedCheckComponent(
                              onChange: (selected) {
                                widget.student.value.markStatus =
                                    MarkStatusModel(success: true);
                                setState(() {});
                              },
                              isChecked:
                                  widget.student.value.markStatus!.success!,
                            ),
                          ],
                        )),
                        Expanded(
                            child: Column(
                          children: [
                            const Text(
                              "متوسط",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            AnimatedCheckComponent(
                              onChange: (selected) {
                                widget.student.value.markStatus =
                                    MarkStatusModel(middle: true);
                                setState(() {});
                              },
                              isChecked:
                                  widget.student.value.markStatus!.middle!,
                            ),
                          ],
                        )),
                        Expanded(
                            child: Column(
                          children: [
                            const Text(
                              "ضعيف",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            AnimatedCheckComponent(
                              onChange: (selected) {
                                widget.student.value.markStatus =
                                    MarkStatusModel(bad: true);
                                setState(() {});
                              },
                              isChecked: widget.student.value.markStatus!.bad!,
                            ),
                          ],
                        )),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
