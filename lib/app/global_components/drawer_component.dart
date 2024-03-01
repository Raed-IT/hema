import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:school/app/global/data/controllers/local_storage_controller.dart';
import 'package:school/app/global/data/controllers/main_controller.dart';
import 'package:school/app/global/route/routs.dart';
import 'package:school/app/global_components/switch_user_dialog.dart';

import '../global/pages/profile_screen/components/show_qrcode.dart';
import '../them/app_colors.dart';

class DrawerComponent extends StatefulWidget {
  const DrawerComponent({Key? key}) : super(key: key);

  @override
  State<DrawerComponent> createState() => _DrawerComponentState();
}

class _DrawerComponentState extends State<DrawerComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.SCAFFOLD_COLOR,
      width: Get.width * 0.8,
      child: Column(
        children: [
          Container(
            width: Get.width,
            height: 250.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10.sp),
                  bottomRight: Radius.circular(10.sp)),
              color: AppColors.PRIMARY_COLOR,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50.h,
                ),
                CircleAvatar(
                  radius: 55.sp,
                  backgroundColor: AppColors.SCAFFOLD_COLOR,
                  backgroundImage: NetworkImage(
                      "${Get.find<MainController>().currentUser.value?.img}"),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text("welcome".tr,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.sp,
                        color: AppColors.ORANG_APP_COLOR)),
                SizedBox(
                  width: Get.width,
                  child: AutoSizeText(
                    maxLines: 1,
                    textAlign: TextAlign.center,
                    "${Get.find<MainController>().currentUser.value?.name}",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.sp,
                        color: AppColors.SCAFFOLD_COLOR),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          buildElement(
              onTap: () {
                Get.toNamed(GlobalAppRoutes.NOTIFICATION_SCREEN);
              },
              icon: FontAwesomeIcons.solidBell,
              title: "الإشعارات "),
          buildElement(
              onTap: () => showSwitchUserDialog(context),
              title: "حساباتي ",
              icon: FontAwesomeIcons.usersRectangle),
          buildElement(
              icon: FontAwesomeIcons.idCardClip,
              title: "الملف الشخصي",
              onTap: () => Get.toNamed(GlobalAppRoutes.PROFILE)),
          (Get.find<MainController>().currentUser.value!.level!.name == "user")
              ? buildElement(
                  icon: FontAwesomeIcons.qrcode,
                  title: "الباركود",
                  onTap: () => showQrCode(context: context))
              : Container(),
          buildElement(
              icon: FontAwesomeIcons.circleInfo,
              title: "عن المدرسة",
              onTap: () => Get.toNamed(GlobalAppRoutes.ABOUT_SCHOOL_SCREEN)),
          const Spacer(),
          buildElement(
              icon: FontAwesomeIcons.arrowRightFromBracket,
              title: "تسجيل الخروج",
              onTap: () {
                StorageController.removeKey(key: "user");
                StorageController.removeKey(key: "token");
                Get.offAllNamed(GlobalAppRoutes.SPLASH_SCREEN);
                Get.find<MainController>().currentToken.value = null;
                Get.find<MainController>().gotoLoginInScreen();
              }),
          SizedBox(
            height: 10.h,
          ),
        ],
      ),
    );
  }

  Widget buildElement(
      {required Function onTap,
      required IconData icon,
      required String title}) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.sp))),
      elevation: 5,
      shadowColor: AppColors.elevation_card_color,
      child: ListTile(
        onTap: () {
          Scaffold.of(context).closeDrawer();
          onTap();
        },
        title: Text(title),
        leading: Icon(icon, color: AppColors.ORANG_APP_COLOR.withOpacity(.7)),
      ),
    );
  }
}
