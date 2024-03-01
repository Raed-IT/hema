import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:school/app/global/data/models/student_model.dart';
import 'package:school/app/modules/parent/pages/home_screen/home_controller.dart';
import 'package:school/app/modules/parent/route/routs.dart';
import 'package:school/app/them/app_colors.dart';

import 'dialog_abcesnt.dart';

class ParentCardStudentComponent extends GetView<ParentHomeController> {
  StudentModel student;
  int index;

  ParentCardStudentComponent({
    Key? key,
    required this.student,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.only(right: 10.w, left: 10.w),
      height: 120.h,
      child: Card(
        shadowColor: AppColors.elevation_card_color,
        elevation: 15,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(15.sp),
          ),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Hero(
                  tag: student.id.toString(),
                  child: Container(
                    height: 70.h,
                    width: 70.w,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage("${student.img}"),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.sp),
                      ),
                      color: AppColors.PRIMARY_COLOR.withOpacity(.2),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "${student.fullName}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17.sp),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 80.h,
                          child: Text(
                            "${student.section?.name}",
                            style: TextStyle(fontSize: 10.sp),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        SizedBox(
                          width: 70.h,
                          child: Text(
                            "${student.department?.name}",
                            style: TextStyle(fontSize: 10.sp),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            RatingBar.builder(
                              initialRating: 3,
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 1,
                              itemPadding:
                                  const EdgeInsets.symmetric(horizontal: 4.0),
                              itemBuilder: (context, _) => SizedBox(
                                height: 10.h,
                                child: Icon(
                                  size: 5.sp,
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                              ),
                              onRatingUpdate: (double value) {},
                            ),
                            Text(
                              "${student.ratio}",
                              style: TextStyle(fontFamily: "", fontSize: 10.sp),
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
            const Spacer(),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 5.w, right: 5.w),
                    child: InkWell(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20.sp),
                      ),
                      overlayColor: MaterialStateProperty.all(
                        AppColors.SECONDARY_COLOR.withOpacity(.3),
                      ),
                      splashColor: AppColors.SECONDARY_COLOR,
                      onTap: () => Get.toNamed(ParentAppRoutes.SHOW_STUDENT,
                          arguments: {"student": student}),
                      child: DottedBorder(
                        radius: Radius.circular(20.sp),
                        strokeWidth: 1.sp,
                        color: AppColors.PRIMARY_COLOR,
                        dashPattern: const [3, 4],
                        borderType: BorderType.RRect,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SizedBox(),
                            Text(
                              'details'.tr,
                              style: const TextStyle(
                                  color: AppColors.PRIMARY_COLOR),
                            ),
                            RotatedBox(
                              quarterTurns: 2,
                              child: Padding(
                                padding:
                                    EdgeInsets.only(left: 8.0.w, right: 8.w),
                                child: const Icon(Icons.arrow_right_alt_rounded,
                                    color: AppColors.PRIMARY_COLOR),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 5.w, right: 5.w),
                    child: InkWell(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20.sp),
                      ),
                      overlayColor: MaterialStateProperty.all(
                        AppColors.SECONDARY_COLOR.withOpacity(.3),
                      ),
                      splashColor: AppColors.SECONDARY_COLOR,
                      onTap: () => showParentAbsentBottomSheet(
                          controller.paginationData[index], context,
                          studentId: student.id!),
                      child: DottedBorder(
                        radius: Radius.circular(20.sp),
                        strokeWidth: 1.sp,
                        color: AppColors.PRIMARY_COLOR,
                        dashPattern: const [3, 4],
                        borderType: BorderType.RRect,
                        child: Center(
                          child: Text(
                            'request_absent'.tr,
                            style:
                                const TextStyle(color: AppColors.PRIMARY_COLOR),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
