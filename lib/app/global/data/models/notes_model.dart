class NotesModel {
  int? id;

  // bool? isTeacher;
  String? note;
  String? createdAt;
  String? status;
  String? sender;
  bool? isTeacher;
  String? subjectName;

  NotesModel(
      {this.id,
      this.isTeacher,
      this.note,
      this.createdAt,
      this.status,
      this.subjectName,
      this.sender});

  NotesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    isTeacher = json['is_teacher'] ?? true;
    subjectName = json['subject'];
    note = json['note'];
    createdAt = json['created_at'];
    status = json['status'];
    sender = json['teacher'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    // data['is_teacher'] = isTeacher;
    data['note'] = note;
    data['created_at'] = createdAt;
    data['status'] = status;
    data['teacher'] = sender;
    return data;
  }
}
