import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';

import '../global/data/controllers/main_controller.dart';
import '../global/local_notification.dart';
import '../global_components/show_snackBar.dart';

mixin FilesUploadWithData {
  bool isFileUploadWithData = false;

  Future<dio.Response?> uploadFilesWithData(
      {required String url, required dio.FormData data}) async {
    if (!isFileUploadWithData) {
      isFileUploadWithData = true;
      dio.Dio dioR = dio.Dio();
      dioR.options.headers["authorization"] =
          "Bearer ${Get.find<MainController>().currentToken}";
      try {
        dio.Response response = await dioR.post(url,
            data: data,
            options: dio.Options(
                followRedirects: false,
                validateStatus: (status) {
                  return status! < 500;
                }), onSendProgress: (rec, total) {
          LocalNotification.showProgressNotification(
            channelName: "uploade ",
              progress: int.parse(((rec / total) * 100).toStringAsFixed(0)),
              title: "رفع منتج ",
              desc: "تم رفع ${((rec / total) * 100).toStringAsFixed(0)}%");
        });
        isFileUploadWithData = false;
        return response;
      } on dio.DioError catch (e) {
        isFileUploadWithData = false;
        LocalNotification.showProgressNotification(
          channelName: "upload",
            progress: 0, title: "فشل في الرفع  ", desc: "");
        if (e.response?.statusCode == 404) {
          showSnackBar(message: "الطلب غير موجود ");
        } else if (e.response?.statusCode == 500) {
          showSnackBar(message: "خطاء السيرفر  ");
        } else {
          showSnackBar(message: e.message);
        }
      }
    }
    return null;
  }
}
