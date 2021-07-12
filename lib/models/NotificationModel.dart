/*
Developed by: Eng Mouaz M. Al-Shahmeh
*/
class NotificationModel {
  String id_user_notification;
  String id_notification;
  String phone_user;
  String response_phone_user;
  String title;
  String body;
  String state;
  String seen;

  // ignore: sort_constructors_first
  NotificationModel({
    this.id_user_notification,
    this.id_notification,
    this.phone_user,
    this.response_phone_user,
    this.title,
    this.body,
    this.state,
    this.seen,
  });
  // ignore: sort_constructors_first
  NotificationModel.fromJson(Map<String, dynamic> json) {
    id_user_notification = json['id_user_notification'];
    id_notification = json['id_notification'];
    title = json['phone_user'];
    title = json['response_phone_user'];
    title = json['title'];
    body = json['body'];
    state = json['state'];
    state = json['seen'];
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id_user_notification'] = id_user_notification;
    data['id_notification'] = id_notification;
    data['phone_user'] = phone_user;
    data['response_phone_user'] = response_phone_user;
    data['title'] = title;
    data['body'] = body;
    data['state'] = state;
    data['seen'] = seen;
    return data;
  }
}