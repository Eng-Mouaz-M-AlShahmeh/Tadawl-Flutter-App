
/*
Developed by: Eng Mouaz M. Al-Shahmeh
*/
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiRequests {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  // ignore: sort_constructors_first
  ApiRequests(this.scaffoldKey);
  String BaseURL = 'https://www.tadawl.com.sa/API/api_app';

  Future<dynamic> getUserRequestsListFunc(
      BuildContext context, String Phone) async {
    var url = '$BaseURL/orders/get_user_requests.php';
    var response = await http.post(url, body: {
      'phone': Phone,
    });
    var jsonx = json.decode(response.body);
    return jsonx;
  }

  Future<dynamic> getNotificationsFunc(BuildContext context, String phone) async {
    var url = '$BaseURL/notifications/get_notifications.php';
    var response = await http.post(url, body: {
      'phone_user': phone,
    });
    var jsonx = json.decode(response.body);
    return jsonx;
  }

  Future<dynamic> changeNotificationStateFunc(BuildContext context, String phone, String idNotification) async {
    var url = '$BaseURL/notifications/notification_seen.php';
    var response = await http.post(url, body: {
      'phone_user': phone,
      'id_notification': idNotification,
    });
    var jsonx = json.decode(response.body);
    return jsonx;
  }
}
