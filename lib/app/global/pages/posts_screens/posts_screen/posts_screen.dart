import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:school/app/global/data/models/post_model.dart';
import 'package:school/app/global/pages/posts_screens/posts_screen/posts_controller.dart';
import 'package:school/app/them/app_colors.dart';

import '../../../../global_components/appbar_components/main_appbar.dart';
import '../../../../global_components/lists_components/animation_sliver_list_component.dart';
import '../../../../global_components/lists_components/no_data_component.dart';
import '../../../images_show_component.dart';
import '../../../route/routs.dart';

class PostsScreen extends GetView<PostsController> {
  const PostsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return controller.buildScreen(
      widgets: [
        Obx(
          () => (controller.isLoadPagination.value)
              ? SliverToBoxAdapter(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 200.h,
                      ),
                      const CircularProgressIndicator(
                        color: AppColors.SECONDARY_COLOR,
                      ),
                    ],
                  ),
                )
              : (controller.paginationData.isNotEmpty)
                  ? AnimationSliverList(
                      length: controller.paginationData.length,
                      builder: (context, index, animation) {
                        return buildCard(
                            post: controller.paginationData[index],
                            context: context);
                      },
                    )
                  : NoDataSliverComponent(
                      onTap: () =>
                          controller.getPaginationData(isRefresh: true),
                    ),
        )
      ],
      appBar: MainAnimatedAppBarComponent(
        openDrawer: (conte) => Scaffold.of(conte).openDrawer(),
        scrollController: controller.scrollController!,
        svgUrl: "assets/svg/news.svg",
        supWidgets: [
          Text(''),
          Text(
            "اخبار المدرسة ",
            style: TextStyle(
                color: AppColors.ORANG_APP_COLOR,
                fontSize: 20.sp,
                fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }

  Widget buildCard({required PostModel post, required BuildContext context}) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(GlobalAppRoutes.SHOW_POSTE_SCREEN,
            arguments: {"post": post});
      },
      child: Card(
        shadowColor: AppColors.elevation_color,
        margin: EdgeInsets.only(left: 15.w, right: 15.w, bottom: 10.h),
        elevation: 7,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20.sp),
          ),
        ),
        child: Container(
          padding: const EdgeInsets.all(0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Hero(
                    tag: "post-slider-${post.id}",
                    child: Card(
                      shadowColor: AppColors.elevation_color,
                      margin: EdgeInsets.all(10.w),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20.sp),
                        ),
                      ),
                      elevation: 5,
                      child: GestureDetector(
                        onTap: () => previewImage(images: [
                          "${post.img}",
                          ...post.images.map((e) => e.url!).toList()
                        ], context: context),
                        child: Container(
                          width: 100.w,
                          height: 100.h,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.sp)),
                            image: (post.img!.isNotEmpty)
                                ? DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage("${post.img}"),
                                  )
                                : const DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                        "assets/custom/logo-school.png"),
                                  ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    child: Text(post.title ?? ''),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.w, right: 20.w),
                child: Text(
                  post.createdAt ?? '',
                  style: const TextStyle(color: AppColors.ORANG_APP_COLOR),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
