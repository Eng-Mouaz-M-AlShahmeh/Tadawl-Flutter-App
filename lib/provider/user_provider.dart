/*
Developed by: Eng Mouaz M. Al-Shahmeh
*/
import 'dart:async';
import 'dart:core';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';
import 'package:rating_dialog/rating_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tadawl_app/mainWidgets/Gist.dart';
import 'package:tadawl_app/models/AdsModel.dart';
import 'package:tadawl_app/models/ConvModel.dart';
import 'package:tadawl_app/models/OfficeModel.dart';
import 'package:tadawl_app/models/UserEstimateModel.dart';
import 'package:tadawl_app/models/UserModel.dart';
import 'package:tadawl_app/provider/ads_provider.dart';
import 'package:tadawl_app/provider/api/ApiFunctions.dart';
import 'package:tadawl_app/screens/account/my_account.dart';
import 'package:tadawl_app/screens/ads/main_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class UserProvider extends ChangeNotifier {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final List<UserModel> _users = [];
  final List<UserModel> _avatars = [];
  final List<AdsModel> _userAds = [];
  final List<AdsModel> _userAdsFav = [];
  final List<UserEstimateModel> _estimates = [];
  final List<UserEstimateModel> _sumEstimates = [];
  final List<OfficeModel> _offices = [];
  final List<OfficeModel> _officesList = [];
  final List<ConvModel> _conv = [];
  final List<ConvModel> _comment = [];
  final List<bool> _membershipType = List.generate(5, (_) => false);
  final List<bool> _isSelected = List.generate(2, (_) => false);
  final List<bool> _isSelected2 = List.generate(2, (_) => false);
  //TextEditingController _usernameController = TextEditingController();
  //TextEditingController _emailController = TextEditingController();
  //TextEditingController _aboutController = TextEditingController();
  //TextEditingController _companyNameController = TextEditingController();
  //TextEditingController _OfficeNameController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();
  //TextEditingController _usernameControllerUpdate = TextEditingController();
  final StreamController _streamChatController = StreamController.broadcast();
  StreamSubscription _streamChatSubscription;
  final ScrollController _scrollChatController = ScrollController();
  List _UserData = [];
  List _AvatarData = [];
  List _UserAdsData = [];
  List _UserAdsFavData = [];
  List _EstimateData = [];
  List _SumEstimateData = [];
  List _OfficeData = [];
  List _OfficeListData = [];
  List _ConvData = [];
  List _CommentData = [];
  String _userName, _companyName, _email, _personalProfile, _officeNameUser;
  String _phone;
  String _userPhone;
  String _rating, _commentRating;
  String _verificationCode;
  String _newPass, _reNewPass;
  String _CRNumber, _officeName;
  String _fullName, _reason, _refrencedNumber;
  int _called;
  int _selectedNav = 0;
  int _current_stage;
  int _selectedMembership;
  int _buttonClicked;
  int _currentStageOfficeVR;
  int _radioValue1 = -1;
  int _selectedNav2;
  final int _scrollState = 0;
  bool _wait = false;
  bool _passwordVisible = false;
  bool _atBottom = false;
  bool _Accepted = false;
  double _office_cordinates_lat;
  double _office_cordinates_lng;
  var _markers = <Marker>[];
  final Set<Marker> _markersOfficesVR = {};
  LatLng _initialCameraPosition;
  LatLng _office_cordinates;
  File _imageOfficeVR;
  File _imageUpdateProfile;
  File _imageInvoice;
  final _picker = ImagePicker();
  final _picker2 = ImagePicker();
  final _picker3 = ImagePicker();
  LocationData _currentPosition;
  final Location _location = Location();
  BitmapDescriptor _mapMarker;
  String _recAvatarUserName = 'Username';
  String _currentPhone;
  String _newPhone;
  String _newAccountPhone;

  void setRecAvatarUserName(String username) {
    _recAvatarUserName = username;
    notifyListeners();
  }

  void setCurrentPhone(String val) {
    _currentPhone = filterPhone(val);
    notifyListeners();
  }

  void setNewAccountPhone(String val) {
    _newAccountPhone = filterPhone(val);
    notifyListeners();
  }

  void setNewPhone(String val) {
    _newPhone = filterPhone(val);
    notifyListeners();
  }

  String filterPhone(var Phone) {
    if (Phone.toString().length == 10 && Phone.toString().startsWith('05')) {
      Phone = Phone.toString().replaceFirst('0', '966');
      return Phone;
    } else if (Phone.toString().startsWith('5')) {
      Phone = Phone.toString().replaceFirst('5', '9665');
      return Phone;
    } else if (Phone.toString().startsWith('00')) {
      Phone = Phone.toString().replaceFirst('00', '');
      return Phone;
    } else if (Phone.toString().startsWith('+')) {
      Phone = Phone.toString().replaceFirst('+', '');
      return Phone;
    } else {
      return Phone;
    }
  }

  void initStateSelected() {
    _isSelected[0] = true;
  }

  void getUsersList(BuildContext context, String Phone) {
    Future.delayed(Duration(milliseconds: 0), () {
      if(Phone != null) {
        Api(_scaffoldKey).getUserInfoFunc(context, Phone).then((value) {
          _UserData = value;
          _users.clear();
          _UserData.forEach((element) {
            _users.add(UserModel(
              image: element['image'],
              username: element['username'],
              timeRegistered: element['timeRegistered'],
              lastActive: element['lastActive'],
              about: element['about'],
              phone: element['phone'],
              company_name: element['company_name'],
              office_name: element['office_name'],
              email: element['email'],
              id_mem: element['id_mem'],
            ));
          });
        });

        if (_users.isNotEmpty) {
          setUsernameController(_users.first.username);
          setEmailController(_users.first.email);
          setAboutController(_users.first.about);
          setCompanyNameController(_users.first.company_name);
          setOfficeNameController(_users.first.office_name);
          setUsername(_users.first.username);
          setCompanyName(_users.first.company_name);
          setOfficeNameUser(_users.first.office_name);
          setEmail(_users.first.email);
          setPersonalProfile(_users.first.about);

          if (_users.first.id_mem != null) {
            initMembershipType(_users.first.id_mem);
          }
        }

      }
    });
  }

  void getAvatarList(BuildContext context, String PhoneOther) {
    Future.delayed(Duration(milliseconds: 0), () {
      if (_avatars.isEmpty) {
        Api(_scaffoldKey).getUserInfoFunc(context, PhoneOther).then((value) {
          _AvatarData = value;
          _AvatarData.forEach((element) {
            _avatars.add(UserModel(
              image: element['image'],
              username: element['username'],
              timeRegistered: element['timeRegistered'],
              lastActive: element['lastActive'],
              about: element['about'],
              phone: element['phone'],
              company_name: element['company_name'],
              office_name: element['office_name'],
              email: element['email'],
              id_mem: element['id_mem'],
            ));
          });
        });
      } else {
        Api(_scaffoldKey).getUserInfoFunc(context, PhoneOther).then((value) {
          _AvatarData = value;
          _avatars.clear();
          _AvatarData.forEach((element) {
            _avatars.add(UserModel(
              image: element['image'],
              username: element['username'],
              timeRegistered: element['timeRegistered'],
              lastActive: element['lastActive'],
              about: element['about'],
              phone: element['phone'],
              company_name: element['company_name'],
              office_name: element['office_name'],
              email: element['email'],
              id_mem: element['id_mem'],
            ));
          });
        });
      }
    });
  }

  void getUserAdsList(BuildContext context, String Phone) {
    Future.delayed(Duration(milliseconds: 0), () {
      if (_userAds.isEmpty) {
        Api(_scaffoldKey).getUserAdsFunc(context, Phone).then((value) {
          _UserAdsData = value;
          _UserAdsData.forEach((element) {
            _userAds.add(AdsModel(
              id_ads: element['id'],
              idDescription: element['id_description'],
              idUser: element['id_user'],
              price: element['price'],
              lat: element['lat'],
              lng: element['lng'],
              ads_city: element['ads_city'],
              ads_neighborhood: element['ads_neighborhood'],
              ads_road: element['ads_road'],
              description: element['description'],
              ads_image: element['ads_image'],
              title: element['title'],
              space: element['space'],
              idSpecial: element['id_special'],
              video: element['video'],
              timeAdded: element['timeAdded'],
              idCategory: element['id_category'],
            ));
          });
        });
      } else {
        Api(_scaffoldKey).getUserAdsFunc(context, Phone).then((value) {
          _UserAdsData = value;
          _userAds.clear();
          _UserAdsData.forEach((element) {
            _userAds.add(AdsModel(
              id_ads: element['id'],
              idDescription: element['id_description'],
              idUser: element['id_user'],
              price: element['price'],
              lat: element['lat'],
              lng: element['lng'],
              ads_city: element['ads_city'],
              ads_neighborhood: element['ads_neighborhood'],
              ads_road: element['ads_road'],
              description: element['description'],
              ads_image: element['ads_image'],
              title: element['title'],
              space: element['space'],
              idSpecial: element['id_special'],
              video: element['video'],
              timeAdded: element['timeAdded'],
              idCategory: element['id_category'],
            ));
          });
        });
      }
    });
  }

  void getUserAdsFavList(BuildContext context, String Phone) {
    Future.delayed(Duration(milliseconds: 0), () {
      if (_userAds.isEmpty) {
        Api(_scaffoldKey).getFavAdsFunc(context, Phone).then((value) {
          _UserAdsFavData = value;
          _UserAdsFavData.forEach((element) {
            _userAdsFav.add(AdsModel(
              idDescription: element['id_description'],
              idUser: element['id_user'],
              price: element['price'],
              lat: element['lat'],
              lng: element['lng'],
              ads_city: element['ads_city'],
              ads_neighborhood: element['ads_neighborhood'],
              ads_road: element['ads_road'],
              description: element['description'],
              ads_image: element['ads_image'],
              title: element['title'],
              space: element['space'],
              idSpecial: element['id_special'],
              video: element['video'],
              timeAdded: element['timeAdded'],
              id_fav: element['id_fav'],
              isFav: element['isFav'],
              id_ads: element['id'],
              phone_faved_user: element['phone_faved_user'],
              idCategory: element['id_category'],
            ));
          });
        });
      } else {
        Api(_scaffoldKey).getFavAdsFunc(context, Phone).then((value) {
          _UserAdsFavData = value;
          _userAdsFav.clear();
          _UserAdsFavData.forEach((element) {
            _userAdsFav.add(AdsModel(
              idDescription: element['id_description'],
              idUser: element['id_user'],
              price: element['price'],
              lat: element['lat'],
              lng: element['lng'],
              ads_city: element['ads_city'],
              ads_neighborhood: element['ads_neighborhood'],
              ads_road: element['ads_road'],
              description: element['description'],
              ads_image: element['ads_image'],
              title: element['title'],
              space: element['space'],
              idSpecial: element['id_special'],
              video: element['video'],
              timeAdded: element['timeAdded'],
              id_fav: element['id_fav'],
              isFav: element['isFav'],
              id_ads: element['id'],
              phone_faved_user: element['phone_faved_user'],
              idCategory: element['id_category'],
            ));
          });
        });
      }
    });
  }

  void getEstimatesInfo(BuildContext context, String Phone) {
    Future.delayed(Duration(milliseconds: 0), () {
      if (_userAds.isEmpty) {
        Api(_scaffoldKey).getEstimates(context, Phone).then((value) {
          _EstimateData = value;
          _EstimateData.forEach((element) {
            _estimates.add(UserEstimateModel(
              phone_user: element['phone_user'],
              phone_user_estimated: element['phone_user_estimated'],
              rate: element['rate'],
              comment: element['comment'],
            ));
          });
        });
      } else {
        Api(_scaffoldKey).getEstimates(context, Phone).then((value) {
          _EstimateData = value;
          _estimates.clear();
          _EstimateData.forEach((element) {
            _estimates.add(UserEstimateModel(
              phone_user: element['phone_user'],
              phone_user_estimated: element['phone_user_estimated'],
              rate: element['rate'],
              comment: element['comment'],
            ));
          });
        });
      }
    });
    //notifyListeners();
  }

  void getSumEstimatesInfo(BuildContext context, String Phone) {
    Future.delayed(Duration(milliseconds: 0), () {
      if (_userAds.isEmpty) {
        Api(_scaffoldKey).getSumEstimates(context, Phone).then((value) {
          _SumEstimateData = value;
          _SumEstimateData.forEach((element) {
            _sumEstimates.add(UserEstimateModel(
              sum_estimates: element['SUM(`rate`)'],
            ));
          });
        });
      } else {
        Api(_scaffoldKey).getSumEstimates(context, Phone).then((value) {
          _SumEstimateData = value;
          _sumEstimates.clear();
          _SumEstimateData.forEach((element) {
            _sumEstimates.add(UserEstimateModel(
              sum_estimates: element['SUM(`rate`)'],
            ));
          });
        });
      }
    });
    //notifyListeners();
  }

  void checkOfficeInfo(BuildContext context, String Phone) {
    Future.delayed(Duration(milliseconds: 0), () {
      if (_offices.isEmpty) {
        Api(_scaffoldKey).getOfficeCheckFunc(context, Phone).then((value) {
          _OfficeData = value;
          _OfficeData.forEach((element) {
            _offices.add(OfficeModel(
              office_name: element['office_name'],
              phone_user: element['phone_user'],
              office_lat: element['office_lat'],
              office_lng: element['office_lng'],
              state: element['state'],
            ));
          });
        });
      } else {
        Api(_scaffoldKey).getOfficeCheckFunc(context, Phone).then((value) {
          _OfficeData = value;
          _offices.clear();
          _OfficeData.forEach((element) {
            _offices.add(OfficeModel(
              office_name: element['office_name'],
              phone_user: element['phone_user'],
              office_lat: element['office_lat'],
              office_lng: element['office_lng'],
              state: element['state'],
            ));
          });
        });
      }
    });
  }

  void getOfficeList(BuildContext context) {
    Future.delayed(Duration(milliseconds: 0), () {
      if (_officesList.isEmpty) {
        Api(_scaffoldKey).getsOfficeFunc(context).then((value) {
          _OfficeListData = value;
          _OfficeListData.forEach((element) {
            _officesList.add(OfficeModel(
              office_name: element['office_name'],
              phone_user: element['phone_user'],
              office_lat: element['office_lat'],
              office_lng: element['office_lng'],
              state: element['state'],
            ));
          });
        });
      } else {
        Api(_scaffoldKey).getsOfficeFunc(context).then((value) {
          _OfficeListData = value;
          _officesList.clear();
          _OfficeListData.forEach((element) {
            _officesList.add(OfficeModel(
              office_name: element['office_name'],
              phone_user: element['phone_user'],
              office_lat: element['office_lat'],
              office_lng: element['office_lng'],
              state: element['state'],
            ));
          });
        });
      }
    });
  }

  Future getSession() async {
    var p = await SharedPreferences.getInstance();
    _phone = p.getString('token');
    notifyListeners();
  }

  Future logout() async {
    var p = await SharedPreferences.getInstance();
    await p.remove('token');
    await getSession();
    notifyListeners();
  }

  void saveSession(String phone) async {
    var p = await SharedPreferences.getInstance();
    await p.setString('token', phone.toString());
    // ignore: deprecated_member_use
    await p.commit();
  }

  void setWaitState(bool wait) {
    _wait = wait;
  }

  void setPasswordVisibleState(bool state) {
    _passwordVisible = state;
    notifyListeners();
  }

  Widget _getMarkerWidget(String name) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 3, vertical: 1.5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: const Color(0xffffffff), width: 1),
          color: const Color(0xff00cccc),
          shape: BoxShape.rectangle,
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(
            name,
            style: GoogleFonts.tajawal(
              fontSize: 15,
              color: const Color(0xffffffff),
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  void getOfficeListMap(BuildContext context) {
    List<Widget> markerWidgets() {
      return _officesList
          .map((c) => _getMarkerWidget('${c.office_name ?? ""}'))
          .toList();
    }

    List<Marker> mapBitmapsToMarkers(List<Uint8List> bitmaps) {
      var markersList = <Marker>[];
      bitmaps.asMap().forEach((i, bmp) {
        final office = _officesList[i];
        // ignore: unrelated_type_equality_checks
        markersList.add(Marker(
            markerId: MarkerId('${office.office_name ?? ""}'),
            position: LatLng(double.parse(office.office_lat),
                double.parse(office.office_lng)),
            onTap: () {
              getAvatarList(context, office.phone_user);
              getUserAdsList(context, office.phone_user);
              getEstimatesInfo(context, office.phone_user);
              getSumEstimatesInfo(context, office.phone_user);
              checkOfficeInfo(context, office.phone_user);
              setUserPhone(office.phone_user);

              Future.delayed(Duration(seconds: 0), () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyAccount()),
                );
              });
            },
            icon: BitmapDescriptor.fromBytes(bmp)));
      });
      return markersList;
    }

    Future.delayed(Duration(milliseconds: 0), () {
      if (_officesList.isEmpty) {
        Api(_scaffoldKey).getsOfficeFunc(context).then((value) {
          _OfficeListData = value;
          _OfficeListData.forEach((element) {
            _officesList.add(OfficeModel(
              office_name: element['office_name'],
              phone_user: element['phone_user'],
              office_lat: element['office_lat'],
              office_lng: element['office_lng'],
              state: element['state'],
            ));
          });

          MarkerGenerator(markerWidgets(), (bitmaps) {
            _markers = mapBitmapsToMarkers(bitmaps);
            notifyListeners();
          }).generate(context);
        });
      } else {
        Api(_scaffoldKey).getsOfficeFunc(context).then((value) {
          _OfficeListData = value;
          _officesList.clear();
          _OfficeListData.forEach((element) {
            _officesList.add(OfficeModel(
              office_name: element['office_name'],
              phone_user: element['phone_user'],
              office_lat: element['office_lat'],
              office_lng: element['office_lng'],
              state: element['state'],
            ));
          });

          MarkerGenerator(markerWidgets(), (bitmaps) {
            _markers = mapBitmapsToMarkers(bitmaps);
            notifyListeners();
          }).generate(context);
        });
      }
    });
  }

  void getConvInfo(BuildContext context) async {
    if(_phone != null) {
      Future.delayed(Duration(milliseconds: 0), () {
        if (_conv.isEmpty) {
          Api(_scaffoldKey).getDiscListFunc(context, _phone).then((value) {
            _ConvData = value;
            _ConvData.forEach((element) {
              _conv.add(ConvModel(
                id_conv: element['id_conv'],
                phone_user_recipient: element['phone_user_recipient'],
                phone_user_sender: element['phone_user_sender'],
                id_comment: element['id_comment'],
                seen_reciever: element['seen_reciever'],
                seen_sender: element['seen_sender'],
                state_conv_receiver: element['state_conv_receiver'],
                state_conv_sender: element['state_conv_sender'],
                comment: element['comment'],
                timeAdded: element['timeAdded'],
                username: element['username'],
                image: element['image'],
                phone: element['phone'],
              ));
            });
          });
          notifyListeners();
        } else {
          Api(_scaffoldKey).getDiscListFunc(context, _phone).then((value) {
            _ConvData = value;
            _conv.clear();
            _ConvData.forEach((element) {
              _conv.add(ConvModel(
                id_conv: element['id_conv'],
                phone_user_recipient: element['phone_user_recipient'],
                phone_user_sender: element['phone_user_sender'],
                id_comment: element['id_comment'],
                seen_reciever: element['seen_reciever'],
                seen_sender: element['seen_sender'],
                state_conv_receiver: element['state_conv_receiver'],
                state_conv_sender: element['state_conv_sender'],
                comment: element['comment'],
                timeAdded: element['timeAdded'],
                username: element['username'],
                image: element['image'],
                phone: element['phone'],
              ));
            });
          });
          notifyListeners();
        }
      });
    }
  }

  Future<void> sendMess(
      BuildContext context, String content, String phone_user) async {
    Future.delayed(Duration(milliseconds: 0), () {
      Api(_scaffoldKey).sendMessFunc(context, content, _phone, phone_user);
    });
    _messageController.clear();
    FocusScope.of(context).requestFocus(FocusNode());
    Future.delayed(const Duration(seconds: 2), () {
      _scrollChatController.animateTo(10000,
          duration: Duration(seconds: 2), curve: Curves.easeIn);
    });

    notifyListeners();
  }

  //void closeStreamChat() {
    //_streamChatSubscription.pause();
    //notifyListeners();
 // }

  Future getCommentUser(BuildContext context, String phone_user) async {
    Future.delayed(Duration(milliseconds: 0), () {
      if (_comment.isEmpty) {
        Api(_scaffoldKey).getComments(context, _phone, phone_user).then((
            value) {
          _CommentData = value;
          _CommentData.forEach((element) {
            _comment.add(ConvModel(
              id_conv: element['id_conv'],
              phone_user_recipient: element['phone_user_recipient'],
              phone_user_sender: element['phone_user_sender'],
              id_comment: element['id_comment'],
              seen_reciever: element['seen_reciever'],
              seen_sender: element['seen_sender'],
              state_conv_receiver: element['state_conv_receiver'],
              state_conv_sender: element['state_conv_sender'],
              comment: element['comment'],
              timeAdded: element['timeAdded'],
              username: element['username'],
              image: element['image'],
              phone: element['phone'],
            ));
          });

         // if(_streamChatSubscription.isPaused) {
         //   _streamChatSubscription.resume();
         //   _streamChatController.add(value);
        //  } else {
            _streamChatController.add(value);
        //  }
          notifyListeners();
        });
      } else {
        Api(_scaffoldKey).getComments(context, _phone, phone_user).then((
            value) {
          _CommentData = value;
          _comment.clear();
          _CommentData.forEach((element) {
            _comment.add(ConvModel(
              id_conv: element['id_conv'],
              phone_user_recipient: element['phone_user_recipient'],
              phone_user_sender: element['phone_user_sender'],
              id_comment: element['id_comment'],
              seen_reciever: element['seen_reciever'],
              seen_sender: element['seen_sender'],
              state_conv_receiver: element['state_conv_receiver'],
              state_conv_sender: element['state_conv_sender'],
              comment: element['comment'],
              timeAdded: element['timeAdded'],
              username: element['username'],
              image: element['image'],
              phone: element['phone'],
            ));
          });
        //  if(_streamChatSubscription.isPaused) {
         //   _streamChatSubscription.resume();
         //   _streamChatController.add(value);
        //  } else {
            _streamChatController.add(value);
        //  }
          notifyListeners();
        });
      }
    });
  }

  void scrollDown() {
    if (_scrollState == 1) {
      _scrollChatController
          .jumpTo(_scrollChatController.position.maxScrollExtent + 23);
      notifyListeners();
    }
  }

  void scrollDownButtun() {
    Future.delayed(const Duration(seconds: 3), () {
      _scrollChatController.animateTo(10000,
          duration: Duration(seconds: 1), curve: Curves.easeIn);
    });
    if (_scrollChatController.position.atEdge) {
      _scrollChatController.addListener(() {
        if (_scrollChatController.position.atEdge) {
          if (_scrollChatController.position.pixels == 0) {
            // You're at the top.
          } else {
            _atBottom = true;
          }
        }
      });
    }
    notifyListeners();
  }

  void initScrollDown() {
    Future.delayed(const Duration(seconds: 3), () {
      _scrollChatController.animateTo(50000,
          duration: Duration(seconds: 1), curve: Curves.easeIn);
    });
    _scrollChatController.addListener(() {
      if (_scrollChatController.position.atEdge) {
        if (_scrollChatController.position.pixels == 0) {
          _atBottom = false;
        } else {
          _atBottom = true;
        }
      } else {
        _atBottom = false;
      }
    });

    //notifyListeners();
  }

  void setMessageController(String message) {
    _messageController.text = message;
    notifyListeners();
  }

  void setUserPhone(String userPhone) {
    _userPhone = userPhone;
    notifyListeners();
  }

  void setCalled() {
    _called = 1;
    notifyListeners();
  }

  void setRating(String ratingg) {
    _rating = ratingg;
    notifyListeners();
  }

  void setCommentRating(String commentRatingg) {
    _commentRating = commentRatingg;
    notifyListeners();
  }

  void setNewPass(String newPass) {
    _newPass = newPass;
    notifyListeners();
  }

  void setReNewPass(String reNewPass) {
    _reNewPass = reNewPass;
    notifyListeners();
  }

  void setVerCode(String verCode) {
    _verificationCode = verCode;
    notifyListeners();
  }

  void setCurrentStage(int currentStage) {
    _current_stage = currentStage;
    notifyListeners();
  }

  void updateSelected(int index) {
    for (var buttonIndex = 0; buttonIndex < countIsSelected(); buttonIndex++) {
      if (buttonIndex == index) {
        _isSelected[buttonIndex] = true;
        _selectedNav = buttonIndex;
      } else {
        _isSelected[buttonIndex] = false;
      }
    }
    notifyListeners();
  }

  Future<void> getLoc() async {
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    _serviceEnabled = await _location.serviceEnabled();
    if (!_serviceEnabled) {}
    _permissionGranted = await _location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await _location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        _initialCameraPosition = LatLng(24.713704574942028, 46.68523302830853);
      }
    }
    _currentPosition = await _location.getLocation();
    _initialCameraPosition =
        LatLng(_currentPosition.latitude, _currentPosition.longitude);
    _location.onLocationChanged.listen((LocationData currentLocation) {
      _currentPosition = currentLocation;
      _initialCameraPosition =
          LatLng(_currentPosition.latitude, _currentPosition.longitude);
    });
    //await _location.enableBackgroundMode(enable: false);
    notifyListeners();
  }

  void setButtonClicked(int state) {
    _buttonClicked = state;
    notifyListeners();
  }

  void setCurrentStageOfficeVR(int stage) {
    _currentStageOfficeVR = stage;
    notifyListeners();
  }

  Future<void> sendOfficesVRInfo(
      BuildContext context,
      String phone,
      String CRNumber,
      String officeName,
      String office_cordinates_lat,
      String office_cordinates_lng,
      File image) async {
    Future.delayed(Duration(milliseconds: 0), () {
      Api(_scaffoldKey).sendOfficesVRInfo(context, phone, CRNumber, officeName,
          office_cordinates_lat, office_cordinates_lng, image);
    });

    getAvatarList(context, phone);
    getUserAdsList(context, phone);
    getEstimatesInfo(context, phone);
    getSumEstimatesInfo(context, phone);
    checkOfficeInfo(context, phone);
    setUserPhone(phone);

    Future.delayed(Duration(seconds: 0), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MyAccount()),
      );
    });
  }

  void handleCameraMoveOfficesVR(CameraPosition position) async {
    if (_markersOfficesVR.isEmpty) {
      _markersOfficesVR.add(Marker(
        markerId: MarkerId(position.target.toString()),
        position: position.target,
        icon: mapMarker,
      ));
    } else {
      _markersOfficesVR.clear();
      _markersOfficesVR.add(Marker(
        markerId: MarkerId(position.target.toString()),
        position: position.target,
        icon: mapMarker,
      ));
    }
    _office_cordinates = position.target;
    _office_cordinates_lat = position.target.latitude;
    _office_cordinates_lng = position.target.longitude;
    notifyListeners();
  }

  Future<void> getImageOfficesVR() async {
    final _pickedFile = await _picker.getImage(
      source: ImageSource.gallery,
    );
    if (_pickedFile != null) {
      _imageOfficeVR = File(_pickedFile.path);
    } else {}
    notifyListeners();
  }

  void setCRNumber(String CRNumber) {
    _CRNumber = CRNumber;
    notifyListeners();
  }

  void setOfficeName(String officeName) {
    _officeName = officeName;
    notifyListeners();
  }

  Future updateMyProfile(
      BuildContext context,
      String selectedMembership,
      String userName,
      String company_name,
      String office_name,
      String email,
      String personalProfile,
      String phone,
      File image) async {
    Future.delayed(Duration(milliseconds: 0), () {
      Api(_scaffoldKey).updateMyProfileFunc(
          context,
          selectedMembership,
          userName,
          company_name,
          office_name,
          email,
          personalProfile,
          phone,
          image);
    });

    getAvatarList(context, phone);
    getUserAdsList(context, phone);
    getEstimatesInfo(context, phone);
    getSumEstimatesInfo(context, phone);
    checkOfficeInfo(context, phone);
    setUserPhone(phone);

    Future.delayed(Duration(seconds: 0), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MainPage()),
      );
    });

  }

  Future<void> getImageUpdateProfile() async {
    final _pickedFile2 = await _picker2.getImage(
      source: ImageSource.gallery,
      //maxHeight: 200,
      //maxWidth: 200,
      //imageQuality: 80,
    );
    if (_pickedFile2 != null) {
      _imageUpdateProfile = File(_pickedFile2.path);
    }
    //notifyListeners();
  }

  void setUsernameController(String usernameController) {
    //_usernameController..text = usernameController;
    //notifyListeners();
  }

  void setUsernameControllerUpdate(String val) {
    //_usernameControllerUpdate..text = val;
    //notifyListeners();
  }

  void setEmailController(String emailController) {
    //_emailController..text = emailController;
    //notifyListeners();
  }

  void setAboutController(String aboutController) {
    //_aboutController..text = aboutController;
    //notifyListeners();
  }

  void setCompanyNameController(String companyNameController) {
    //_companyNameController..text = companyNameController;
    //notifyListeners();
  }

  void setOfficeNameController(String OfficeNameController) {
    //_OfficeNameController..text = OfficeNameController;
    //notifyListeners();
  }

  void setUsername(String userName) {
    _userName = userName;
    //notifyListeners();
  }

  void setCompanyName(String company_name) {
    _companyName = company_name;
    //notifyListeners();
  }

  void setOfficeNameUser(String office_name) {
    _officeNameUser = office_name;
    //notifyListeners();
  }

  void setEmail(String email) {
    _email = email;
    //notifyListeners();
  }

  void setPersonalProfile(String personalProfile) {
    _personalProfile = personalProfile;
    //notifyListeners();
  }

  void updateMembershipType(int index) {
    for (var buttonIndex2 = 0;
        buttonIndex2 < _membershipType.length;
        buttonIndex2++) {
      if (buttonIndex2 == index) {
        _membershipType[buttonIndex2] = true;
        _selectedMembership = buttonIndex2 + 1;
      } else {
        membershipType[buttonIndex2] = false;
      }
    }

    //notifyListeners();
  }

  void initMembershipType(String idMem) {
   // _membershipType[int.parse(idMem) - 1] = true;
   // _selectedMembership = int.parse(idMem);

    //notifyListeners();
  }

  Future<void> sendTransfer(
      BuildContext context,
      String phone,
      String fullName,
      String reason,
      String refrencedNumber,
      String radioValue1,
      File imageInvoice) async {
    Future.delayed(Duration(seconds: 0), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MainPage()),
      );
    });
  }

  Future<void> getImageInvoice() async {
    final _pickedFile3 = await _picker3.getImage(
      source: ImageSource.gallery,
    );
    if (_pickedFile3 != null) {
      _imageInvoice = File(_pickedFile3.path);
    } else {}
    notifyListeners();
  }

  void deleteImageInvoice() {
    _imageInvoice = null;
    notifyListeners();
  }

  void updateAccepted(bool Accepted) {
    _Accepted = Accepted;
    notifyListeners();
  }

  void setFullName(String fullName) {
    _fullName = fullName;
    notifyListeners();
  }

  void setReason(String reason) {
    _reason = reason;
    notifyListeners();
  }

  void setRefrencedNumber(String refrencedNumber) {
    _refrencedNumber = refrencedNumber;
    notifyListeners();
  }

  void handleRadioValueChange1(int value) {
    _radioValue1 = value;
    notifyListeners();
  }

  void updateTransferChoice(int index) {
    for (var buttonIndex3 = 0;
        buttonIndex3 < _isSelected2.length;
        buttonIndex3++) {
      if (buttonIndex3 == index) {
        _isSelected2[buttonIndex3] = true;
        _selectedNav2 = buttonIndex3;
      } else {
        _isSelected2[buttonIndex3] = false;
      }
    }

    notifyListeners();
  }

  void goToAvatar(BuildContext context, String phone) {
    Future.delayed(Duration(milliseconds: 0), () {
      _wait = true;
      getAvatarList(context, phone);
      getUserAdsList(context, phone);
      getEstimatesInfo(context, phone);
      getSumEstimatesInfo(context, phone);
      checkOfficeInfo(context, phone);
      setUserPhone(phone);
    });
    Future.delayed(Duration(seconds: 0), () {
      _wait = false;
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MyAccount()),
      );
    });
    notifyListeners();
  }

  void callNumber(BuildContext context, String phoneEstimated) async {
    if (_estimates.isNotEmpty) {
      for (var i = 0; i < countEstimates(); i++) {
        if (_estimates[i].phone_user == _phone &&
            _estimates[i].phone_user_estimated == phoneEstimated) {
          _called = 1;
        }
      }
      if (called == 1) {
      } else {
        showRatingDialog(context, phoneEstimated);
      }
    } else {
      showRatingDialog(context, phoneEstimated);
    }
    if (phoneEstimated == _phone) {
      var number = '+$_phone';
      await FlutterPhoneDirectCaller.callNumber(number);
    } else {
      var number = '+$phoneEstimated';
      await FlutterPhoneDirectCaller.callNumber(number);
    }
  }

  void showRatingDialog(BuildContext context, String phoneEstimated) {
    final _dialog = RatingDialog(
      title: AppLocalizations.of(context).ratingDialog,
      commentHint: AppLocalizations.of(context).ratingCommentHint,
      message: AppLocalizations.of(context).ratingHint,
      image: Container(
        width: 100.0,
        height: 100.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: const AssetImage('assets/images/avatar.png'),
            fit: BoxFit.contain,
          ),
        ),
      ),
      submitButton: AppLocalizations.of(context).send,
      onSubmitted: (response) {
        _rating = response.rating.toString();
        _commentRating = response.comment;
        Provider.of<AdsProvider>(context, listen: false).sendEstimate(
            context,
            _phone,
            phoneEstimated,
            _rating,
            _commentRating,
            Provider.of<AdsProvider>(context, listen: false).idDescription);
      },
    );
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => _dialog,
    );
  }

  int countConvs() {
    if (_conv.isNotEmpty) {
      return _conv.length;
    } else {
      return 0;
    }
  }

  int countUsers() {
    if (_users.isNotEmpty) {
      return _users.length;
    } else {
      return 0;
    }
  }

  int countAvatars() {
    if (_avatars.isNotEmpty) {
      return _avatars.length;
    } else {
      return 0;
    }
  }

  int countUserAds() {
    if (_userAds.isNotEmpty) {
      return _userAds.length;
    } else {
      return 0;
    }
  }

  int countUserAdsFav() {
    if (_userAdsFav.isNotEmpty) {
      return _userAdsFav.length;
    } else {
      return 0;
    }
  }

  int countEstimates() {
    if (_estimates.isNotEmpty) {
      return _estimates.length;
    } else {
      return 0;
    }
  }

  int countOffices() {
    if (_officesList.isNotEmpty) {
      return _officesList.length;
    } else {
      return 0;
    }
  }

  int countIsSelected() {
    if (_isSelected.isNotEmpty) {
      return _isSelected.length;
    } else {
      return 0;
    }
  }

  List<UserModel> get users => _users;
  List<UserModel> get avatars => _avatars;
  List<AdsModel> get userAds => _userAds;
  List<AdsModel> get userAdsFav => _userAdsFav;
  List<UserEstimateModel> get estimates => _estimates;
  List<UserEstimateModel> get sumEstimates => _sumEstimates;
  List<OfficeModel> get offices => _offices;
  List<OfficeModel> get officesList => _officesList;
  List<Marker> get markers => _markers;
  List<ConvModel> get conv => _conv;
  String get recAvatarUserName => _recAvatarUserName;
  List<bool> get isSelected => _isSelected;
  List<bool> get membershipType => _membershipType;
  List<bool> get isSelected2 => _isSelected2;
  Set<Marker> get markersOfficesVR => _markersOfficesVR;
  StreamController get streamChatController => _streamChatController;
  ScrollController get scrollChatController => _scrollChatController;
  TextEditingController get messageController => _messageController;
  //TextEditingController get usernameController => _usernameController;
  //TextEditingController get emailController => _emailController;
  //TextEditingController get aboutController => _aboutController;
  //TextEditingController get companyNameController => _companyNameController;
  //TextEditingController get OfficeNameController => _OfficeNameController;
  //TextEditingController get usernameControllerUpdate => _usernameControllerUpdate;
  String get phone => _phone;
  String get userPhone => _userPhone;
  String get rating => _rating;
  String get commentRating => _commentRating;
  String get verificationCode => _verificationCode;
  String get newPass => _newPass;
  String get CRNumber => _CRNumber;
  String get officeName => _officeName;
  String get userName => _userName;
  String get company_name => _companyName;
  String get email => _email;
  String get personalProfile => _personalProfile;
  String get officeNameUser => _officeNameUser;
  String get reNewPass => _reNewPass;
  String get fullName => _fullName;
  String get reason => _reason;
  String get refrencedNumber => _refrencedNumber;
  double get office_cordinates_lat => _office_cordinates_lat;
  double get office_cordinates_lng => _office_cordinates_lng;
  bool get atBottom => _atBottom;
  bool get wait => _wait;
  bool get passwordVisible => _passwordVisible;
  bool get Accepted => _Accepted;
  int get called => _called;
  int get selectedNav => _selectedNav;
  int get current_stage => _current_stage;
  int get buttonClicked => _buttonClicked;
  int get currentStageOfficeVR => _currentStageOfficeVR;
  int get selectedMembership => _selectedMembership;
  int get radioValue1 => _radioValue1;
  int get selectedNav2 => _selectedNav2;
  File get imageOfficeVR => _imageOfficeVR;
  File get imageUpdateProfile => _imageUpdateProfile;
  File get imageInvoice => _imageInvoice;
  BitmapDescriptor get mapMarker => _mapMarker;
  LatLng get initialCameraPosition => _initialCameraPosition;
  LatLng get office_cordinates => _office_cordinates;
  StreamSubscription get streamChatSubscription => _streamChatSubscription;
  String get currentPhone => _currentPhone;
  String get newPhone => _newPhone;
  String get newAccountPhone => _newAccountPhone;
}
