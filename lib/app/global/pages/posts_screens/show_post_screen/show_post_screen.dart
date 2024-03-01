import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:get/get.dart';
import 'package:school/app/global/pages/posts_screens/show_post_screen/show_post_controller.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../global_components/carousel_component.dart';
import '../../../../them/app_colors.dart';

class ShowPostScreen extends GetView<ShowPostController> {
  const ShowPostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            flexibleSpace: SafeArea(
              child: Padding(
                padding: EdgeInsets.only(left: 18.w, right: 18.w, top: 7.h),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(''),
                    Text(
                      "عرض منشور ",
                      style: TextStyle(
                          color: AppColors.SCAFFOLD_COLOR, fontSize: 17.sp),
                    ),
                    GestureDetector(
                      onTap: () => Get.back(),
                      child: Icon(
                        Icons.arrow_forward_outlined,
                        color: AppColors.SCAFFOLD_COLOR,
                        size: 22.sp,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            automaticallyImplyLeading: false,
          ),
          (controller.post.images.isNotEmpty)
              ? SliverToBoxAdapter(
                  child: SizedBox(
                    height: 300.h,
                    width: Get.width,
                    child:  Hero(
                      tag: "post-slider-${controller.post.id}",

                      child: CarouselComponent(
                        images: controller.post.images,
                      ),
                    ),
                  ),
                )
              : const SliverToBoxAdapter(),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(18.sp),
              child: HtmlWidget(
                "${controller.post.body}",
                onTapUrl: (String? url) async {
                  if (url != null) {
                    return await launch(url);
                  }
                  return Future.value(false);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
