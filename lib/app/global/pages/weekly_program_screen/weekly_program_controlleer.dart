import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:helper_plugin/helper.dart';
import 'package:helper_plugin/utilitis/url_model.dart';
import 'package:intl/intl.dart';
import 'package:school/app/global/data/routes_api.dart';
import 'package:school/app/modules/parent/data/routes_api.dart';
import '../../data/models/dayModel.dart';
import '../../data/models/shift_model.dart';

class WeeklyProgramController extends GetxController with ApiHelperMixin {
  RxList<ShiftModel> shifts = RxList([]);
  RxList<ShiftModel> shiftsByDay = RxList([]);
  RxList<DayModel> days = RxList([]);
  RxInt selectedDay = 0.obs;
  String departmentId = Get.arguments['departmentId'].toString();
  ScrollController daysScrollController = ScrollController();

  set selectedDaySetter(int index) {
    DayModel day = days[index];
    shiftsByDay.clear();
    for (var element in shifts) {
      if (element.day == day.val) {
        shiftsByDay.add(element);
      }
    }
    selectedDay.value = index;
    update();
  }

  @override
  void onReady() {
    urlsGetRequest = [
      UrlModel(
          url: GlobalApiRouts.SHIFT,
          type: "shifts",
          parameter: 'department_id=$departmentId')
    ];
    super.onReady();
    getData(isPrintResponse: true);
  }

  @override
  void onInit() {
    days.value = [
      DayModel(labelEn: "Saturday", labelAr: "السبت", val: "SATURDAY"),
      DayModel(labelEn: "Sunday", labelAr: "الاحد", val: "SUNDAY"),
      DayModel(labelEn: "Monday", labelAr: "الاثنين", val: "MONDAY"),
      DayModel(labelEn: "Tuesday", labelAr: "الثلاثاء", val: "TUESDAY"),
      DayModel(labelEn: "Wednesday", labelAr: "الاربعاء", val: "WEDNESDAY"),
      DayModel(labelEn: "Thursday", labelAr: "الخميس", val: "THURSDAY"),
      DayModel(labelEn: "Friday", labelAr: "الجمعة", val: "FRIDAY"),
    ];
    super.onInit();
  }

  @override
  void getModelFromJsonUsing(var json, String urlType) {
    if (urlType == "shifts") {
      shifts.clear();
      for (var item in json['data']['lessons']) {
        shifts.add(ShiftModel.fromJson(item));
      }
      selectedDaySetter = days.indexWhere(
          (day) => day.labelEn == DateFormat('EEEE').format(DateTime.now()));
    }
  }
}
