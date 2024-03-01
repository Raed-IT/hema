import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:school/app/global/data/enums/day_enum.dart';
import 'package:school/app/global/data/models/student_model.dart';
import 'package:school/app/modules/parent/pages/home_screen/home_controller.dart';
import 'package:school/app/them/app_colors.dart';

Future showParentAbsentBottomSheet(StudentModel student, BuildContext context,
    {required int studentId}) async {
  Rxn<String> currentDate = Rxn();
  DateTime date = DateTime.now();
  List<String> days = [
    DateFormat('EEEE').format(date).toDayName(),
    DateFormat('EEEE').format(date.add(Duration(days: 1))).toDayName()
  ];
  List<String> daysDate = [
    DateFormat('yyyy-MM-dd').format(date),
    DateFormat('yyyy-MM-dd').format(date.add(Duration(days: 1))),
  ];
  String? selectedDate;
  showModalBottomSheet(
    constraints: BoxConstraints(maxHeight: 300.h),
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(15.sp), topLeft: Radius.circular(15.sp))),
    context: context,
    builder: (context) {
      return Container(
        width: Get.width,
        child: Padding(
          padding: EdgeInsets.all(18.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: Text(
                  "طلب غياب ",
                  style: TextStyle(
                      color: AppColors.ORANG_APP_COLOR,
                      fontWeight: FontWeight.bold,
                      fontSize: 17.sp),
                ),
              ),
              Text("اختر اليوم :",
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 13.sp)),
              Obx(
                () => Column(
                  children: days
                      .map(
                        (day) => RadioListTile<String>(
                            value: day,
                            groupValue: currentDate.value,
                            title: Text(day),
                            onChanged: (String? value) {
                              currentDate.value = value;
                              int index = days.indexOf("$value");
                              if (index != -1) {
                                selectedDate = daysDate[index];
                              } else {
                                Fluttertoast.showToast(msg: "خطاء ");
                              }
                            }),
                      )
                      .toList(),
                ),
              ),
              SizedBox(
                width: Get.width,
                child: MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.sp))),
                  color: AppColors.PRIMARY_COLOR,
                  height: 30.h,
                  onPressed: () {
                    save(selectedDate: selectedDate, studentId: studentId);
                  },
                  child: Text(
                    "ارسال طاب الغياب",
                    style: TextStyle(color: AppColors.SCAFFOLD_COLOR),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

void save({String? selectedDate, required int studentId}) {
  if (selectedDate == null) {
    Fluttertoast.showToast(msg: "الرجاء اختيار اليوم ");
    return;
  }
  Get.find<ParentHomeController>()
      .addAbsent(selectedDate: selectedDate, studentId: studentId);
}
