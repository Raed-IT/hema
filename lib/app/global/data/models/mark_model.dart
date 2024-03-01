import 'package:school/app/global/data/models/main_model.dart';

class MarkModel {
  int? id;
  int? studentId;
  double? mark;
  String? status;
  String? student;
  String? inDate;

  MarkModel(this.id, this.inDate, this.student, this.studentId, this.mark,
      this.status);

  MarkModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    student = json['student'];
    inDate = json['created_at'];
    studentId = json['student_id'];
    mark = double.parse(json['mark']);
    status = json['status'];
  }
}
