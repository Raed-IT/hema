class TeacherModel {
  int? id;
  String? name;
  String? email;
   String? img;
  String? phone;
  String? bio;

  TeacherModel({
    this.id,
    this.email,
    this.img,
    this.name,
     this.phone,
    this.bio,
  });

  TeacherModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
     name = json['name'];
    phone = json['phone'];
    email = json['email'];
    img = json['img']??'';
    bio = json['bio'];
  }
}
