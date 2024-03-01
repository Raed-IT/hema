import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:school/app/global/data/controllers/main_controller.dart';
import 'package:school/app/global/pages/about_school/about_school_controller.dart';
import 'package:school/app/global_components/drawer_component.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../global_components/appbar_components/main_appbar.dart';
import '../../../global_components/show_snackBar.dart';
import '../../../them/app_colors.dart';

class AboutSchoolScreen extends GetView<AboutSchoolController> {
  AboutSchoolScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerComponent(),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        controller: controller.scrollController,
        slivers: [
          MainAnimatedAppBarComponent(
            imageProvider: controller.logo,
            openDrawer: (conte) {
              Scaffold.of(conte).openDrawer();
            },
            scrollController: controller.scrollController,
            supWidgets: [
              Text(""),
              Text(
                controller.schoolName,
                style: TextStyle(
                    color: AppColors.ORANG_APP_COLOR,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.sp),
              )
            ],
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(12.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (controller.setting.value != null)
                    Column(
                      children: [
                        if (controller.setting.value!.info != null)
                          Text(
                            "عن المدرسة",
                            style: TextStyle(
                                color: AppColors.PRIMARY_COLOR,
                                fontWeight: FontWeight.bold,
                                fontSize: 17.sp),
                          ),
                        if (controller.setting.value!.info != null)
                          HtmlWidget("${controller.setting.value?.info}   "),
                        SizedBox(
                          height: 10.h,
                        ),
                        if (controller.setting.value!.about != null)
                          Text(
                            "رؤية المدرسة",
                            style: TextStyle(
                                color: AppColors.PRIMARY_COLOR,
                                fontWeight: FontWeight.bold,
                                fontSize: 17.sp),
                          ),
                        if (controller.setting.value!.about != null)
                          HtmlWidget("${controller.setting.value?.about}"),
                        SizedBox(
                          height: 10.h,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            buildSocialButton(
                                icon: FontAwesomeIcons.facebook,
                                rul:
                                    controller.setting.value!.social!.facebook),
                            buildSocialButton(
                                icon: FontAwesomeIcons.instagram,
                                rul: controller
                                    .setting.value!.social!.instagram),
                            buildSocialButton(
                                icon: FontAwesomeIcons.twitter,
                                rul: controller.setting.value!.social!.twitter),
                            buildSocialButton(
                                icon: FontAwesomeIcons.youtube,
                                rul: controller.setting.value!.social!.youtube),
                          ],
                        )
                      ],
                    )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildSocialButton({required IconData icon, required String? rul}) {
    return (rul != null)
        ? Container(
            height: 50.sp,
            width: 50.sp,
            decoration: BoxDecoration(
                border: Border.all(color: AppColors.PRIMARY_COLOR),
                borderRadius: BorderRadius.all(Radius.circular(50.sp))),
            child: Center(
              child: IconButton(
                onPressed: () async {
                  if (rul.isNotEmpty) {
                    // var status = await canLaunchUrl(Uri.parse(rul));
                    // if (status) {
                      launchUrl(Uri.parse(rul),mode: LaunchMode.externalApplication);
                    // } else {
                    //   showSnackBar(
                    //       message: "can't lunch url : $rul", success: false);
                    // }
                  }
                },
                icon: Icon(
                  icon,
                  color: AppColors.PRIMARY_COLOR,
                ),
              ),
            ),
          )
        : Container();
  }
}
/*

*/
