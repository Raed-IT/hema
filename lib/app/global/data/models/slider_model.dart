class SliderModel {
  String? whats;
  String? telegram;
  String? face;

  String? img;

  String? url;

  SliderModel({this.telegram,this.whats,this.face, this.img, this.url});

  SliderModel.fromJson(Map<String, dynamic> json) {
    whats = json['whats'];
    telegram = json['telegram'];
    face = json['face'];

    url = json['url'];
    img = json['img'];
  }


}
