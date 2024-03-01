import 'package:get/get.dart';
import 'package:helper_plugin/utilitis/media_model.dart';
import 'package:school/app/global/data/models/main_model.dart';
import 'package:school/app/global/data/models/subject_model.dart';

class ExamModel extends Model {
  int? id;
  String? section;
  String? department;
  SubjectModel? subject;
  String? startDate;
  String? title;
  String? info;
  String? status;
  RxList<MediaModel> images = RxList([]);
  bool? isTeacher;
  bool? hasMark;

  ExamModel(
      {this.id,
      this.hasMark,
      this.section,
      required this.images,
      this.department,
      this.isTeacher,
      this.subject,
      this.startDate,
      this.title,
      this.info,
      this.status});

  ExamModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    section = json['section'];
    isTeacher = json['is_teacher'];
    department = json['department'];
    subject = SubjectModel.fromJson(json['subject']);
    startDate = json['start_date'];
    hasMark = json['has_marks'];
    title = json['title'];
    info = json['info'];
    status = json['status'];
    for (var item in json['images']) {
      images.add(MediaModel.fromJson(item));
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['section'] = this.section;
    data['department'] = this.department;
    data['subject'] = this.subject;
    data['start_date'] = this.startDate;
    data['title'] = this.title;
    data['info'] = this.info;
    data['status'] = this.status;
    return data;
  }

  @override
  int getId() {
    return id!;
  }

  @override
  String getName() {
    return title!;
  }
}
