import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:helper_plugin/helper.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:school/app/global/data/bindings/main_binging.dart';
import 'package:school/app/global/data/controllers/main_controller.dart';
import 'package:school/app/global/local_notification.dart';
import 'package:school/app/global/route/get_pages.dart';
import 'package:school/app/global/route/routs.dart';
import 'package:school/app/global_components/drawer_component.dart';
import 'package:school/app/modules/driver/route/get_pages.dart';
import 'package:school/app/modules/parent/route/get_pages.dart';
import 'package:school/app/modules/teacher/route/get_pages.dart';
import 'package:school/app/them/them_data.dart';
import 'app/global/data/constants.dart';
import 'app/global/data/opserve/route_observer.dart';
import 'app/lang/TranslationApp.dart';
import 'app/modules/admin/route/get_pages.dart';

//flutter build apk --release  --target-platform android-arm
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Constants.instants;
// await StorageController.removeKey(key: "token");
// await StorageController.removeKey(key: "user");
  HelperMadaFlutter.initial(appName: GlobalAppRoutes.APP_NAME);
  ConstantHelperMadaFlutter.allowPrint = true;
  ConstantHelperMadaFlutter.allowPrintResponse = true;

  ConstantHelperMadaFlutter.drawerWidget = const DrawerComponent();
  LocalNotification.initial();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await OneSignal.shared.setAppId("f1ea4942-c6e4-4bd3-abfd-8dbc713ffe97");
  // await OneSignal.shared.setAppId("5d63008f-12f2-4f86-868f-0cfe1d46a380");
  await ScreenUtil.ensureScreenSize();
  await GetStorage.init(GlobalAppRoutes.APP_NAME);

  Get.put(MainController(), permanent: true);
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
    );

    return ScreenUtilInit(
      builder: (BuildContext context, Widget? child) {
        EasyLoading.instance
          ..displayDuration = const Duration(milliseconds: 2000)
          ..indicatorType = EasyLoadingIndicatorType.wave //fadingCircle
          ..loadingStyle = EasyLoadingStyle.light
          ..indicatorSize = 45.0.h
          ..radius = 10.0
          ..maskColor = Colors.blue.withOpacity(0.5)
          ..userInteractions = true
          ..dismissOnTap = false;
        return GetMaterialApp(
          title: Constants.SCHOOL_NAME,
          builder: EasyLoading.init(),
          theme: ThemeAppData.themeData,
          initialRoute: GlobalAppRoutes.SPLASH_SCREEN,
          navigatorObservers: [MainRouteObserver()],
          // Add your custom route observer here
          getPages: [
            ...GlobalGetPagesProvider.getPages,
            ...DriverGetPagesProvider.getPages,
            ...ParentGetPagesProvider.getPages,
            ...TeacherGetPagesProvider.getPages,
            ...AdminGetPagesProvider.getPages,
          ],
          debugShowCheckedModeBanner: false,
          translations: TranslationApp(),
          locale: const Locale('ar'),
          fallbackLocale: const Locale('ar'),
          initialBinding: MainBinding(),
        );
      },
    );
  }
}
