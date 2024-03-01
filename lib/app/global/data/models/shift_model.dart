import 'package:school/app/global/data/models/department_model.dart';
import 'package:school/app/global/data/models/section_model.dart';
import 'package:school/app/global/data/models/subject_model.dart';
import 'package:school/app/global/data/models/teacher_model.dart';

class ShiftModel {
  SubjectModel? subject;
  DepartmentModel? department;
  TeacherModel? teacher;
  SectionModel? section;
  String? start;
  String? end;
  String? day;

  ShiftModel(
      {this.subject,
      this.department,
      this.teacher,
      this.section,
      this.start,
      this.end,
      this.day});

  ShiftModel.fromJson(Map<String, dynamic> json) {
    subject = SubjectModel.fromJson(json['subject']);
    department = DepartmentModel.fromJson(json['department']);
    teacher = TeacherModel.fromJson(json['teacher']);
    section = SectionModel.fromJson(json['section']);
    start = json['start'];
    end = json['end'];
    day = json['day'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['subject'] = this.subject;
    data['department'] = this.department;
    data['teacher'] = this.teacher;
    data['section'] = this.section;
    data['start'] = this.start;
    data['end'] = this.end;
    data['day'] = this.day;
    return data;
  }
}
