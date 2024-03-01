class AttendsModel {
  int? id;

  String? type;
  int? studentId;
  String? atDate;

  AttendsModel(this.id, this.type, this.studentId, this.atDate);

  AttendsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    studentId = json['student_id'];
    atDate = json['at_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['student_id'] = studentId;
    data['atDate'] = atDate;

    return data ;
  }
}
