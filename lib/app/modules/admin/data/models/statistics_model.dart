class StatisticsModel {
  int? section;
  int? department;
  int? student;
  int? employee;
  int? exams;
  int? futureExams;
  int? totalBalances;
  int? total;

  StatisticsModel(this.section, this.department, this.student, this.employee,
      this.exams, this.futureExams, this.totalBalances, this.total);

  StatisticsModel.fromJson(Map<String, dynamic> json) {
    section=json['section'];
    department=json['department'];
    student=json['student'];
    employee=json['employee'];
    exams=json['exams'];
    futureExams=json['future_exams'];
    totalBalances=json['total_balances'];
    total=json['total'];
  }
}
