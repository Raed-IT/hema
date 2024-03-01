import 'package:school/app/global/data/models/social_model.dart';

class SettingModel {
  String? name;
  String? info;
  String? about;
  SocialModel? social;
  String? email;
  String? whats;
  String? phone;
  String? startYer;
  String? endYer;
  String? logo;
  bool? allowAttendTeacher;
  List<String>? sliderImages;

  SettingModel(
      {this.name,
      this.info,
      this.sliderImages,
      this.about,
      this.social,
      this.logo,
      this.email,
      this.whats,
      this.phone,
      this.startYer,
      this.endYer,
      this.allowAttendTeacher});

  SettingModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    logo = json['logo'];
    info = json['info'];
    about = json['about'];
    social = SocialModel.formJson(json['social']);
    email = json['email'];
    whats = json['whats'];
    phone = json['phone'];
    startYer = json['start_yer'];
    endYer = json['end_yer'];
    allowAttendTeacher = json['allow_attend_teacher'];
    sliderImages = [];
    for (var image in json['slider']) {
      sliderImages!.add(image);
    }
  }
}
