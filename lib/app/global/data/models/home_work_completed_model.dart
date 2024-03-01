import 'package:school/app/global/data/models/student_model.dart';

class AnswerHomeWorkModel {
  int? id;
  String? answer;
  StudentModel? student;
  List<String>? images;
  String? studentName;

  AnswerHomeWorkModel(
      {this.id, this.studentName, this.answer, this.student, this.images});

  AnswerHomeWorkModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    studentName = json['student'];
    answer = json['answer'];
    images = [];
    for (String img in json['images']) {
      images!.add(img);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['work'] = this.answer;
    data['student'] = this.student;
    data['img'] = this.images;
    return data;
  }
}
