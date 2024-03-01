import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../them/app_colors.dart';

class ProgressTable extends GetView {
  final TextStyle _textStyle = const TextStyle(fontWeight: FontWeight.bold);

  const ProgressTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 490.h,
        child: DataTable2(
          scrollController: ScrollController(),
          columnSpacing: 12.sp,
          fixedTopRows: 1,
          horizontalMargin: 10.w,
          minWidth: size.width,
          columns: [
            DataColumn2(
              label: progress(),
              size: ColumnSize.L,
            ),
            DataColumn(
              label: progress(),
            ),
            DataColumn(
              label: progress(),
            ),
            DataColumn(
              label: progress(),
            ),
            DataColumn(
              label: progress(),
            ),
          ],
          rows: List<DataRow>.generate(
            100,
            (index) => DataRow(cells: [
              DataCell(progress()),
              DataCell(progress()),
              DataCell(progress()),
              DataCell(progress()),
              DataCell(progress()),
            ]),
          ),
        ),
      ),
    );
  }

  Widget progress() {
    return Container(
      margin: EdgeInsets.only(top: 5.h, bottom: 5.h, right: 5.w, left: 6.w),
      height: 19.h,
      width: 80.w,
      child: Shimmer.fromColors(
        // direction: ShimmerDirection.btt,
        period: Duration(seconds: 3),
        baseColor: AppColors.BASEShIMMER_COLOR,
        highlightColor: AppColors.HIGHLIGHT_SHIMMER_COLOR,
        child: Container(
          // height: 10,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(10.sp),
            ),
          ),
        ),
      ),
    );
  }
}
