class notificationModel {
  late String title, subtitle, image, body;

  notificationModel(
      {required this.subtitle,
      required this.title,
      required this.body,
      required this.image});
  notificationModel.fromjson(Map<dynamic, dynamic> map) {
    title = map['title'];
    subtitle = map['subtitle'];
    image = map['image'];
    body = map['body'];
  }

  tojson() {
    return {
      'title': title,
      'subtitle': title,
      'image': image,
      'body': body,
    };
  }
}
