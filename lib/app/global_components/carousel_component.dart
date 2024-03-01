import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:helper_plugin/utilitis/media_model.dart';
import 'package:logger/logger.dart';

 import '../global/images_show_component.dart';
import '../them/app_colors.dart';
import 'cached_network_image_component.dart';

class CarouselComponent extends StatefulWidget {
  double? height;
  double? width;
  Color color;

  ///[isExpanded] if true expanded Carousel at refresh page only else commanded set  isExpanded false
  bool isExpanded;
  bool isHasBorder;
  List<MediaModel> images;
  BorderRadius? borderRadius;

  CarouselComponent(
      {Key? key,
      this.width,
      this.isExpanded = true,
      this.isHasBorder = false,
      this.height,
      this.color = AppColors.SCAFFOLD_COLOR,
      required this.images,
      this.borderRadius});

  @override
  State<CarouselComponent> createState() => _CarouselComponentState();
}

class _CarouselComponentState extends State<CarouselComponent> {
  late final CarouselController _controller;
  int _current = 0;

  @override
  void initState() {
    _controller = CarouselController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.color,
      child: (widget.images.isNotEmpty)
          ? Column(children: [
              (widget.isExpanded)
                  ? Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Logger().w( widget.images.map((e) => e.url!).toList());
                          previewImage(
                            context: context,
                            images: widget.images.map((e) => e.url!).toList(),
                          );
                        },
                        child: CarouselSlider(
                          items: widget.images.map((i) {
                            return CachedNetworkImageComponent(
                              height: widget.height ?? Get.height,
                              width: widget.width ?? Get.width,
                              imageUrl: i.url!,
                              borderRadius:
                                  widget.borderRadius ?? BorderRadius.zero,
                            );
                          }).toList(),
                          carouselController: _controller,
                          options: CarouselOptions(
                            viewportFraction: 1.1,
                            disableCenter: true,
                            autoPlay: false,
                            onPageChanged: (index, reason) {
                              setState(() {
                                _current = index;
                              });
                            },
                          ),
                        ),
                      ),
                    )
                  : GestureDetector(
                      onTap: () {
                        previewImage(
                          context: context,
                          images: widget.images.map((e) => e.url!).toList(),
                        );
                      },
                      child: Container(
                        padding:
                            (widget.isHasBorder) ? EdgeInsets.all(2.sp) : null,
                        decoration: BoxDecoration(
                          borderRadius:
                              widget.borderRadius ?? BorderRadius.zero,
                          border: (widget.isHasBorder)
                              ? Border.all(
                                  color: AppColors.HEAD2_COLOR.withOpacity(.2))
                              : null,
                        ),
                        child: SizedBox(
                          height: widget.height ?? Get.height,
                          width: widget.width ?? Get.width,
                          child: ClipRRect(
                            borderRadius:
                                widget.borderRadius ?? BorderRadius.zero,
                            child: CarouselSlider(
                              items: widget.images.map((i) {
                                return CachedNetworkImageComponent(
                                  borderRadius: BorderRadius.zero,
                                  imageUrl: i.url!,
                                );
                              }).toList(),
                              carouselController: _controller,
                              options: CarouselOptions(
                                  viewportFraction: 1.1,
                                  disableCenter: true,
                                  autoPlay: false,
                                  onPageChanged: (index, reason) {
                                    setState(() {
                                      _current = index;
                                    });
                                  }),
                            ),
                          ),
                        ),
                      ),
                    ),
              (widget.images.length > 1)
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: widget.images.asMap().entries.map(
                        (entry) {
                          return GestureDetector(
                            onTap: () => _controller.animateToPage(entry.key),
                            child: IntrinsicHeight(
                              child: Container(
                                width: 15.0.w,
                                height: 3.0.h,
                                margin: EdgeInsets.symmetric(
                                    vertical: 8.0.h, horizontal: 2.0.w),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20.sp),
                                  ),
                                  color: (Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? Colors.white
                                          : AppColors.PRIMARY_COLOR)
                                      .withOpacity(
                                          _current == entry.key ? 0.9 : 0.1),
                                ),
                              ),
                            ),
                          );
                        },
                      ).toList(),
                    )
                  : Container(
                      height: 3.0.h,
                      margin: EdgeInsets.symmetric(
                          vertical: 8.0.h, horizontal: 2.0.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20.sp),
                        ),
                      ),
                    )
            ])
          : Container(),
    );
  }
}
/*
Column(
      children: [
        CarouselSlider(
          carouselController:_controller ,
          options: CarouselOptions(
            viewportFraction: 1.1,
            disableCenter: true,
            autoPlay: false,
            scrollPhysics: BouncingScrollPhysics()
          ),
          items: widget.images.map((i) {
            return Container(
                margin: const EdgeInsets.all(0),
                height: widget.height ?? Get.height,
                width: widget.width ?? Get.width,
                decoration: BoxDecoration(
                  color: AppColors.SCAFFOLD_COLOR,
                  image: DecorationImage(
                      image: CachedNetworkImageProvider(
                        i,
                      ),
                      fit: BoxFit.cover),
                ));
          }).toList(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget.images.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _controller.animateToPage(entry.key),
              child: Container(
                width: 12.0,
                height: 12.0,
                margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : Colors.black)
                        .withOpacity(_current == entry.key ? 0.9 : 0.4)),
              ),
            );
          }).toList(),
        ),
      ],
    )
*/
