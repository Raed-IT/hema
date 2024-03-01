class NotificationModel {
  String? title;
  String? body;
  String? url;
  String? route;
  bool? isRead;
  String? createdAt;

  NotificationModel(
      {this.title,
      this.body,
      this.url,
      this.route,
      this.isRead,
      this.createdAt});

  NotificationModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    body = json['body'];
    url = json['url'];
    route = json['route'];
    isRead = json['is_read'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['body'] = this.body;
    data['url'] = this.url;
    data['route'] = this.route;
    data['is_read'] = this.isRead;
    return data;
  }
}
