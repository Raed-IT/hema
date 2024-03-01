import 'package:flutter/foundation.dart';

enum UserType {
  user,
  teacher,
  driver,
  manager,
  admin,
}

extension UserTypeExtension on String {
  UserType toUserType() =>
      UserType.values.firstWhere((d) => describeEnum(d) == toLowerCase());
}
