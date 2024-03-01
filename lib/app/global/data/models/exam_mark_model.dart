class ExamMarkerModel {
  int? id;
  String? quiz;
  String? inDay;
  String? subject;
  String? student;
  double? mark;
  int? maxMark;
  int? minMark;
  String? status;
  bool? isSuccess;

  ExamMarkerModel(
      {this.id,
      this.quiz,
      this.inDay,
      this.subject,
      this.student,
      this.mark,
      this.maxMark,
      this.minMark,
      this.status,
      this.isSuccess});

  ExamMarkerModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    quiz = json['quiz'] ?? 'quiz';
    inDay = json['in_day'] ?? 'in_day';
    subject = json['subject'] ?? "subject";
    student = json['student'] ?? "student";
    mark = double.parse(json['mark']);
    maxMark = json['max_mark'];
    minMark = json['min_mark'];
    status = json['status'];
    isSuccess = json['is_success'] ?? false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['quiz'] = this.quiz;
    data['in_day'] = this.inDay;
    data['subject'] = this.subject;
    data['student'] = this.student;
    data['mark'] = this.mark;
    data['max_mark'] = this.maxMark;
    data['min_mark'] = this.minMark;
    data['status'] = this.status;
    data['is_success'] = this.isSuccess;
    return data;
  }
}
