import 'package:card_loading/card_loading.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:school/app/global/data/models/data_rating_model.dart';
import 'package:school/app/global_components/appbar_components/main_appbar.dart';
import 'package:school/app/modules/parent/pages/statistic_screen/statistic_controller.dart';
import 'package:school/app/them/app_colors.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../global_components/drawer_component.dart';

class StatisticScreen extends GetView<StatisticController> {
  StatisticScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerComponent(),
      body: Builder(
        builder: (context) {
          return CustomScrollView(
            physics: const BouncingScrollPhysics(),
            controller: controller.scrollController,
            slivers: [
              MainAnimatedAppBarComponent(
                  herTag: "statisitc-tag",
                  svgUrl: "assets/svg/statisitc.svg",
                  openDrawer: (conte) {
                    Scaffold.of(conte).openDrawer();
                  },
                  scrollController: controller.scrollController,
                  supWidgets: [
                    Text(
                      "احصائيات الطالب ",
                      style: TextStyle(
                          color: AppColors.ORANG_APP_COLOR,
                          fontSize: 17.sp,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "${controller.student.fullName}",
                      style: TextStyle(
                          color: AppColors.SCAFFOLD_COLOR, fontSize: 14.sp),
                    )
                  ]),
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.all(10.sp),
                  child: Obx(
                    () => DottedBorder(
                      padding: EdgeInsets.only(right: 10.w, left: 10.w),
                      radius: Radius.circular(50.sp),
                      strokeWidth: 1.sp,
                      dashPattern: const [3, 4],
                      borderType: BorderType.RRect,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(50.sp),
                          ),
                        ),
                        height: 30.h,
                        child: DropdownButton(
                          value: controller.selectedSubject.value,
                          underline: Container(),
                          disabledHint: (controller.isLoadSubject.value)
                              ? SizedBox(
                                  height: 20.h,
                                  width: 20.w,
                                  child: CircularProgressIndicator(
                                    color: AppColors.SECONDARY_COLOR,
                                    strokeWidth: 2.sp,
                                  ))
                              : Center(
                                  child: Text('no_subjects'.tr),
                                ),
                          elevation: 0,
                          alignment: Alignment.center,
                          isExpanded: true,
                          hint: Text(
                            'اختر الماده لعرض الاحصائيات',
                          ),
                          onChanged: (newValue) {
                            print(newValue);
                          },
                          iconDisabledColor: AppColors.PRIMARY_COLOR,
                          iconEnabledColor: AppColors.SECONDARY_COLOR,
                          items: controller.subjects.map((selectedSubject) {
                            return DropdownMenuItem(
                              enabled: (controller.selectedSubject.value ==
                                      selectedSubject)
                                  ? false
                                  : true,
                              onTap: () {
                                controller.subject = selectedSubject;
                              },
                              value: selectedSubject,
                              child: Text(
                                "${selectedSubject.name}",
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Obx(() {
                  if (!controller.isLoadData.value) {
                    return SizedBox(
                      height: 350.h,
                      child: Card(
                        elevation: 7,
                        shadowColor: AppColors.elevation_card_color,
                        margin: EdgeInsets.all(10.sp),
                        child: SfCartesianChart(
                          enableAxisAnimation: true,
                          primaryYAxis: NumericAxis(labelFormat: "{value}%"),
                          // enableMultiSelection: true,
                          title: ChartTitle(
                              textStyle: TextStyle(
                                  fontSize: 13.sp,
                                  color: AppColors.PRIMARY_COLOR,
                                  fontFamily: "app",
                                  fontWeight: FontWeight.bold),
                              alignment: ChartAlignment.center,
                              text: (controller.selectedSubject.value != null)
                                  ? "تقيم لمادة  ${controller.selectedSubject.value?.name}"
                                  : ''),
                          primaryXAxis: CategoryAxis(),
                          legend: Legend(isVisible: false),
                          tooltipBehavior: TooltipBehavior(enable: true),
                          series: <ChartSeries<DataRatingMode, String>>[
                            SplineSeries<DataRatingMode, String>(
                              dataSource: controller.data
                                  .map(
                                    (item) => DataRatingMode(
                                      item.date!,
                                      double.parse("${item.ratio}"),
                                    ),
                                  )
                                  .toList(),
                              name: "",
                              xValueMapper: (DataRatingMode ratings, _) =>
                                  ratings.date,
                              yValueMapper: (DataRatingMode ratings, _) =>
                                  ratings.rating,
                              dataLabelSettings: const DataLabelSettings(
                                  isVisible: true, color: AppColors.PRIMARY_COLOR),
                              color: AppColors.ORANG_APP_COLOR,
                              animationDuration: 1000,
                              width: 3.sp,
                            ),
                          ],
                        ),
                      ),
                    );
                  } else {
                    return Opacity(
                      opacity: 0.2,
                      child: CardLoading(
                        height: 440.h,
                        borderRadius: BorderRadius.all(Radius.circular(10.sp)),
                        margin: EdgeInsets.all(15.sp),
                      ),
                    );
                  }
                }),
              )
            ],
          );
        }
      ),
    );
  }
}

/*
 SfCartesianChart(
            primaryXAxis: CategoryAxis(),
            legend: Legend(isVisible: false),
            tooltipBehavior: TooltipBehavior(enable: true),
            series: <ChartSeries<DataRatingMode, String>>[
              LineSeries<DataRatingMode, String>(
                dataSource: data,
                xValueMapper: (DataRatingMode sales, _) => sales.year,
                yValueMapper: (DataRatingMode sales, _) => sales.sales,
                dataLabelSettings: const DataLabelSettings(isVisible: true),
              )
            ],
          ),
*/
