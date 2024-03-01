import 'package:school/app/global/data/models/department_model.dart';
import 'package:school/app/global/data/models/main_model.dart';
import 'package:school/app/global/data/models/section_model.dart';

class ReportModel extends Model {
  int? id;
  String? name;
  DepartmentModel? department;
  SectionModel? section;
  bool? isTeacher;

  // TeacherModel? teacher;
  String? info;
  String? date;

  ReportModel({
    this.id,
    this.name,
    this.isTeacher,
    this.department,
    this.section,
    // this.teacher,
    this.info,
    this.date,
  });

  ReportModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    isTeacher = json['is_teacher'] ?? false;
    department = DepartmentModel.fromJson(json['department']);
    section = SectionModel.fromJson(json['section']);
    // teacher = TeacherModel.fromJson(json['teacher']);
    info = json['info'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['info'] = this.info;
    return data;
  }

  @override
  int getId() {
    return id!;
  }

  @override
  String getName() {
    return name!;
  }
}
