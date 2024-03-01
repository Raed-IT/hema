import 'package:school/app/global/data/models/department_model.dart';
import 'package:school/app/global/data/models/local_models/mark_status_model.dart';
import 'package:school/app/global/data/models/main_model.dart';
import 'package:school/app/global/data/models/section_model.dart';

class StudentModel extends Model {
  int? id;
  String? name;
  String? fullName;
  String? img;
  String? address;
  String? mother;
  String? father;
  String? attendees; //
  SectionModel? section;
  DepartmentModel? department;
  double? ratio;
  double? lat;
  double? long;
  bool? isAbsent;

//// local values
  ///[currentMark]local store current maks in add marks screen
  double? currentMark;

  ///[amount] for store amount payment in admin app
  double? amount;

  ///[markStatus] local store current mark status for add mark screen
  MarkStatusModel? markStatus;

  String? markStatusString;

  StudentModel(
      {this.id,
      this.lat,
      this.isAbsent,
      required this.markStatus,
      this.markStatusString,
      this.currentMark,
      this.long,
      this.attendees,
      this.name,
      this.fullName,
      this.img,
      this.address,
      this.mother,
      this.father,
      this.section,
      this.ratio,
      this.department});

  StudentModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    attendees = json['attendees'];
    lat = json['lat'];
    long = json['long'];
    isAbsent = json['attends'] ?? false;
    name = json['name'];
    img = json['img'];
    fullName = json['full_name'];
    address = json['address'];
    mother = json['mother'];
    father = json['father'];
    ratio = double.tryParse(json['items_avg']);
    section = SectionModel.fromJson(json['section']);
    department = DepartmentModel.fromJson(json['department']);
    markStatus = MarkStatusModel();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    // data['id'] = this.id;
    // data['name'] = this.name;
    // data['img'] = this.img;
    // data['address'] = this.address;
    // data['mother'] = this.mother;
    // data['father'] = this.father;
    // data['section'] = this.section;
    // data['department'] = this.department;
    data['attendees'] = this.attendees;
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
