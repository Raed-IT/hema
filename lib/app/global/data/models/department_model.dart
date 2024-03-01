class DepartmentModel {
  int? id;
  String? name;
  int? count;
  String? section;

  DepartmentModel({
    required this.count,
    required this.id,
    required this.name,
    required this.section,
  });

  DepartmentModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    count = json['count'];
    name = json['name'];
    section = json['section'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['count'] = count;
    data['section'] = section;
    data['name'] = name;

    return data;
  }
}
