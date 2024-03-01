import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:school/app/global_components/cached_network_image_component.dart';
import 'package:school/app/modules/parent/pages/home_work_screens/show_home_work_screen/show_home_work_controller.dart';

import '../../../../../global/images_show_component.dart';
import '../../../../../them/app_colors.dart';

class ShowHomeWorkCompleted extends GetView<ParentShowHomeWorkController> {
  const ShowHomeWorkCompleted({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        if (controller.homeWorkCompleted.value!.images!.isNotEmpty)
          buildTitle(title: "اجابتك صورة :"),
        if (controller.homeWorkCompleted.value!.images!.isNotEmpty)
          GestureDetector(
            onTap: () => previewImage(
                context: context,
                images: controller.homeWorkCompleted.value!.images!),
            child: Container(
              margin: EdgeInsets.all(10.w),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.sp),
                  ),
                ),
                elevation: 3,
                child: CachedNetworkImageComponent(
                  borderRadius: BorderRadius.all(Radius.circular(10.sp)),
                  width: Get.width,
                  height: 150.h,
                  imageUrl: controller.homeWorkCompleted.value!.images![0],
                ),
              ),
            ),
          ),
        if (controller.homeWorkCompleted.value!.answer != null)
          buildTitle(title: "اجابتك كتابتا :"),
        if (controller.homeWorkCompleted.value!.answer != null)
          Padding(
            padding: EdgeInsets.only(left: 20.w, right: 20.w),
            child: GestureDetector(
              onTap: () {
                FlutterClipboard.copy(
                    "${controller.homeWorkCompleted.value!.answer}");
                final snackBar = SnackBar(
                  content: const Text('تم نسخ الوظيفة  '),
                  action: SnackBarAction(
                    label: 'اغلاق',
                    onPressed: () {},
                  ),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
              child: Text(controller.homeWorkCompleted.value!.answer!),
            ),
          )
      ],
    );
  }

  Widget buildTitle({required String title}) {
    return Padding(
      padding: EdgeInsets.only(left: 20.w, right: 20.w),
      child: Text(
        title,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15.sp,
            color: AppColors.PRIMARY_COLOR),
      ),
    );
  }
}
