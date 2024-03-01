import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:num_remap/num_remap.dart';
import 'package:school/app/global/data/constants.dart';

import '../../them/app_colors.dart';
import '../avatar_component.dart';
import 'child_size_notifier_component.dart';

class HorizontalAnimatedAppBarComponent extends StatefulWidget {
  ScrollController scrollController = ScrollController();
  List<Widget> supWidgets;
  String? herTag;
  ImageProvider? imageProvider;
  String? svgUrl;
  Color? svgColor;
  void Function()? openDrawer;

  HorizontalAnimatedAppBarComponent({
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
  State<HorizontalAnimatedAppBarComponent> createState() =>
      _HorizontalAnimatedAppBarComponentState();
}

class _HorizontalAnimatedAppBarComponentState
    extends State<HorizontalAnimatedAppBarComponent> {
  double radiusAppBar = 10.sp;
  late Size sizeAppBar = Size(Get.width, 250.h);
  late Size sizeLogo = Size(150.w, 150.w);
  Size sizeSupWidgets = Size(50.sp, 50.sp);
  double heightSupWidgets = 50.h;
  Size sizeAvatar = Size(60.sp, 60.sp);
  double? topAvatarPosition = 10.w;
  double currentRadiusAvatar = 50.sp;
  double maxScrollUp = 135.h;
  double radiusAvatar = 50.sp;

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
            topAvatarPosition = sizeAppBar.height - (sizeAvatar.width / 2);
            radiusAppBar = pixel.remap(0, sizeAppBar.height, 25.sp, 5.sp);
          },
        );
      } else {
        topAvatarPosition = (sizeAppBar.height - sizeAvatar.height) / 2;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.only(bottom: 60.sp),
      sliver: SliverAppBar(
        automaticallyImplyLeading: false,
        expandedHeight: Constants.EXPANDED_MAIN_APP_BAR_HIEIGHT,
        pinned: true,
        floating: false,
        toolbarHeight:Constants. MAIN_APP_BAR_HIEIGHT,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(radiusAppBar),
          ),
        ),
        backgroundColor: AppColors.PRIMARY_COLOR,
        flexibleSpace: SafeArea(
          child: Stack(clipBehavior: Clip.none, children: [
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
                bottom: 5.h,
                right: (sizeAppBar.width - sizeSupWidgets.width) / 2,
                child: SizedBox(
                  height: heightSupWidgets,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.only(
                          right:
                              currentRadiusAvatar.remap(20.sp, 50.sp, 0, 50.w)),
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
            ),
            ChildSizeNotifierComponent(
              builder: (BuildContext context, Size size, Widget? child) {
                if (!size.isEmpty) {
                  updateSize(size: size, type: "avatar");
                }
                return child!;
              },
              child: AnimatedPositioned(
                top: topAvatarPosition,
                right: 20.w,
                duration: const Duration(milliseconds: 200),
                child: Hero(
                  tag: widget.herTag ?? {},
                  child: Card(
                    elevation: 5,
                    shadowColor: AppColors.elevation_color,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                            Radius.circular(currentRadiusAvatar + 3))),
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
                            bgColor: AppColors.SCAFFOLD_COLOR,
                            widget: CircleAvatar(
                              backgroundColor: AppColors.SCAFFOLD_COLOR,
                              radius: currentRadiusAvatar,
                              backgroundImage: widget.imageProvider,
                            ),
                          ),
                  ),
                ),
              ),
            ),
            ChildSizeNotifierComponent(
              builder: (BuildContext context, Size size, Widget? child) {
                if (!size.isEmpty) {
                  updateSize(size: size, type: "logo");
                }
                return child!;
              },
              child: Positioned(
                top: 30.h,
                right: (sizeAppBar.width - sizeLogo.width) / 2,
                child: Visibility(
                  maintainState: true,
                  maintainAnimation: true,
                  visible: widget.scrollController.position.pixels < 30.h,
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 1000),
                    opacity:
                        widget.scrollController.position.pixels < 30.h ? 1 : 0,
                    child: Image.asset(
                      width: sizeLogo.width,
                      height: sizeLogo.height,
                      "assets/custom/logo-school.png",
                      color: AppColors.SCAFFOLD_COLOR,
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
                onPressed: widget.openDrawer,
              ),
            )
          ]),
        ),
      ),
    );
  }

  void updateSize({required Size size, String? type}) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (type == "appbar") {
        sizeAppBar = size;
        if (widget.scrollController.position.pixels <= maxScrollUp) {
          topAvatarPosition = sizeAppBar.height - (sizeAvatar.width / 2);
        } else {
          topAvatarPosition = (sizeAppBar.height - sizeAvatar.width) / 2;
        }
        setState(() {});
      } else if (type == "avatar") {
        sizeAvatar = size;
        setState(() {});
      } else if (type == "supWidgets") {
        sizeSupWidgets = size;
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    widget.scrollController.dispose();
    super.dispose();
  }
}
