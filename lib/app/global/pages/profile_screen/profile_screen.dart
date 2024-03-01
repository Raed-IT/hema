import 'package:auto_size_text/auto_size_text.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:school/app/global/data/controllers/main_controller.dart';
import 'package:school/app/global/data/enums/user_type_enum.dart';
import 'package:school/app/global/pages/profile_screen/profile_controller.dart';
import 'package:school/app/global_components/appbar_components/main_appbar.dart';
import 'package:school/app/global_components/drawer_component.dart';
import 'package:school/app/them/app_colors.dart';

import 'components/show_qrcode.dart';

class ProfileScreen extends GetView<ProfileController> {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerComponent(),
      body: Builder(builder: (context) {
        return CustomScrollView(
          physics: const BouncingScrollPhysics(),
          controller: controller.scrollController,
          slivers: [
            Obx(
              () => MainAnimatedAppBarComponent(
                imageProvider: NetworkImage(
                    "${Get.find<MainController>().currentUser.value?.img}"),
                openDrawer: (_) => Scaffold.of(context).openDrawer(),
                scrollController: controller.scrollController,
                supWidgets: [
                  Container(
                    padding: EdgeInsets.all(10.sp),
                    width: Get.width,
                    child: AutoSizeText(
                      textAlign: TextAlign.center,
                      "${Get.find<MainController>().currentUser.value?.name} ",
                      style: TextStyle(
                          color: AppColors.ORANG_APP_COLOR,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(10.w),
                    child: Row(
                      children: [
                        Text(
                          "الصورة الشخصية",
                          style: TextStyle(
                            color: AppColors.PRIMARY_COLOR,
                            fontWeight: FontWeight.bold,
                            fontSize: 14.sp,
                          ),
                        ),
                        Spacer(),
                        (Get.find<MainController>()
                                    .currentUser
                                    .value!
                                    .level!
                                    .name ==
                                "user")
                            ? IconButton(
                                onPressed: () => showQrCode(context: context),
                                icon: Icon(
                                  FontAwesomeIcons.qrcode,
                                  color: AppColors.ORANG_APP_COLOR,
                                  size: 22.sp,
                                ),
                              )
                            : Container()
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(15.sp),
                    child: controller.buildPickerImageWidget(
                        deleteIcon: Container(
                          decoration: BoxDecoration(
                            color: AppColors.ORANG_APP_COLOR.withOpacity(0.7),
                            borderRadius: BorderRadius.all(
                              Radius.circular(50.sp),
                            ),
                          ),
                          padding: EdgeInsets.only(top: 10.sp, bottom: 10.sp),
                          width: 35.w,
                          child: Center(
                            child: Icon(
                              Icons.delete_outlined,
                              color: AppColors.PRIMARY_COLOR,
                              size: 15.sp,
                            ),
                          ),
                        ),
                        imageViewUi: (img) {
                          return Card(
                            elevation: 7,
                            shadowColor: AppColors.elevation_card_color,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(500.sp))),
                            child: Container(
                              margin: EdgeInsets.all(5.sp),
                              height: 140.sp,
                              width: 140.sp,
                              child: ClipRRect(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(500.sp),
                                ),
                                child: Image.file(
                                  img,
                                  fit: BoxFit.fill,
                                  height: 140.sp,
                                  width: 140.sp,
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                  buildTextField(
                      isHidden:
                      Get.find<MainController>().currentUser.value?.level !=
                          UserType.user,
                      textController: controller.userNameController,
                      title: "اسم المستخدم"),
                  // buildTextField(
                  //     isHidden: false,
                  //     textController: controller.emailController,
                  //     title: "الايميل"),
                  buildTextField(
                      textController: controller.firstNameController,
                      title: "الاسم الاول"),
                  buildTextField(
                      textController: controller.lastNameController,
                      title: "الاسم الاخير"),
                  buildTextField(
                      textController: controller.phoneController,
                      title: "رقم الهاتف"),
                  buildTextField(
                      textController: controller.passwordController,
                      title: "كلمة السر"),
                  Padding(
                    padding: EdgeInsets.all(10.0.sp),
                    child: MaterialButton(
                      padding: EdgeInsets.all(10.sp),
                      color: AppColors.PRIMARY_COLOR,
                      onPressed: () => controller.updateProfile(),
                      child: Center(
                        child: Text(
                          "حفظ التعديلات",
                          style: TextStyle(
                              color: AppColors.SCAFFOLD_COLOR,
                              fontWeight: FontWeight.bold,
                              fontSize: 14.sp),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        );
      }),
    );
  }

  Widget buildTextField(
      {required TextEditingController textController,
      required String title,
      bool isHidden = true}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(10.w),
          child: Text(
            "$title",
            style: TextStyle(
              color: AppColors.PRIMARY_COLOR,
              fontWeight: FontWeight.bold,
              fontSize: 14.sp,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(right: 10.w, left: 10.w),
          child: DottedBorder(
            padding: EdgeInsets.zero,
            strokeWidth: 1.sp,
            color: AppColors.DARK_COLOR.withOpacity(.7),
            dashPattern: const [3, 4],
            borderType: BorderType.RRect,
            radius: Radius.circular(10.sp),
            child: TextFormField(
              enabled: isHidden,
              validator: (v) {
                if (v!.isEmpty) {
                  return "required".tr;
                }
                return null;
              },
              controller: textController,
              decoration: InputDecoration(
                hintText: "$title",
                hintStyle: const TextStyle(color: AppColors.DARK_COLOR),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(500.sp),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
