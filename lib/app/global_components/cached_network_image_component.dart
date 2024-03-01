import 'package:cached_network_image/cached_network_image.dart';
import 'package:card_loading/card_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../them/app_colors.dart';

class CachedNetworkImageComponent extends StatelessWidget {
  String imageUrl;
  BorderRadius? borderRadius;
  double? height;
  double? width;
  BoxFit? fit;

  CachedNetworkImageComponent(
      {Key? key,
      required this.imageUrl,
      this.borderRadius,
      this.height,
      this.fit,
      this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      fit: fit,
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          borderRadius:
              borderRadius ?? BorderRadius.all(Radius.circular(20.sp)),
          color: fit == null
              ? AppColors.PRIMARY_COLOR.withOpacity(.2)
              : Colors.transparent,
          image: DecorationImage(
            image: imageProvider,
            fit: fit ?? BoxFit.cover,
          ),
        ),
        height: height ?? 77.h,
        width: width ?? 77.w,
      ),
      placeholder: (context, url) => CardLoading(
        height: height ?? 77.h,
        width: width ?? 77.h,
        borderRadius: borderRadius ?? BorderRadius.all(Radius.circular(20.sp)),
      ),
      errorWidget: (context, url, error) => SizedBox(
        height: height ?? 77.h,
        width: width ?? 77.h,
        child: Icon(
          Icons.error,
          size: 40.sp,
        ),
      ),
    );
  }
}
