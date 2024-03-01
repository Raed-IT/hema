import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:num_remap/num_remap.dart';

import '../../global/data/constants.dart';
import '../../them/app_colors.dart';
import '../avatar_component.dart';
import 'child_size_notifier_component.dart';

// ignore: must_be_immutable
class MainAnimatedAppBarComponent extends StatefulWidget {
  ScrollController scrollController  ;
  List<Widget> supWidgets;
  String? herTag;
  ImageProvider? imageProvider;
  String? svgUrl;
  Color? svgColor;

  void Function(BuildContext  context)? openDrawer;

  MainAnimatedAppBarComponent({
    Key? key,
    this.svgColor,
    this.svgUrl,
    required this.openDrawer,
    required this.scrollController,
    required this.supWidgets,
    this.imageProvider,
    this.herTag,
  })  : assert(imageProvider == null ? svgUrl != null : true,
            "please user only image provider or svg url "),
        assert(svgColor != null ? svgUrl != null : true,
            "please don't user svg color if not user svg url ");

  @override
  State<MainAnimatedAppBarComponent> createState() =>
      _MainAnimatedAppBarComponentState();
}

class _MainAnimatedAppBarComponentState
    extends State<MainAnimatedAppBarComponent> {
  double radiusAvatar = 60.sp;
  double currentRadiusAvatar = 60.sp;
  double maxScrollUp = 135.h;
  double? rightAvatarPosition;
  double heightSupWidgets = 50.h;
  Size sizeAvatar = Size(60.sp, 60.sp);
  Size sizeSupWidgets = Size(50.sp, 50.sp);
  late Size sizeAppBar = Size(Get.width, 250.h);
  double radiusAppBar = 20.sp;
  bool isUp = false;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      expandedHeight: Constants.EXPANDED_MAIN_APP_BAR_HIEIGHT,
      pinned: true,
      floating: false,
      toolbarHeight: Constants.MAIN_APP_BAR_HIEIGHT,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(radiusAppBar),
        ),
      ),
      backgroundColor: AppColors.PRIMARY_COLOR,
      flexibleSpace: SafeArea(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            ChildSizeNotifierComponent(
              builder: (BuildContext context, Size size, Widget? child) {
                if (!size.isEmpty) {
                  updateSize(size: size, type: "appbar");
                }
                return child!;
              },
              child: AnimatedContainer(
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: AppColors.MAIN_GRADIENT_COLOR,
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(radiusAppBar),
                    bottomRight: Radius.circular(radiusAppBar),
                  ),
                ),
                duration: const Duration(milliseconds: 200),
              ),
            ),
            ChildSizeNotifierComponent(
              builder: (BuildContext context, Size size, Widget? child) {
                if (!size.isEmpty) {
                  updateSize(size: size, type: "supWidgets");
                }
                return child!;
              },
              child: AnimatedPositioned(
                duration: const Duration(milliseconds: 200),
                bottom: 10.h,
                right: (sizeAppBar.width - sizeSupWidgets.width) / 2,
                child: SizedBox(
                  height: heightSupWidgets,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ...widget.supWidgets,
                      ],
                    ),
                  ),
                ),
              ),
            ),
            ChildSizeNotifierComponent(
              builder: (BuildContext context, Size size, Widget? child) {
                if (!size.isEmpty) {
                  updateSize(size: size, type: "avatar");
                }
                return child!;
              },
              child: AnimatedPositioned(
                top: (sizeAppBar.height - sizeAvatar.height) / 2,
                right: rightAvatarPosition ??
                    (sizeAppBar.width - sizeAvatar.width) / 2,
                duration: const Duration(milliseconds: 200),
                child: Hero(
                  tag: widget.herTag ?? {},
                  child: widget.svgUrl != null
                      ? SvgPicture.asset(
                          alignment: Alignment.center,
                          allowDrawingOutsideViewBox: true,
                          color: widget.svgColor ?? AppColors.SCAFFOLD_COLOR,
                          height: currentRadiusAvatar * 1.5,
                          widget.svgUrl!,
                          fit: BoxFit.cover,
                        )
                      : AvatarComponent(
                          radius: currentRadiusAvatar + 3,
                          widget: CircleAvatar(
                            backgroundColor: AppColors.SCAFFOLD_COLOR,
                            radius: currentRadiusAvatar,
                            backgroundImage: widget.imageProvider,
                          ),
                        ),
                ),
              ),
            ),
            Positioned(
              top: 15.h,
              left: 10.w,
              child: IconButton(
                icon: Icon(Icons.menu,
                    color: AppColors.SCAFFOLD_COLOR, size: 20.sp),
                onPressed: () {
                  if (widget.openDrawer != null) {
                    widget.openDrawer!(context);
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    widget.scrollController.addListener(() {
      double pixel = widget.scrollController.position.pixels;

      if (pixel <= maxScrollUp) {
        setState(
          () {
            //controller currentRadiusAvatar below
            currentRadiusAvatar =
                pixel.remap(0, maxScrollUp, radiusAvatar, 22.sp);
            if (currentRadiusAvatar > radiusAvatar) {
              currentRadiusAvatar = radiusAvatar;
            }

            // controller position avatar
            // if (pixel > 65.h) {
            //   rightAvatarPosition = pixel.remap(
            //       104, 170, (sizeAppBar.width - sizeAvatar.width) / 2, 10.w);
            //   // rightAvatarPosition = 10.w;
            // } else {
            //   rightAvatarPosition = (sizeAppBar.width - sizeAvatar.width) / 2;
            // }
            //  control radiusAppBar
            radiusAppBar = pixel.remap(0, sizeAppBar.height, 25.sp, 5.sp);
          },
        );
      }
    });
  }

  @override
  void dispose() {
    widget.scrollController.dispose();
    super.dispose();
  }

  void updateSize({required Size size, String? type}) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (type == "avatar") {
        sizeAvatar = size;
        if (widget.scrollController.position.pixels > 65.h) {
          rightAvatarPosition = widget.scrollController.position.pixels.remap(
              10.w, 170.sp, (sizeAppBar.width - sizeAvatar.width) / 2, 20.w);
          if (rightAvatarPosition! <= 10.w) {
            rightAvatarPosition = 10.w;
          }
        } else {
          rightAvatarPosition = (sizeAppBar.width - sizeAvatar.width) / 2;
        }
        setState(() {});
      } else if (type == "appbar") {
        sizeAppBar = size;
        // rightAvatarPosition = (sizeAppBar.width - sizeAvatar.width) / 2;
        setState(() {});
      } else if (type == "supWidgets") {
        sizeSupWidgets = size;
        setState(() {});
      }
    });
  }
}
