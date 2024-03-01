import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:school/app/global/pages/reports_screens/reports_screen/report_controller.dart';
import 'package:school/app/global/route/routs.dart';
import 'package:school/app/global_components/appbar_components/main_appbar.dart';
import 'package:school/app/global_components/drawer_component.dart';
import '../../../../global_components/lists_components/animation_sliver_list_component.dart';
import '../../../../global_components/lists_components/no_data_component.dart';
import '../../../../them/app_colors.dart';
import '../../../data/models/report_model.dart';
import 'componentes/projress.dart';

class ReportScreen extends GetView<ReportController> {
  const ReportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerComponent(),
      body: Builder(builder: (context) {
        return CustomScrollView(
          controller: controller.scrollController,
          physics: const BouncingScrollPhysics(),
          slivers: [
            MainAnimatedAppBarComponent(
              herTag: "report-tag",
              svgUrl: "assets/svg/report.svg",
              openDrawer: (_) {
                Scaffold.of(context).openDrawer();
              },
              scrollController: controller.scrollController,
              supWidgets: [
                Text(""),
                Text(
                  "عرض التقارير ",
                  style: TextStyle(
                      color: AppColors.ORANG_APP_COLOR,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
            Obx(
              () => controller.isLoad.value
                  ? const ProgressReports()
                  : (controller.reports.isNotEmpty)
                      ? AnimationSliverList(
                          builder: (context, index, animation) {
                            return buildCard(report: controller.reports[index]);
                          },
                          length: controller.reports.length,
                        )
                      : NoDataSliverComponent(
                          onTap: () => controller.getData(),
                        ),
            ),
          ],
        );
      }),
    );
  }

  Widget buildCard({required ReportModel report}) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(
          GlobalAppRoutes.REPORT_ITEMS,
          arguments: {
            "report": report,
            "current_report": report,
            if (controller.student != null) "student": controller.student
          },
        );
      },
      child: Card(
        shadowColor: AppColors.elevation_card_color,
        elevation: 7,
        margin: EdgeInsets.all(10.w),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10.sp),
          ),
        ),
        child: Container(
          padding: EdgeInsets.all(10.sp),
          height: 105.h,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              buildRow(
                  fontSize: 15,
                  width: 15.w,
                  height: 15.h,
                  title: "عنـوان الـتقرير: ",
                  val: report.name ?? ' _ ',
                  svg: "title"),
              SizedBox(
                height: 5.h,
              ),
              buildRow(
                  title: "تاريخ التقرير  : ",
                  val: "${report.date}",
                  svg: "Calender"),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildRow({
    double fontSize = 12,
    required String title,
    required String val,
    required String svg,
    double? width,
    double? height,
  }) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h, top: 8.h),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 10.w),
            child: SvgPicture.asset(
              "assets/svg/$svg.svg",
              width: width ?? 20.w,
              height: height ?? 20.h,
              color: AppColors.ORANG_APP_COLOR,
            ),
          ),
          Row(
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: fontSize.sp,
                ),
              ),
              Text(val,
                  style: TextStyle(
                    fontSize: fontSize.sp,
                  ))
            ],
          ),
        ],
      ),
    );
  }
}
