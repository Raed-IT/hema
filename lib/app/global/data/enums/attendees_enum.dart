import 'package:flutter/foundation.dart';
enum AttendeesEnum {
  absence,presence,justification
}
extension AttendeesEnumExtension on String {
  AttendeesEnum toAttendees() =>
      AttendeesEnum.values.firstWhere((d) => describeEnum(d) == toLowerCase());
}
extension AttendeesNameExtension on String {
  String toAttendeesName() =>
      AttendeesEnum.values.firstWhere((d) => describeEnum(d) == toLowerCase()).name==AttendeesEnum.presence.name?'غياب ':"حضور" ;
}

