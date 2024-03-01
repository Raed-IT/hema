import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:school/app/global/data/models/student_model.dart';

class ParentShowStudentController extends GetxController {
  StudentModel student = Get.arguments['student'];
  ScrollController scrollController = ScrollController();
}
