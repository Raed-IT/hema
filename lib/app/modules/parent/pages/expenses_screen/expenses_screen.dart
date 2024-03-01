import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:school/app/global/data/models/balance.dart';
import '../../../../global_components/appbar_components/main_appbar.dart';
import '../../../../global_components/lists_components/animation_sliver_list_component.dart';
import '../../../../global_components/lists_components/main_list_progress_component.dart';
import '../../../../global_components/lists_components/no_data_component.dart';
import '../../../../them/app_colors.dart';
import 'expenses_controller.dart';

class ParentExpensesScreen extends GetView<ParentExpensesController> {
  const ParentExpensesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return controller.buildScreen(
      appBar: MainAnimatedAppBarComponent(
          herTag: "monney-tag",
          openDrawer: (conte) => Scaffold.of(conte).openDrawer(),
          scrollController: controller.scrollController!,
          svgUrl: "assets/svg/monney.svg",
          supWidgets: [
            Text(""),
            Text(
              "الدفعات",
              style: TextStyle(
                  color: AppColors.ORANG_APP_COLOR,
                  fontWeight: FontWeight.bold,
                  fontSize: 25.sp),
            ),
          ]),
      widgets: [
        Obx(() => (controller.isLoadPagination.value)
            ? MainListProgressComponent()
            : (controller.paginationData.isNotEmpty)
                ? AnimationSliverList(
                    length: controller.paginationData.length,
                    builder: (context, index, animation) {
                      return buildCard(
                          balance: controller.paginationData[index]);
                    },
                  )
                : NoDataSliverComponent(
                    onTap: () => controller.getPaginationData(isRefresh: true),
                  )),
      ],
    );
  }

  Widget buildCard({required BalanceModel balance}) {
    return SizedBox(
      height: 80.h,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10.sp),
          ),
        ),
        margin: EdgeInsets.only(left: 10.w, right: 10.w, top: 10.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 10.sp, right: 10.sp, left: 10.sp),
              child: SizedBox(
                width: 200.w,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "القيمة : ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15.sp),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          balance.debit == 0
                              ? balance.credit.toString()
                              : balance.debit.toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13.sp,
                              fontFamily: ""),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 99.h,
              width: 80.w,
              decoration: BoxDecoration(
                color: balance.credit == 0
                    ? AppColors.PRIMARY_COLOR.withOpacity(.5)
                    : AppColors.ORANG_APP_COLOR.withOpacity(.5),
                borderRadius: BorderRadius.all(
                  Radius.circular(10.sp),
                ),
              ),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      balance.atDate.toString(),
                      style: TextStyle(
                          fontSize: 12.sp, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Center(
                    child: balance.credit == 0
                        ? Icon(
                            Icons.trending_down,
                            size: 30.sp,
                          )
                            .animate()
                            .scale(duration: const Duration(milliseconds: 500))
                        : Icon(Icons.trending_up, size: 30.sp)
                            .animate()
                            .scale(duration: const Duration(milliseconds: 500)),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
