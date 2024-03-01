import 'dart:io';

import 'package:get/get.dart';
import 'package:school/app/global/data/routes_api.dart';

class SettingProvider extends GetConnect {
  Future<Response> getSetting() {
    return get(
      GlobalApiRouts.SETTINGS,
    );
  }
}
