/*
Developed by: Eng Mouaz M. Al-Shahmeh
*/
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:tadawl_app/models/NotificationModel.dart';
import 'package:tadawl_app/provider/api/apiRequestsFunctions.dart';

class NotificationProvider extends ChangeNotifier {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final List<NotificationModel> _notifications = [];
  List _notificationsData = [];
  FlutterLocalNotificationsPlugin _localNotification;

  void getNotificationsList(BuildContext context, String phone) {
    Future.delayed(Duration(milliseconds: 0), () {
      if(phone != null) {
        if (_notifications.isEmpty) {
          ApiRequests(_scaffoldKey).getNotificationsFunc(context, phone).then((
              value) {
            _notificationsData = value;
            _notificationsData.forEach((element) {
              _notifications.add(NotificationModel(
                id_user_notification: element['id_user_notification'],
                id_notification: element['id_notification'],
                phone_user: element['phone_user'],
                response_phone_user: element['response_phone_user'],
                title: element['title'],
                body: element['body'],
                state: element['state'],
                seen: element['seen'],
              ));
            });
          });
        } else {
          ApiRequests(_scaffoldKey).getNotificationsFunc(context, phone).then((
              value) {
            _notificationsData = value;
            _notifications.clear();
            _notificationsData.forEach((element) {
              _notifications.add(NotificationModel(
                id_user_notification: element['id_user_notification'],
                id_notification: element['id_notification'],
                phone_user: element['phone_user'],
                response_phone_user: element['response_phone_user'],
                title: element['title'],
                body: element['body'],
                state: element['state'],
                seen: element['seen'],
              ));
            });
          });
        }
      }
    });
  }

  void changeNotificationState(BuildContext context, String phone, String idNotification) {
    Future.delayed(Duration(milliseconds: 0), () {
        ApiRequests(_scaffoldKey).changeNotificationStateFunc(context, phone, idNotification);
    });
  }

  int countNotifications() {
    if (_notifications.isNotEmpty) {
      return _notifications.length;
    } else {
      return 0;
    }
  }

  Future showNotification(BuildContext context, String phone) async {
    if (_notifications.isNotEmpty) {
      for (var i = 0; i < countNotifications(); i++) {
        if (_notifications[i].state == '1') {
          if (_notifications[i].seen == '0') {
            changeNotificationState(context, phone, _notifications[i].id_notification);
            var androidDetails = AndroidNotificationDetails(
                'ChannelId',
                'Local Notification',
                'This is the description of the Notification, you can write anything',
                importance: Importance.high);
            var iosDetails = IOSNotificationDetails();
            var generalNotificationDetails =
            NotificationDetails(android: androidDetails, iOS: iosDetails);
            await _localNotification.show(
                int.parse(_notifications[i].id_notification),
                '${_notifications[i].title}',
                '${_notifications[i].body}',
                generalNotificationDetails);
          } else {}
        }
      }
    }

    var androidInitialize = AndroidInitializationSettings('ic_launcher');
    var iosInitialize = IOSInitializationSettings();
    var initializationSettings =
    InitializationSettings(android: androidInitialize, iOS: iosInitialize);
    _localNotification = FlutterLocalNotificationsPlugin();
    await _localNotification.initialize(initializationSettings);
  }


  List<NotificationModel> get notifications => _notifications;
}
