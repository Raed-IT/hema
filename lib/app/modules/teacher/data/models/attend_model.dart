class AttendStateModel {
  int studentId;
  bool isAbsent; // غياب
  bool isPresence; // حضور
  bool isJustification; // غياب ممبرر
  String? type ;

  AttendStateModel(
      {
        this.type,
        required this.studentId,
      this.isAbsent = false,
      this.isPresence = true,
      this.isJustification = false});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['isAbsent'] = isAbsent;
    data['isPresence'] = isPresence;
    data['isJustification'] = isJustification;
    return data;
  }
}
