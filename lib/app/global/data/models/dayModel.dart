class DayModel {
  String? labelEn;
  String? labelAr;
  String? val;

  DayModel({this.labelEn, this.labelAr, this.val});

  DayModel.fromJson(Map<String, dynamic> json) {
    labelEn = json['label_en'];
    labelAr = json['label_ar'];
    val = json['val'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['label_en'] = this.labelEn;
    data['label_ar'] = this.labelAr;
    data['val'] = this.val;
    return data;
  }
}