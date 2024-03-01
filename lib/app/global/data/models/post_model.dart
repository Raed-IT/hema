import 'package:helper_plugin/utilitis/media_model.dart';
import 'package:logger/logger.dart';
import 'package:school/app/global/data/models/UserModel.dart';

class PostModel {
  int? id;
  String? title;
  String? body;
  String? img;
  UserModel? user;
  List<MediaModel> images = [];
  String? createdAt;

  PostModel(
      {this.id,
      this.title,
      this.images = const [],
      this.body,
      this.img,
      this.user,
      this.createdAt});

  PostModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    body = json['body'];
    img = json['img'] ?? '';
    createdAt = json['created_at'];

    for (var image in json["images"]) {
      images.add(MediaModel.fromJson(image));
    }
    if (images.isEmpty && img != null) {
      images.add(MediaModel(img, null));
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['body'] = this.body;
    data['img'] = this.img;
    data['created_at'] = this.createdAt;
    return data;
  }
}
