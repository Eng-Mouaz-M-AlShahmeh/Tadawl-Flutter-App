/*
Developed by: Eng Mouaz M. Al-Shahmeh
*/
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class Api {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  // ignore: sort_constructors_first
  Api(this.scaffoldKey);
  String BaseURL = 'https://www.tadawl.com.sa/API';
  Future<dynamic> getadsFunc(BuildContext context) async {
    final response = await http.post(
      '$BaseURL/api_app/ads/all_ads.php',
    );
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      return false;
    }
  }

  Future<dynamic> getFilterTwoWeeksAgoFunc(BuildContext context) async {
    final response = await http.post(
      '$BaseURL/api_app/ads/two_weeks_ago_ads.php',
    );
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      return false;
    }
  }

  Future<dynamic> searchKeyFunc(BuildContext context, String key) async {
    var url = '$BaseURL/api_app/ads/search_key.php';
    var response = await http.post(url, body: {
      'key': key,
    });
    if (response.body == 'false') {
      return 'false';
    } else {
      var jsonx = json.decode(response.body);
      return jsonx;
    }
  }

  Future<dynamic> getComments(
      BuildContext context, String phone, String other_phone) async {
    var url = '$BaseURL/api_app/conversations/user_messages.php';
    var response = await http.post(url, body: {
      'phone': phone,
      'other_phone': other_phone,
    });
    var jsonx = json.decode(response.body);
    return jsonx;
  }

  Future<dynamic> getEstimates(
    BuildContext context,
    String user_phone,
  ) async {
    var url = '$BaseURL/api_app/userEstimate/select_estimates.php';
    var response = await http.post(url, body: {
      'phone': user_phone,
    });
    var jsonx = json.decode(response.body);
    return jsonx;
  }

  Future<dynamic> getSumEstimates(
    BuildContext context,
    String user_phone,
  ) async {
    var url = '$BaseURL/api_app/userEstimate/sum_rates.php';
    var response = await http.post(url, body: {
      'phone': user_phone,
    });
    var jsonx = json.decode(response.body);
    return jsonx;
  }

  Future<dynamic> getCountEstimates(
    BuildContext context,
    String user_phone,
  ) async {
    var url = '$BaseURL/api_app/userEstimate/count_estimates.php';
    var response = await http.post(url, body: {
      'phone': user_phone,
    });
    var jsonx = json.decode(response.body);
    return jsonx;
  }

  Future<dynamic> sendEstimateFunc(
    BuildContext context,
    String phone,
    String user_phone,
    String rating,
    String comment,
  ) async {
    var url = '$BaseURL/api_app/userEstimate/user_estimate.php';
    var response = await http.post(url, body: {
      'phone_user': phone,
      'phone_user_estimated': user_phone,
      'rate': rating,
      'comment': comment,
    });
    var jsonx = json.decode(response.body);
    if (response.statusCode == 200) {
      await Fluttertoast.showToast(
          msg: 'شكراًَ على تقييمك',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 15.0);
      return jsonx;
    } else {
      await Fluttertoast.showToast(
          msg: 'هناك خطاء راجع الأدارة',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 15.0);
      return;
    }
  }

  Future<dynamic> filterPriceAdsFunc(BuildContext context) async {
    final response = await http.post(
      '$BaseURL/api_app/ads/filter_price.php',
    );
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      return false;
    }
  }

  Future<dynamic> filterSpaceAdsFunc(BuildContext context) async {
    final response = await http.post(
      '$BaseURL/api_app/ads/filter_space.php',
    );
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      return false;
    }
  }

  Future<dynamic> filterUpToDateAdsFunc(BuildContext context) async {
    final response = await http.post(
      '$BaseURL/api_app/ads/filter_uptodate.php',
    );
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      return false;
    }
  }

  Future<dynamic> getNavigationFunc(BuildContext context) async {
    final response = await http.post(
      '$BaseURL/api_app/ads/navigation.php',
    );
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      return false;
    }
  }

  Future<dynamic> getCategoryFunc(BuildContext context) async {
    final response = await http.post(
      '$BaseURL/api_app/categoryAqar/getdata.php',
    );
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      return false;
    }
  }

  Future<dynamic> getFilterAdsFunc(
      BuildContext context, String id_category) async {
    var url = '$BaseURL/api_app/ads/filter_category.php';
    var response = await http.post(url, body: {
      'id_category': id_category,
    });
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      return false;
    }
  }

  Future<dynamic> getViewsChartFunc(
      BuildContext context, String id_description) async {
    var url = '$BaseURL/api_app/ads/views_chart.php';
    var response = await http.post(url, body: {
      'id_description': id_description,
    });
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      return false;
    }
  }

  Future<dynamic> getSimilarAdsFunc(
      BuildContext context, String id_category, String id_ads) async {
    var url = '$BaseURL/api_app/ads/similar_ads.php';
    var response = await http.post(url, body: {
      'id_category': id_category,
      'id_ads': id_ads,
    });
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      return false;
    }
  }

  Future<dynamic> updateViewsFunc(
      BuildContext context, String id_ads, String views) async {
    var url = '$BaseURL/api_app/ads/update_ads_views.php';
    var response = await http.post(url, body: {
      'id_ads': id_ads,
      'views': views,
    });
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      return false;
    }
  }

  Future<dynamic> changeAdsFavStateFunc(
      BuildContext context, String id_ads, String phone_user) async {
    var url = '$BaseURL/api_app/ads/fav_ads.php';
    var response = await http.post(url, body: {
      'id_ads': id_ads,
      'phone_user': phone_user,
    });
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      return false;
    }
  }

  Future<dynamic> getUserAdsFunc(BuildContext context, String Phone) async {
    var url = '$BaseURL/api_app/ads/user_ads.php';
    var response = await http.post(url, body: {
      'phone': Phone,
    });
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      return false;
    }
  }

  Future<dynamic> getFavAdsFunc(BuildContext context, String Phone) async {
    var url = '$BaseURL/api_app/ads/fav_list_ads.php';
    var response = await http.post(url, body: {
      'phone': Phone,
    });
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      return false;
    }
  }

  Future<dynamic> getAdsPageFunc(
      BuildContext context, String id_description) async {
    var url = '$BaseURL/api_app/ads/ads_page.php';
    var response = await http.post(url, body: {
      'id_description': id_description,
    });
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      return false;
    }
  }

  Future<dynamic> getAqarVRFunc(
      BuildContext context, String id_description) async {
    var url = '$BaseURL/api_app/ads/data_aqar_vr.php';
    var response = await http.post(url, body: {
      'id_description': id_description,
    });
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      return false;
    }
  }

  Future<dynamic> getImagesAdsPageFunc(
      BuildContext context, String id_description) async {
    var url = '$BaseURL/api_app/ads/images_ads.php';
    var response = await http.post(url, body: {
      'id_description': id_description,
    });
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      return false;
    }
  }

  Future<dynamic> getBFAdsPageFunc(
      BuildContext context, String id_description) async {
    var url = '$BaseURL/api_app/ads/ads_BF.php';
    var response = await http.post(url, body: {
      'id_description': id_description,
    });
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      return false;
    }
  }

  Future<dynamic> getQFAdsPageFunc(
      BuildContext context, String id_description) async {
    var url = '$BaseURL/api_app/ads/ads_QF.php';
    var response = await http.post(url, body: {
      'id_description': id_description,
    });
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      return false;
    }
  }

  Future<dynamic> getDiscListFunc(BuildContext context, String Phone) async {
    var url = '$BaseURL/api_app/conversations/conversations_list.php';
    var response = await http.post(url, body: {
      'phone': Phone,
    });
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      return false;
    }
  }

  Future<dynamic> getsOfficeFunc(BuildContext context) async {
    final response = await http.post(
      '$BaseURL/api_app/officesAqar/getdata.php',
    );
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      return false;
    }
  }

  Future getUserInfoFunc(BuildContext context, String Phone) async {
    var url = '$BaseURL/api_app/login/account_info.php';
    var response = await http.post(url, body: {
      'phone': Phone,
    });
    return jsonDecode(response.body);
  }

  Future getUserAccountInfoFunc(BuildContext context, String Phone) async {
    var url = '$BaseURL/api_app/ads/user_info.php';
    var response = await http.post(url, body: {
      'phone': Phone,
    });
    return jsonDecode(response.body);
  }

  Future getOfficeCheckFunc(BuildContext context, String Phone) async {
    var url = '$BaseURL/api_app/officesAqar/check.php';
    var response = await http.post(url, body: {
      'phone': Phone,
    });
    return jsonDecode(response.body);
  }

  Future getAdsInfoFunc(BuildContext context, String Phone) async {
    var url = '$BaseURL/api_app/ads/user_info.php';
    var response = await http.post(url, body: {
      'phone': Phone,
    });
    return jsonDecode(response.body);
  }

  Future<dynamic> deleteAdsFunc(
      BuildContext context, String id_description) async {
    var url = '$BaseURL/api_app/ads/delete_ads.php';
    var response = await http.post(url, body: {
      'id_description': id_description,
    });
    if (response.statusCode == 200) {
      await Fluttertoast.showToast(
          msg: 'تم حذف الإعلان بنجاح',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 15.0);
    } else {
      await Fluttertoast.showToast(
          msg: 'هناك خطاء راجع الأدارة',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 15.0);
    }
  }

  Future<dynamic> updateLocationFunc(
    BuildContext context,
    String id_description,
    String ads_city,
    String ads_neighborhood,
    String ads_road,
    String lat,
    String lng,
  ) async {
    var url = '$BaseURL/api_app/ads/update_location.php';
    var response = await http.post(url, body: {
      'id_description': id_description,
      'ads_city': ads_city,
      'ads_neighborhood': ads_neighborhood,
      'ads_road': ads_road,
      'lat': lat,
      'lng': lng,
    });
    if (response.statusCode == 200) {
      //return json.decode(response.body);
      await Fluttertoast.showToast(
          msg: 'تم تعديل موقع الإعلان بنجاح',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 15.0);
    } else {
      await Fluttertoast.showToast(
          msg: 'هناك خطاء راجع الأدارة',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 15.0);
    }
  }

  Future<dynamic> updateImgVedFunc(
    BuildContext context,
    String id_description,
    List<File> imagesList,
    File _video,
  ) async {
    final uri = Uri.parse('$BaseURL/api_app/ads/update_img_ved.php');
    var request = http.MultipartRequest('POST', uri);
    request.fields['id_description'] = id_description;
    for (var i = 0; i < imagesList.length; i++) {
      await http.MultipartFile.fromPath('image[]', imagesList[i].path)
          .then((value) {
        request.files.add(value);
      });
    }
    if (_video != null) {
      var ved = await http.MultipartFile.fromPath('video', _video.path);
      request.files.add(ved);
    }
    var response = await request.send();
    if (response.statusCode == 200) {
      await Fluttertoast.showToast(
          msg: 'تم تعديل صور وفيديو الإعلان بنجاح',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 15.0);
    } else {
      await Fluttertoast.showToast(
          msg: 'هناك خطاء راجع الأدارة',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 15.0);
    }
  }

  Future<dynamic> updateDetailsFunc(
    BuildContext context,
    String id_description,
    String detailsAqar,
    String isFootballCourt,
    String isVolleyballCourt,
    String isAmusementPark,
    String isFamilyPartition,
    String isVerse,
    String isCellar,
    String isMonsters,
    String isMaidRoom,
    String isSwimmingPool,
    String isDriverRoom,
    String isDuplex,
    String isHallStaircase,
    String isConditioner,
    String isElevator,
    String isCarEntrance,
    String isAppendix,
    String isKitchen,
    String isFurnished,
    String StreetWidth,
    String Floor,
    String Trees,
    String Wells,
    String Stores,
    String Apartments,
    String AgeOfRealEstate,
    String Rooms,
    String Toilets,
    String Lounges,
    String selectedTypeAqar,
    String selectedFamily,
    String interfaceSelected,
    String totalSpace,
    String totalPrice,
    String selectedPlan,
    String id_category_final,
    String selectedAdderRelation,
    String selectedMarketerRelation,
  ) async {
    final uri = Uri.parse('$BaseURL/api_app/ads/update_datails.php');
    var request = http.MultipartRequest('POST', uri);
    request.fields['id_description'] = id_description;
    request.fields['detailsAqar'] = detailsAqar.toString();
    request.fields['isFootballCourt'] = isFootballCourt.toString();
    request.fields['isVolleyballCourt'] = isVolleyballCourt.toString();
    request.fields['isAmusementPark'] = isAmusementPark.toString();
    request.fields['isFamilyPartition'] = isFamilyPartition.toString();
    request.fields['isVerse'] = isVerse.toString();
    request.fields['isCellar'] = isCellar.toString();
    request.fields['isMonsters'] = isMonsters.toString();
    request.fields['isMaidRoom'] = isMaidRoom.toString();
    request.fields['isSwimmingPool'] = isSwimmingPool.toString();
    request.fields['isDriverRoom'] = isDriverRoom.toString();
    request.fields['isDuplex'] = isDuplex.toString();
    request.fields['isHallStaircase'] = isHallStaircase.toString();
    request.fields['isConditioner'] = isConditioner.toString();
    request.fields['isElevator'] = isElevator.toString();
    request.fields['isCarEntrance'] = isCarEntrance.toString();
    request.fields['isAppendix'] = isAppendix.toString();
    request.fields['isKitchen'] = isKitchen.toString();
    request.fields['isFurnished'] = isFurnished.toString();
    request.fields['StreetWidth'] = StreetWidth.toString();
    request.fields['Floor'] = Floor.toString();
    request.fields['Trees'] = Trees.toString();
    request.fields['Wells'] = Wells.toString();
    request.fields['Stores'] = Stores.toString();
    request.fields['Apartments'] = Apartments.toString();
    request.fields['AgeOfRealEstate'] = AgeOfRealEstate.toString();
    request.fields['Rooms'] = Rooms.toString();
    request.fields['Toilets'] = Toilets.toString();
    request.fields['Lounges'] = Lounges.toString();
    request.fields['selectedTypeAqar'] = selectedTypeAqar.toString();
    request.fields['selectedFamily'] = selectedFamily.toString();
    request.fields['interfaceSelected'] = interfaceSelected.toString();
    request.fields['totalSpace'] = totalSpace.toString();
    request.fields['totalPrice'] = totalPrice.toString();
    request.fields['selectedPlan'] = selectedPlan.toString();
    request.fields['id_category'] = id_category_final.toString();
    request.fields['selectedAdderRelation'] = selectedAdderRelation.toString();
    request.fields['selectedMarketerRelation'] =
        selectedMarketerRelation.toString();
    var response = await request.send();
    if (response.statusCode == 200) {
      await Fluttertoast.showToast(
          msg: 'تم تعديل تفاصيل الإعلان بنجاح',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 15.0);
    } else {
      await Fluttertoast.showToast(
          msg: 'هناك خطاء راجع الأدارة',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 15.0);
    }
  }

  Future<dynamic> getAdvancedSearchFunc(
      BuildContext context,
      String category,
      String min_price,
      String max_price,
      String min_space,
      String max_space,
      String type_aqar,
      String interface,
      String plan,
      String age_of_real_estate,
      String apartements,
      String floor,
      String lounges,
      String rooms,
      String stores,
      String street_width,
      String toilets,
      String trees,
      String wells,
      String bool_feature1,
      String bool_feature2,
      String bool_feature3,
      String bool_feature4,
      String bool_feature5,
      String bool_feature6,
      String bool_feature7,
      String bool_feature8,
      String bool_feature9,
      String bool_feature10,
      String bool_feature11,
      String bool_feature12,
      String bool_feature13,
      String bool_feature14,
      String bool_feature15,
      String bool_feature16,
      String bool_feature17,
      String bool_feature18) async {
    final uri = Uri.parse('$BaseURL/api_app/search/advanced_search.php');

    var response = await http.post(uri, body: {
      'category': category,
      'min_price': min_price,
      'max_price': max_price,
      'min_space': min_space,
      'max_space': max_space,
      'type_aqar': type_aqar,
      'interface': interface,
      'plan': plan,
      'age_of_real_estate': age_of_real_estate,
      'apartements': apartements,
      'floor': floor,
      'lounges': lounges,
      'rooms': rooms,
      'stores': stores,
      'street_width': street_width,
      'toilets': toilets,
      'trees': trees,
      'wells': wells,
      'bool_feature1': bool_feature1,
      'bool_feature2': bool_feature2,
      'bool_feature3': bool_feature3,
      'bool_feature4': bool_feature4,
      'bool_feature5': bool_feature5,
      'bool_feature6': bool_feature6,
      'bool_feature7': bool_feature7,
      'bool_feature8': bool_feature8,
      'bool_feature9': bool_feature9,
      'bool_feature10': bool_feature10,
      'bool_feature11': bool_feature11,
      'bool_feature12': bool_feature12,
      'bool_feature13': bool_feature13,
      'bool_feature14': bool_feature14,
      'bool_feature15': bool_feature15,
      'bool_feature16': bool_feature16,
      'bool_feature17': bool_feature17,
      'bool_feature18': bool_feature18
    });
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      return;
    }
  }

  Future<dynamic> updateAdsFunc(BuildContext context, String id_ads) async {
    var url = '$BaseURL/api_app/ads/update_ad.php';
    var response = await http.post(url, body: {
      'id_ads': id_ads,
    });
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      return false;
    }
  }

  Future<dynamic> addNewAdsFunc(
    BuildContext context,
    String detailsAqar,
    String isFootballCourt,
    String isVolleyballCourt,
    String isAmusementPark,
    String isFamilyPartition,
    String isVerse,
    String isCellar,
    String isMonsters,
    String isMaidRoom,
    String isSwimmingPool,
    String isDriverRoom,
    String isDuplex,
    String isHallStaircase,
    String isConditioner,
    String isElevator,
    String isCarEntrance,
    String isAppendix,
    String isKitchen,
    String isFurnished,
    String StreetWidth,
    String Floor,
    String Trees,
    String Wells,
    String Stores,
    String Apartments,
    String AgeOfRealEstate,
    String Rooms,
    String Toilets,
    String Lounges,
    String selectedTypeAqar,
    String selectedFamily,
    String interfaceSelected,
    String totalSpace,
    String totalPrice,
    String selectedPlan,
    String id_category,
    String ads_cordinates_lat,
    String ads_cordinates_lng,
    String selectedAdderRelation,
    String selectedMarketerRelation,
    String phone,
    String ads_city,
    String ads_neighborhood,
    String ads_road,
    File video,
    List<File> imagesList,
  ) async {
    var uri = Uri.parse('$BaseURL/api_app/ads/add_new_ads.php');
    var request = http.MultipartRequest('POST', uri);
    request.fields['detailsAqar'] = detailsAqar.toString();
    request.fields['isFootballCourt'] = isFootballCourt.toString();
    request.fields['isVolleyballCourt'] = isVolleyballCourt.toString();
    request.fields['isAmusementPark'] = isAmusementPark.toString();
    request.fields['isFamilyPartition'] = isFamilyPartition.toString();
    request.fields['isVerse'] = isVerse.toString();
    request.fields['isCellar'] = isCellar.toString();
    request.fields['isMonsters'] = isMonsters.toString();
    request.fields['isMaidRoom'] = isMaidRoom.toString();
    request.fields['isSwimmingPool'] = isSwimmingPool.toString();
    request.fields['isDriverRoom'] = isDriverRoom.toString();
    request.fields['isDuplex'] = isDuplex.toString();
    request.fields['isHallStaircase'] = isHallStaircase.toString();
    request.fields['isConditioner'] = isConditioner.toString();
    request.fields['isElevator'] = isElevator.toString();
    request.fields['isCarEntrance'] = isCarEntrance.toString();
    request.fields['isAppendix'] = isAppendix.toString();
    request.fields['isKitchen'] = isKitchen.toString();
    request.fields['isFurnished'] = isFurnished.toString();
    request.fields['StreetWidth'] = StreetWidth.toString();
    request.fields['Floor'] = Floor.toString();
    request.fields['Trees'] = Trees.toString();
    request.fields['Wells'] = Wells.toString();
    request.fields['Stores'] = Stores.toString();
    request.fields['Apartments'] = Apartments.toString();
    request.fields['AgeOfRealEstate'] = AgeOfRealEstate.toString();
    request.fields['Rooms'] = Rooms.toString();
    request.fields['Toilets'] = Toilets.toString();
    request.fields['Lounges'] = Lounges.toString();
    request.fields['selectedTypeAqar'] = selectedTypeAqar.toString();
    request.fields['selectedFamily'] = selectedFamily.toString();
    request.fields['interfaceSelected'] = interfaceSelected.toString();
    request.fields['totalSpace'] = totalSpace.toString();
    request.fields['totalPrice'] = totalPrice.toString();
    request.fields['selectedPlan'] = selectedPlan.toString();
    request.fields['id_category'] = id_category.toString();
    request.fields['ads_cordinates_lat'] = ads_cordinates_lat.toString();
    request.fields['ads_cordinates_lng'] = ads_cordinates_lng.toString();
    request.fields['selectedAdderRelation'] = selectedAdderRelation.toString();
    request.fields['selectedMarketerRelation'] =
        selectedMarketerRelation.toString();
    request.fields['_phone'] = phone.toString();
    request.fields['ads_city'] = ads_city.toString();
    request.fields['ads_neighborhood'] = ads_neighborhood.toString();
    request.fields['ads_road'] = ads_road.toString();

    if (video != null) {
      var ved = await http.MultipartFile.fromPath('video', video.path);
      request.files.add(ved);
    }

    for (var i = 0; i < imagesList.length; i++) {
      await http.MultipartFile.fromPath('image[]', imagesList[i].path)
          .then((value) {
        request.files.add(value);
      });
    }
    var response = await request.send();
    if (response.statusCode == 200) {
      await Fluttertoast.showToast(
          msg: 'تم نشر الإعلان بنجاح.', toastLength: Toast.LENGTH_SHORT);
    } else {
      await Fluttertoast.showToast(
          msg: 'Error', toastLength: Toast.LENGTH_SHORT);
    }
  }

  Future sendMessFunc(BuildContext context, String content, String phone, String phone_user) async {
    var url = '$BaseURL/api_app/conversations/send_mes.php';
    await http.post(url, body: {
      'phone': phone,
      'other_phone': phone_user,
      'message': content,
    });
  }

  Future sendOfficesVRInfo(
      BuildContext context,
      String phone,
      String CRNumber,
      String officeName,
      String office_cordinates_lat,
      String office_cordinates_lng,
      File image
      ) async {
    final uri = Uri.parse('$BaseURL/api_app/login/officesVR.php');
    var request = http.MultipartRequest('POST', uri);
    request.fields['phone'] = phone;
    request.fields['CRNumber'] = CRNumber;
    request.fields['officeName'] = officeName;
    request.fields['lat'] = office_cordinates_lat;
    request.fields['lng'] = office_cordinates_lng;
    var pic = await http.MultipartFile.fromPath('image', image.path);
    request.files.add(pic);
    var response = await request.send();
    if (response.statusCode == 200) {
      await Fluttertoast.showToast(
          msg: 'لقد تم إرسال طلب التوثيق بنجاح',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 15.0);
    } else {
      await Fluttertoast.showToast(
          msg: 'هناك خطاء راجع الإدارة',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 15.0);
    }
  }

  Future updateMyProfileFunc(
      BuildContext context,
      String selectedMembership,
      String userName,
      String company_name,
      String office_name,
      String email,
      String personalProfile,
      String phone,
      File image
      ) async {
    final uri =
    Uri.parse('$BaseURL/api_app/login/uploadAvatar.php');
    var request = http.MultipartRequest('POST', uri);
    request.fields['id_mem'] = selectedMembership;
    request.fields['userName'] = userName;
    request.fields['company_name'] = company_name;
    request.fields['office_name'] = office_name;
    request.fields['email'] = email;
    request.fields['about'] = personalProfile;
    request.fields['phone'] = phone;
    if (image != null) {
      var pic = await http.MultipartFile.fromPath('image', image.path);
      request.files.add(pic);
    }
    var response = await request.send();
    if (response.statusCode == 200) {
      await Fluttertoast.showToast(
          msg: 'لقد تم تحديث معلومات المستخدم بنجاح',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 15.0);
    } else {
      await Fluttertoast.showToast(
          msg: 'هناك خطاء راجع الإدارة',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 15.0);
    }
  }

  Future sendInfoAqarVRFunc(
      BuildContext context,
      String identity_number,
      String saq_number,
      String identity_type,
      String id_description,
      File image
      ) async {
    final uri = Uri.parse('$BaseURL/api_app/ads/aqar_vr.php');
    var request = http.MultipartRequest('POST', uri);
    request.fields['identity_number'] = identity_number;
    request.fields['saq_number'] = saq_number;
    request.fields['identity_type'] = identity_type;
    request.fields['id_description'] = id_description;
    var pic2 = await http.MultipartFile.fromPath('img_saq', image.path);
    request.files.add(pic2);
    var response = await request.send();
    if (response.statusCode == 200) {
      await Fluttertoast.showToast(
          msg: 'لقد تم إرسال طلب التوثيق بنجاح',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 15.0);
    } else {
      await Fluttertoast.showToast(
          msg: 'هناك خطاء راجع الإدارة',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 15.0);
    }
  }

  Future<void> sendTransfer(
      BuildContext context,
      String phone,
      String fullName,
      String reason,
      String refrencedNumber,
      String radioValue1,
      File imageInvoice
      ) async {
    final uri = Uri.parse('$BaseURL/api_app/bankTransfer/transfer_form.php');
    var request = http.MultipartRequest('POST', uri);
    request.fields['phone'] = phone;
    request.fields['full_name'] = fullName;
    request.fields['reason'] = reason;
    request.fields['ref_number'] = refrencedNumber;
    request.fields['id_payment_type'] = radioValue1;
    var pic = await http.MultipartFile.fromPath('img_invoice', imageInvoice.path);
    request.files.add(pic);
    var response = await request.send();
    if (response.statusCode == 200) {
      await Fluttertoast.showToast(
          msg: 'تم إرسال نموذج التحويل بنجاح',
          toastLength: Toast.LENGTH_SHORT);
    } else {
      await Fluttertoast.showToast(
          msg: 'هناك خطاء راجع الإدارة',
          toastLength: Toast.LENGTH_SHORT);
    }
  }



}
