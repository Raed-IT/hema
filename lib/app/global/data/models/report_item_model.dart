import 'package:school/app/global/data/enums/report_status_enum.dart';
import 'package:school/app/global/data/models/subject_model.dart';

class ReportItemModel {
  int? id;
  int? reportId;

  String? info;
  String? date;
  ReportItemStatus? status;
  SubjectModel? subject;
  String? ratio;
  bool? isTeacher;
  int? studentId;

  ReportItemModel(this.info,this.reportId, this.id, this.studentId, this.isTeacher, this.date,
      this.status, this.subject, this.ratio);

  ReportItemModel.fromJson(Map<String, dynamic> json) {
    info = json['info'] ?? '';
    id = json['id'];
    studentId=json['student_id'];
    reportId=json['report_id'];
    isTeacher = json['is_teacher'];
    date = json['date'];
    status = json['status'].toString().toReportItemStatus();
    subject = SubjectModel.fromJson(json['subject']);
    ratio = json['ratio'].toString();
  }
}
