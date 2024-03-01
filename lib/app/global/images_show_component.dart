import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// import 'package:image_downloader/image_downloader.dart';
import 'package:photo_browser/photo_browser.dart';

import '../global_components/show_snackBar.dart';

Future<void> previewImage(
    {required BuildContext context, required List<String> images}) async {
  PhotoBrowser photoBrowser = PhotoBrowser(
    scrollPhysics: const BouncingScrollPhysics(),
    allowPullDownToPop: false,
    allowShrinkPhoto: true,
    allowTapToPop: false,
    allowSwipeDownToPop: false,
    positionBuilders: images
        .map(
          (e) => (context, curIndex, totalNum) {
            return Positioned(
              bottom: 10.h,
              child: Container(
                width: Get.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(child: Container()),
                    GestureDetector(
                      child: Row(
                        children: const [
                          Icon(
                            Icons.save,
                            size: 30,
                            color: Colors.white,
                          ),
                          Text(
                            "حفظ الصوره ",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                      onTap: () async {
                        try {
                          EasyLoading.show(dismissOnTap: false);
                          // await ImageDownloader.downloadImage(images[curIndex],
                          //     destination:
                          //         AndroidDestinationType.directoryPictures);
                          EasyLoading.showSuccess('success'.tr);
                        } catch (e) {
                          EasyLoading.showError("error".tr);
                          showSnackBar(message: "$e", success: false);
                        }
                      },
                    ),
                    Expanded(child: Container()),
                  ],
                ),
              ),
            );
          },
        )
        .toList(),
    positions: (BuildContext context) => <Positioned>[
      Positioned(
        child: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(
                  Icons.close,
                  color: Colors.white,
                ),
                onPressed: () => Get.back(),
              ),
            ],
          ),
        ),
      ),
    ],
    imageUrlBuilder: (int index) {
      return images[index];
    },
    itemCount: images.length,
    initIndex: 0,
  );
  photoBrowser.push(context);
}
