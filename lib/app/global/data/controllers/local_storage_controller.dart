import 'package:get_storage/get_storage.dart';
import 'package:school/app/global/route/routs.dart';

class StorageController {
  static dynamic getData({required String key}) {
    return GetStorage(GlobalAppRoutes.APP_NAME).read(key);
  }

  static Future<void> setData(
      {required String key, required dynamic value}) async {
    await GetStorage(GlobalAppRoutes.APP_NAME).write(key, value);
  }
  static Future<void> removeKey(
      {required String key,}) async {
    await GetStorage(GlobalAppRoutes.APP_NAME).remove(key,);
  }
}
