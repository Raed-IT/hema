import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:school/app/global_components/appbar_components/main_appbar.dart';
import 'package:school/app/global_components/drawer_component.dart';
import 'package:school/app/modules/parent/pages/present_tabel_screens/show_table_present/show_present_controller.dart';

import '../../../../../global_components/lists_components/no_data_component.dart';
import '../../../../../them/app_colors.dart';
import '../../components/progress_tabel.dart';

class ParentShowPresentScreen extends GetView<ParentShowPresentController> {
  final TextStyle _textStyle = const TextStyle(fontWeight: FontWeight.bold);

  const ParentShowPresentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerComponent(),
      body: Builder(builder: (context) {
        return CustomScrollView(
          controller: controller.scrollController,
          slivers: [
            MainAnimatedAppBarComponent(
                svgUrl: "assets/svg/weakly.svg",
                openDrawer: (conte) {
                  Scaffold.of(context).openDrawer();
                },
                scrollController: controller.scrollController,
                supWidgets: [
                  const Text(""),
                  Text(
                    controller.label,
                    style: TextStyle(
                        color: AppColors.ORANG_APP_COLOR,
                        fontWeight: FontWeight.bold,
                        fontSize: 25.sp),
                  ),
                ]),
            Obx(
              () => (controller.isLoad.value)
                  ? const ProgressTable()
                  : controller.absents.isNotEmpty
                      ? SliverToBoxAdapter(
                          child: SizedBox(
                            height: Get.height * 0.7,
                            child: DataTable2(
                              columnSpacing: 12.sp,
                              fixedTopRows: 1,
                              horizontalMargin: 10.w,
                              minWidth: Get.width,
                              columns: [
                                DataColumn(
                                  label: Text('ID', style: _textStyle),
                                ),
                                DataColumn2(
                                  label: Text('day'.tr, style: _textStyle),
                                  size: ColumnSize.L,
                                ),
                                DataColumn(
                                  label: Text('date'.tr, style: _textStyle),
                                ),
                              ],
                              rows: controller.absents
                                  .map(
                                    (e) => DataRow(cells: [
                                      DataCell(
                                        Text("${e.id}"),
                                      ),
                                      DataCell(
                                        Text(
                                          DateFormat('EEEE').format(
                                            DateTime.parse("${e.date}"),
                                          ),
                                        ),
                                      ),
                                      DataCell(Text("${e.date}")),
                                    ]),
                                  )
                                  .toList(),
                            ),
                          ),
                        )
                      : NoDataSliverComponent(
                          onTap: () => controller.getData(),
                        ),
            )
          ],
        );
      }),
    );
  }
}
