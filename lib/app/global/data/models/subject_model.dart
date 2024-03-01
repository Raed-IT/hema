import 'package:school/app/global/data/models/main_model.dart';

class SubjectModel extends Model {
  int? id;
  String? name;
  String? img;
  double? maxMark;
  double? minMark;

  SubjectModel({this.id, this.name, this.img, this.maxMark, this.minMark});

  SubjectModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    img = json['img'];
    maxMark = double.tryParse(json['max_mark'].toString());
    minMark = double.tryParse(json['min_mark'].toString());
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['img'] = this.img;
    data['max_mark'] = this.maxMark;
    data['min_mark'] = this.minMark;
    return data;
  }

  @override
  int getId() {
    return id!;
  }

  @override
  String getName() {
  return name!;
  }
}
