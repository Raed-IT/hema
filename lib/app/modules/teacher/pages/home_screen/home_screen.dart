import 'package:extended_sliver/extended_sliver.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:school/app/global/data/controllers/main_controller.dart';
import 'package:school/app/global/data/models/department_model.dart';
import 'package:school/app/global/route/routs.dart';
import 'package:school/app/global_components/drawer_component.dart';
import 'package:school/app/modules/teacher/pages/home_screen/home_conteoller.dart';
import 'package:school/app/modules/teacher/route/routs.dart';
import 'package:school/app/them/app_colors.dart';

import '../../../../global_components/appbar_components/horizontal_appbar_component.dart';
import '../../../../global_components/lists_components/animation_sliver_list_component.dart';
import '../../../../global_components/lists_components/main_list_progress_component.dart';
import '../../../../global_components/lists_components/no_data_component.dart';
import '../components/button_group_progress_component.dart';
import 'components/group_button.dart';

class TeacherHomeScreen extends GetView<TeacherHomeController> {
  TeacherHomeScreen({Key? key}) : super(key: key);
  final MainController _mainController = Get.find<MainController>();
  var ctime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerComponent(),
      drawerEnableOpenDragGesture: false,

      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: AppColors.PRIMARY_COLOR,
        onPressed: () => Get.toNamed(GlobalAppRoutes.POSTES_SCREEN,
            arguments: {"department": null}),
        label: Row(
          children: [Text('اخبار المدرسة')],
        ),
        heroTag: "articles",
      ),
      body: WillPopScope(
        onWillPop: () async {
          DateTime now = DateTime.now();
          if (ctime == null || now.difference(ctime) > Duration(seconds: 1)) {
            //add duration of press gap
            ctime = now;
            Fluttertoast.showToast(
                msg: "اضغط مره اخرى للخروج",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                fontSize: 16.0.sp);
            return Future.value(false);
          }
          SystemNavigator.pop();
          return Future.value(true);
        },
        child: Builder(builder: (context) {
          return CustomScrollView(
            controller: controller.scrollController,
            physics: const BouncingScrollPhysics(),
            slivers: [
              HorizontalAnimatedAppBarComponent(
                imageProvider: controller.avatarUser,
                openDrawer: () {
                  print(Get.find<MainController>().localUsers.length);
                  Scaffold.of(context).openDrawer();
                },
                scrollController: controller.scrollController,
                supWidgets: [
                  Text(
                    'welcome'.tr,
                    style: const TextStyle(color: AppColors.ORANG_APP_COLOR),
                  ),
                  Text(
                    _mainController.currentUser.value!.name!,
                    style: TextStyle(
                        color: AppColors.SCAFFOLD_COLOR,
                        fontWeight: FontWeight.bold,
                        fontSize: 17.sp),
                  )
                ],
              ),
              SliverPinnedToBoxAdapter(
                child: Obx(
                  () => (controller.isLoad.value)
                      ? Center(
                          child: Container(
                            margin: EdgeInsets.only(bottom: 20.h),
                            height: 40.h,
                            child: TeacherButtonGroupProgressComponent(),
                          ),
                        )
                      : (controller.sections.isNotEmpty)
                          ? Center(
                              child: Container(
                                margin: EdgeInsets.only(bottom: 20.h),
                                height: 40.h,
                                child: TeacherButtonGroupComponent(),
                              ),
                            )
                          : Padding(
                              padding: EdgeInsets.all(18.sp),
                              child: Center(
                                child: Text('no_department_found'.tr),
                              ),
                            ),
                ),
              ),
              Obx(
                () {
                  return (controller.isLoad.value)
                      ? MainListProgressComponent()
                      : (controller.departments.isNotEmpty)
                          ? AnimationSliverList(
                              length: controller.departments.length,
                              builder: (context, index, animation) {
                                return FadeTransition(
                                  alwaysIncludeSemantics: true,
                                  opacity: Tween<double>(
                                    begin: 0,
                                    end: 1,
                                  ).animate(animation),
                                  child: SlideTransition(
                                    position: Tween<Offset>(
                                      begin: const Offset(0, .7),
                                      end: Offset.zero,
                                    ).animate(animation),
                                    child: buildCardList(
                                      context: context,
                                      departmentModel:
                                          controller.departments[index],
                                    ),
                                  ),
                                );
                              },
                            )
                          : NoDataSliverComponent(
                              title: "اعاده تحميل الطلاب ",
                              onTap: () {
                                controller.getData();
                              },
                            );
                },
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 300.h,
                ),
              )
            ],
          );
        }),
      ),
    );
  }

  Widget buildCardList({
    required BuildContext context,
    required DepartmentModel departmentModel,
  }) {
    return InkWell(
      onTap: () {
        Get.toNamed(TeacherAppRoutes.DEPARTMENT_SCREEN, arguments: {
          'department': departmentModel,
          "section": controller.sections[controller.selectedSection.value]
        });
      },
      child: Card(
        elevation: 7,
        shadowColor: AppColors.elevation_color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10.sp),
          ),
        ),
        child: SizedBox(
          height: 90.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.all(5),
                height: 89.h,
                width: 80.w,
                child: Center(
                  child: Icon(
                    FontAwesomeIcons.usersRectangle,
                    color: AppColors.PRIMARY_COLOR,
                    size: 35.sp,
                  ),
                ),
              ),
              SizedBox(width: 10.w),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${departmentModel.name}",
                    style:
                        TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w600),
                  ),
                  Text(
                      "عدد الطلاب في الشعبة  ${departmentModel.count} طالب / هـ ")
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
