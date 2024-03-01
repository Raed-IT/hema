class SocialModel {
  String? facebook;
  String? twitter;
  String? instagram;
  String? youtube;

  SocialModel(this.facebook, this.twitter, this.instagram, this.youtube);

  SocialModel.formJson(Map<String, dynamic> json) {
    facebook = json["facebook"];
    twitter = json["twitter"];
    instagram = json["instagram"];
    youtube = json["youtube"];
  }
}
