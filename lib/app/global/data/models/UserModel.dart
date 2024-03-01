import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:school/app/global/data/controllers/main_controller.dart';
import 'package:school/app/global/data/enums/user_type_enum.dart';

class UserModel {
  int? id;
  int? localeId;
  String? name;
  String? firstName;
  String? lastName;
  String? username;
  String? qr;
  String? email;
  String? school;
  String? img;
  String? logo;
  String? department;
  String? schoolName;
  String? phone;
  String? token;
  UserType? level;

  UserModel({
    required this.phone,
    required this.id,
    this.localeId,
    this.qr,
    required this.email,
    this.username,
    this.firstName,
    this.lastName,
    required this.level,
    required this.token,
    required this.img,
    required this.name,
    required this.school,
    this.logo,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    localeId = json['local_id'];
    phone = json['phone'];
    lastName = json['last_name'];
    firstName = json['first_name'];
    level = json['level'].toString().toUserType();
    school = json['school'] ?? '';
    qr = json['qr'];
    name = json['name'];
    email = json['email'];
    img = json['img'];
    logo = json['logo'] ?? '';
    department = json['material'] ?? '';
    schoolName = json['school_name'] ?? '';
    if (json['token'] != null) {
      token = json['token'];
    } else {
      token = Get.find<MainController>().currentToken.value;
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['level'] = level!.name;
    if (token != null) {
      data['token'] = token;
    }
    data['phone'] = phone;
    data['school'] = school;
    data['img'] = img;
    data['logo'] = logo;
    data['material'] = department;
    data['school_name'] = schoolName;
    data['local_id'] = localeId;

    data['last_name'] = lastName;
    data['username'] = username;
    data['first_name'] = firstName;
    data['phone'] = phone;
    data['qr'] = qr;
    data['img'] = img;
    return data;
  }
}
