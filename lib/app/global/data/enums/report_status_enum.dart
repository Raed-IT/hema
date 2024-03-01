import 'package:flutter/foundation.dart';

enum ReportItemStatus { bad, success, middle }

extension ReportStatusExtension on String {
  ReportItemStatus toReportItemStatus() => ReportItemStatus.values
      .firstWhere((d) => describeEnum(d) == toLowerCase());

  String toReportItemName() {
    switch (this) {
      case "bad":
        return "سيئ";
      case "success":
        return "جيد ";
    }
    return "متوسط";
  }
}
