class AbsenceModel {
  int? id ;
   String? date;

  AbsenceModel({  this.date, this.id});

  AbsenceModel.fromJson(Map<String, dynamic> json) {
     date = json['date'];
    id=json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
     data['date'] = this.date;
    return data;
  }
}