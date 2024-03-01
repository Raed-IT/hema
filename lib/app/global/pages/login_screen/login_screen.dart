import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:school/app/global/data/controllers/main_controller.dart';
import 'package:school/app/global/pages/login_screen/login_controller.dart';
import 'package:school/app/modules/parent/route/routs.dart';
import 'package:school/app/them/app_colors.dart';

import '../../../global_components/switch_user_dialog.dart';

class LoginScreen extends GetView<LoginScreenController> {
  RxBool isShowPassword = RxBool(true);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      extendBody: true,
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Stack(
          children: [
            // SizedBox(
            //   height: size.height,
            //   width: size.width,
            //   child: SvgPicture.asset('assets/svg/BG.svg', fit: BoxFit.cover),
            // ),
            Container(
              height: size.height,
              width: size.width,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                colors: AppColors.MAIN_GRADIENT_COLOR,
              )),
              padding: EdgeInsets.only(left: 40.w, right: 40.w),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: SizedBox(
                  height: Get.height,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Spacer(),
                      Image.asset(
                        'assets/custom/logo-school.png',
                        width: 180.w,
                        color: Colors.white,
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      SizedBox(
                        height: 290.h,
                        child: Form(
                          key: controller.formKey,
                          child: Column(
                            children: [
                              buildTextFieldWidget(
                                icon: Icons.account_box_outlined,
                                hint: "user_name".tr,
                                textEditingController:
                                    controller.usernameController,
                                validator: (d) {
                                  if (d!.isEmpty) {
                                    return "required".tr;
                                  } else if (d.length < 4) {
                                    return "validation_short".tr;
                                  }
                                  return null;
                                },
                              ),
                              Obx(
                                () => buildTextFieldWidget(
                                    icon: Icons.lock,
                                    obscureText: isShowPassword.value,
                                    suffixIcon: GestureDetector(
                                      onTap: () =>
                                          isShowPassword(!isShowPassword.value),
                                      child: (isShowPassword.value)
                                          ? Icon(Icons.remove_red_eye_outlined)
                                          : Icon(Icons.visibility_off),
                                    ),
                                    hint: "password",
                                    textEditingController:
                                        controller.passwordController,
                                    validator: (d) {
                                      if (d!.isEmpty) {
                                        return "required".tr;
                                      }
                                      if (d.length < 8) {
                                        return "required_short_password".tr;
                                      }
                                      return null;
                                    }),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Obx(() => Checkbox(
                                            activeColor: AppColors.LABLE_COLOR,
                                            value: controller.rememberMe.value,
                                            onChanged: (val) {
                                              controller.rememberMe(val);
                                            },
                                          )),
                                      Text(
                                        "remember_me".tr,
                                        style: const TextStyle(
                                            color: Colors.white),
                                      ),
                                    ],
                                  ),
                                  TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      'forget_password'.tr,
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                              InkWell(
                                onTap: () {
                                  FocusScope.of(context).unfocus();
                                  controller.login();
                                },
                                child: Container(
                                  padding:
                                      EdgeInsets.symmetric(vertical: 10.sp),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(100.sp)),
                                    gradient:const LinearGradient(
                                        colors:
                                            AppColors.SECONDARY_GRADIENT_COLOR),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'register'.tr,
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 17.sp),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              (Get.find<MainController>().localUsers.isNotEmpty)
                                  ? InkWell(
                                      onTap: () {
                                        showSwitchUserDialog(context,
                                            haveDrawer: false,
                                            isLoginScreen: true);
                                      },
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 10.sp),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(100.sp)),
                                          gradient:const LinearGradient(
                                              colors: AppColors
                                                  .SECONDARY_GRADIENT_COLOR),
                                        ),
                                        child: Center(
                                          child: Text(
                                            "حساباتي السابقة",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 17.sp),
                                          ),
                                        ),
                                      ),
                                    )
                                  : Container(),
                            ],
                          ),
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildTextFieldWidget(
      {required TextEditingController textEditingController,
      required IconData icon,
      required String hint,
      bool obscureText = false,
      Widget? suffixIcon,
      String? Function(String?)? validator}) {
    return SizedBox(
      height: 75.h,
      child: TextFormField(
        validator: validator,
        controller: textEditingController,
        obscureText: obscureText,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(top: 10.sp, bottom: 10.sp),
          filled: true,
          fillColor: AppColors.SCAFFOLD_COLOR,
          suffixIcon: suffixIcon,
          prefixIcon: Container(
            width: 50.w,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: (Get.locale!.languageCode == "ar")
                  ? BorderRadius.only(
                      topRight: Radius.circular(25.sp),
                      bottomRight: Radius.circular(25.sp),
                    )
                  : BorderRadius.only(
                      topLeft: Radius.circular(25.sp),
                      bottomLeft: Radius.circular(25.sp),
                    ),
            ),
            margin: (Get.locale!.languageCode == "ar")
                ? EdgeInsets.only(left: 10.w)
                : EdgeInsets.only(right: 10.w),
            child: Icon(
              icon,
              color: AppColors.DARK_COLOR,
            ),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(25.sp),
          ),
          hintText: hint.tr,
        ),
      ),
    );
  }
}
