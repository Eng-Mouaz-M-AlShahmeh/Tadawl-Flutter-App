/*
Developed by: Eng Mouaz M. Al-Shahmeh
*/
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:tadawl_app/models/requestModel.dart';
import 'package:tadawl_app/provider/api/apiRequestsFunctions.dart';

class RequestProvider extends ChangeNotifier {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final List<RequestModel> _requests = [];
  List __requestsData = [];

  void getUserRequestsList(BuildContext context, String Phone) {
    Future.delayed(Duration(milliseconds: 0), () {
      if (_requests.isEmpty) {
        ApiRequests(_scaffoldKey)
            .getUserRequestsListFunc(context, Phone)
            .then((value) {
          __requestsData = value;
          __requestsData.forEach((element) {
            _requests.add(RequestModel(
              id_order: element['id_order'],
              phone_user: element['phone_user'],
              category: element['category'],
              min_price: element['min_price'],
              max_price: element['max_price'],
              min_space: element['min_space'],
              max_space: element['max_space'],
              type_aqar: element['type_aqar'],
              interface: element['interface'],
              plan: element['plan'],
              age_of_real_estate: element['age_of_real_estate'],
              apartements: element['apartements'],
              floor: element['floor'],
              lounges: element['lounges'],
              rooms: element['rooms'],
              stores: element['stores'],
              street_width: element['street_width'],
              toilets: element['toilets'],
              trees: element['trees'],
              wells: element['wells'],
              furnished: element['furnished'],
              kitchen: element['kitchen'],
              family: element['family'],
              elevater: element['elevater'],
              car_entrance: element['car_entrance'],
              appendix: element['appendix'],
              celler: element['celler'],
              driver_room: element['driver_room'],
              maid_room: element['maid_room'],
              swimming_pool: element['swimming_pool'],
              football_court: element['football_court'],
              volleyball_court: element['volleyball_court'],
              amusement_park: element['amusement_park'],
              verse: element['verse'],
              duplex: element['duplex'],
              hall_staircase: element['hall_staircase'],
              conditioner: element['conditioner'],
            ));
          });
        });
      } else {
        ApiRequests(_scaffoldKey)
            .getUserRequestsListFunc(context, Phone)
            .then((value) {
          __requestsData = value;
          _requests.clear();
          __requestsData.forEach((element) {
            _requests.add(RequestModel(
              id_order: element['id_order'],
              phone_user: element['phone_user'],
              category: element['category'],
              min_price: element['min_price'],
              max_price: element['max_price'],
              min_space: element['min_space'],
              max_space: element['max_space'],
              type_aqar: element['type_aqar'],
              interface: element['interface'],
              plan: element['plan'],
              age_of_real_estate: element['age_of_real_estate'],
              apartements: element['apartements'],
              floor: element['floor'],
              lounges: element['lounges'],
              rooms: element['rooms'],
              stores: element['stores'],
              street_width: element['street_width'],
              toilets: element['toilets'],
              trees: element['trees'],
              wells: element['wells'],
              furnished: element['furnished'],
              kitchen: element['kitchen'],
              family: element['family'],
              elevater: element['elevater'],
              car_entrance: element['car_entrance'],
              appendix: element['appendix'],
              celler: element['celler'],
              driver_room: element['driver_room'],
              maid_room: element['maid_room'],
              swimming_pool: element['swimming_pool'],
              football_court: element['football_court'],
              volleyball_court: element['volleyball_court'],
              amusement_park: element['amusement_park'],
              verse: element['verse'],
              duplex: element['duplex'],
              hall_staircase: element['hall_staircase'],
              conditioner: element['conditioner'],
            ));
          });
        });
      }
    });
  }

  int countRequests() {
    if (_requests.isNotEmpty) {
      return _requests.length;
    } else {
      return 0;
    }
  }

  List<RequestModel> get requests => _requests;
}
