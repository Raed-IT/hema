import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:school/app/global/data/controllers/main_controller.dart';
import 'package:school/app/global/route/routs.dart';
import 'package:school/app/them/app_colors.dart';

import '../global/data/controllers/local_storage_controller.dart';
import '../global/data/database/users_crud_database.dart';

void showSwitchUserDialog(BuildContext context,
    {bool haveDrawer = true, bool isLoginScreen = false}) {
  if (haveDrawer) {
    Scaffold.of(context).closeDrawer();
  }
  showModalBottomSheet(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(10.sp),
              topLeft: Radius.circular(10.sp))),
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) {
        return Stack(
          children: [
            Container(
              width: Get.width,
              constraints: BoxConstraints(minHeight: 100.h),
              decoration: BoxDecoration(
                color: AppColors.SCAFFOLD_COLOR,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.sp),
                  topRight: Radius.circular(10.sp),
                ),
              ),
              margin: EdgeInsets.only(top: 30.sp),
              padding: EdgeInsets.only(top: 30.sp),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child:Obx(()=> Column(
                  children: [
                    const Text(
                      "حساباتي",
                      style: TextStyle(
                        color: AppColors.PRIMARY_COLOR,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    ...Get.find<MainController>()
                        .localUsers
                        .map((user) => ListTile(
                      leading: const Icon(Icons.verified_user_outlined),
                      onTap: () {
                        Get.find<MainController>()
                            .switchUser(user: user,isLoginScreen: isLoginScreen);
                      },
                      trailing: IconButton(
                        icon: Icon(
                          Icons.delete_outlined,
                          color: AppColors.ORANG_APP_COLOR,
                          size: 15.sp,
                        ),
                        onPressed: () {
                          Get.defaultDialog(
                              title: "حذف ؟؟",
                              content: Text("سيتم حذف  ${user.name}"),
                              actions: [
                                MaterialButton(
                                  onPressed: () async {
                                    final userDatabase = UserDatabase();
                                    await userDatabase.deleteUser(user);

                                    if (Get.find<MainController>()
                                        .localUsers
                                        .isEmpty) {
                                      Get.find<MainController>()
                                          .logout();
                                    } else {
                                      Get.back();
                                      Future.delayed(
                                          Duration(milliseconds: 200),
                                              () => Get.back());
                                    }
                                  },
                                  child: Text(
                                    "حذف",
                                    style: TextStyle(
                                        color: AppColors.PRIMARY_COLOR,
                                        fontSize: 15.sp),
                                  ),
                                ),
                                MaterialButton(
                                  onPressed: () => Get.back(),
                                  child: Text(
                                    "الغاء",
                                    style: TextStyle(fontSize: 15.sp),
                                  ),
                                )
                              ]);
                        },
                      ),
                      title: Text("${user.name}"),
                      subtitle: Text(user.email??'لايوجد ايميل '),
                    ))
                        .toList(),
                    (!isLoginScreen)
                        ? ListTile(
                      leading: Icon(
                        FontAwesomeIcons.userPlus,
                        size: 12.sp,
                      ),
                      onTap: () => Get.find<MainController>().logout(),
                      title: Text("إضافة حساب"),
                      subtitle: Text(
                          "فقط قم بتسجيل الدخل باستخدام الحساب الجديد"),
                    )
                        : Container()
                  ],
                )),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              heightFactor: 0,
              child: Container(
                padding: EdgeInsets.all(20.sp),
                decoration: BoxDecoration(
                    color: AppColors.SCAFFOLD_COLOR,
                    borderRadius: BorderRadius.all(Radius.circular(500.sp))),
                child: Icon(
                  FontAwesomeIcons.users,
                  size: 20.sp,
                  color: AppColors.ORANG_APP_COLOR,
                ),
              ),
            )
          ],
        );
      });
}
