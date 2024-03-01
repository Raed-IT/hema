import 'package:get/get.dart';
import 'package:school/app/them/app_colors.dart';

void showSnackBar({required message, bool success = true}) {
  if (success) {
    Get.snackbar("success".tr, message,
        backgroundColor: AppColors.SECONDARY_COLOR.withOpacity(.7));
  } else {
    Get.snackbar("error".tr, message,
        backgroundColor: AppColors.PRIMARY_COLOR.withOpacity(.7));
  }
}
