class StatusNoteModel {
  String? labelEn;
  String? labelAr;
  String? value;

  StatusNoteModel({this.labelEn, this.labelAr, this.value});

  StatusNoteModel.fromJson(Map<String, dynamic> json) {
    labelEn = json['label_en'];
    labelAr = json['label_ar'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['label_en'] = this.labelEn;
    data['label_ar'] = this.labelAr;
    data['value'] = this.value;
    return data;
  }
}