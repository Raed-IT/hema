import 'package:get/get.dart';
import 'package:helper_plugin/utilitis/media_model.dart';
import 'package:school/app/global/data/models/department_model.dart';
import 'package:school/app/global/data/models/subject_model.dart';
import 'package:school/app/global/data/models/teacher_model.dart';

class HomeWorkModel {
  int? id;
  RxList<MediaModel> images = RxList([]);
  String? title;
  String? info;
  TeacherModel? teacher;
  SubjectModel? subject;
  DepartmentModel? department;
  String? endDate;

  HomeWorkModel(
      {this.endDate,
      this.subject,
      this.id,
      this.department,
      required this.images,
      this.title,
      this.info,
      this.teacher});

  HomeWorkModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    endDate = json['end_date'];
    title = json['title'];
    info = json['info'];
    // teacher = TeacherModel.fromJson(json['teacher']);
    subject = SubjectModel.fromJson(json['subject']);
    department = DepartmentModel.fromJson(json['department']);

    for (var item in json['images']) {
      images.add(MediaModel.fromJson(item));
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;

    data['endDate'] = this.endDate;
    data['title'] = this.title;
    data['info'] = this.info;
    data['teacher'] = this.teacher;
    data['subject'] = this.subject;
    return data;
  }
}
