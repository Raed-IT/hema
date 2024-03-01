import 'package:flutter/foundation.dart';

enum DaysEnum { monday, tuesday, wednesday, thursday, friday, saturday, sunday }

extension DayExtension on String {
  DaysEnum toDay() =>
      DaysEnum.values.firstWhere((d) => describeEnum(d) == toLowerCase());

  String toDayName() {
    switch (this) {
      case "Monday":
        return "الاثنين";
      case "Tuesday":
        return "الثلاثاء ";
      case "Wednesday":
        return "الأربعاء ";
      case "Thursday":
        return "الخميس ";
      case "Friday":
        return "الجمعة ";
      case "Saturday":
        return "السبت ";
      case "Sunday":
        return "الأحد ";
    }
    return "";
  }
}
