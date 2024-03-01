import 'package:school/app/global/data/models/department_model.dart';

class SectionModel {
  String? name;
  int? id ;
  List<DepartmentModel> departments = [];

  SectionModel({
    required this.id,
    required this.name,
    required this.departments,
  });

  SectionModel.fromJson(Map<String, dynamic> json) {
    id=json['id'];
    name = json['name'];
    departments.clear();
    for (var item in json['departments']) {
      departments.add(DepartmentModel.fromJson(item));
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['departments'] = departments;
    return data;
  }
}
