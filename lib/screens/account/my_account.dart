/*
Developed by: Eng Mouaz M. Al-Shahmeh
*/
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_simple_rating_bar/flutter_simple_rating_bar.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tadawl_app/provider/ads_provider.dart';
import 'package:tadawl_app/provider/api/ApiFunctions.dart';
import 'package:tadawl_app/provider/locale_provider.dart';
import 'package:tadawl_app/provider/user_provider.dart';
import 'package:tadawl_app/screens/account/change_pass.dart';
import 'package:tadawl_app/screens/account/change_phone.dart';
import 'package:tadawl_app/screens/account/offices_Vr.dart';
import 'package:tadawl_app/screens/account/update_my_information.dart';
import 'package:tadawl_app/screens/ads/ad_page.dart';
import 'package:tadawl_app/screens/ads/main_page.dart';
import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:rating_dialog/rating_dialog.dart';

class Constants {
  static const String updateMyInfo = 'تحديث معلوماتي';
  static const String changePass = 'تغيير كلمة المرور';
  static const String changePhone = 'تغيير رقم الجوال';
  static const String logout = 'تسجيل الخروج';
  static const List<String> choices = <String>[
    updateMyInfo,
    changePass,
    changePhone,
    logout
  ];
}

class EngConstants {
  static const String updateMyInfo = 'Update My Info';
  static const String changePass = 'Change Password';
  static const String changePhone = 'Change Phone';
  static const String logout = 'Logout';
  static const List<String> choices = <String>[
    updateMyInfo,
    changePass,
    changePhone,
    logout
  ];
}

class UserConstants {
  static const String followAccount = 'متابعة';
  static const String banAccount = 'حظر المراسلة';
  static const List<String> choices = <String>[
    followAccount,
    banAccount,
  ];
}

class EngUserConstants {
  static const String followAccount = 'Follow';
  static const String banAccount = 'Ban Messaging';
  static const List<String> choices = <String>[
    followAccount,
    banAccount,
  ];
}

class MyAccount extends StatelessWidget {
  MyAccount({
    Key key,
  }) : super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey10 = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(builder: (context, avatar, child) {

      var mediaQuery = MediaQuery.of(context);
      var provider = Provider.of<LocaleProvider>(context, listen: false);
      var _lang = provider.locale.toString();
      if (_lang != 'en_US') {
        Jiffy.locale('ar');
      } else if (_lang == 'en_US') {
        Jiffy.locale('en');
      }

      void sendEstimate() async {
        Future.delayed(Duration(milliseconds: 0), () {
          Api(_scaffoldKey10).sendEstimateFunc(
              context, avatar.phone, avatar.userPhone, avatar.rating, avatar.commentRating);
        });

        avatar.getAvatarList(context, avatar.userPhone ?? avatar.phone);
        avatar.getUserAdsList(context, avatar.userPhone ?? avatar.phone);
        avatar.getEstimatesInfo(context, avatar.userPhone ?? avatar.phone);
        avatar.getSumEstimatesInfo(context, avatar.userPhone ?? avatar.phone);
        avatar.checkOfficeInfo(context, avatar.userPhone ?? avatar.phone);
        avatar.setUserPhone(avatar.userPhone ?? avatar.phone);

        Future.delayed(Duration(seconds: 0), () {
          Navigator.push(context,
            MaterialPageRoute(builder: (context) => MyAccount()),
          );
        });
      }

      void _showRatingDialog() {
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
            avatar.setRating(response.rating.toString());
            avatar.setCommentRating(response.comment.toString());
            sendEstimate();
          },
        );
        showDialog(
          context: context,
          barrierDismissible: true,
          builder: (context) => _dialog,
        );
      }

      void _callNumber() async {
        if (avatar.estimates.isNotEmpty) {
          for (var i = 0; i < avatar.countEstimates(); i++) {
            if (avatar.estimates[i].phone_user == avatar.phone &&
                avatar.estimates[i].phone_user_estimated == avatar.userPhone) {
              avatar.setCalled();
            }
          }
          if (avatar.called == 1) {
          } else {
            _showRatingDialog();
          }
        } else {
          _showRatingDialog();
        }
        if (avatar.userPhone == avatar.phone) {
          var number = '+${avatar.phone}';
          await FlutterPhoneDirectCaller.callNumber(number);
        } else {
          var number = '+${avatar.userPhone}';
          await FlutterPhoneDirectCaller.callNumber(number);
        }
      }


      Future<void> choiceAction2(String choice) async {
        if (choice == 'متابعة') {
        } else {}
      }

      Future<void> choiceAction(String choice) async {
        if (choice == 'تحديث معلوماتي' || choice == 'Update My Info') {
          await Navigator.push(context,
            MaterialPageRoute(builder: (context) => UpdateMyInformation()),
          );
        } else if (choice == 'تغيير كلمة المرور' || choice == 'Change Password') {
          await Navigator.push(context,
            MaterialPageRoute(builder: (context) => ChangePass()),
          );
        } else if (choice == 'تغيير رقم الجوال' || choice == 'Change Phone') {
          await Navigator.push(context,
            MaterialPageRoute(builder: (context) => ChangePhone()),
          );
        } else {
          await avatar.logout();
          await Fluttertoast.showToast(
              msg: 'تم تسجيل الخروج',
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 15.0);
          await Navigator.push(context,
            MaterialPageRoute(builder: (context) => MainPage()),
          );
        }
      }


      if (avatar.userPhone == avatar.phone) {
        avatar.getUsersList(context, avatar.phone);
        avatar.getUserAdsList(context, avatar.phone);
        //avatar.getEstimatesInfo(context, avatar.phone);
        //avatar.getSumEstimatesInfo(context, avatar.phone);
        //avatar.checkOfficeInfo(context, avatar.phone);
      } else {
        avatar.getAvatarList(context, avatar.userPhone);
        avatar.getUserAdsList(context, avatar.userPhone);
        //avatar.getEstimatesInfo(context, avatar.userPhone);
        //avatar.getSumEstimatesInfo(context, avatar.userPhone);
        //avatar.checkOfficeInfo(context, avatar.userPhone);
      }

      if (avatar.avatars.isEmpty && avatar.userPhone != avatar.phone) {
        avatar.setUserPhone(avatar.userPhone);
        return Center(
            child: AnimatedSplashScreen(
          duration: 300,
          splash: Center(child: CircularProgressIndicator()),
          nextScreen: MyAccount(),
        ));
      } else {
        return Scaffold(
          backgroundColor: const Color(0xffffffff),
          appBar: AppBar(
            toolbarHeight: 80.0,
            leadingWidth: 100,
            leading: Padding(
              padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
              child: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Color(0xffffffff),
                  size: 40,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            title: Text(
              AppLocalizations.of(context).myAccount,
              style: GoogleFonts.tajawal(
                fontSize: 20,
                color: const Color(0xffffffff),
              ),
              textAlign: TextAlign.center,
            ),
            actions: [
              Column(
                children: [
                  if (avatar.userPhone == avatar.phone)
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: PopupMenuButton<String>(
                        icon: Icon(
                          Icons.settings,
                          color: Color(0xffffffff),
                          size: 40,
                        ),
                        onSelected: choiceAction,
                        itemBuilder: (BuildContext context) {
                          if (_lang != 'en_US') {
                            return Constants.choices.map((String choice) {
                              if (choice == Constants.logout) {
                                return PopupMenuItem<String>(
                                  value: choice,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        choice,
                                        style: GoogleFonts.tajawal(
                                          fontSize: 20,
                                          color: const Color(0xffff0000),
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            10, 0, 10, 0),
                                        child: Icon(
                                          Icons.exit_to_app_rounded,
                                          color: Color(0xffff0000),
                                          size: 30,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              } else if (choice == Constants.changePass) {
                                return PopupMenuItem<String>(
                                  value: choice,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        choice,
                                        style: GoogleFonts.tajawal(
                                          fontSize: 20,
                                          color: const Color(0xff989898),
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            10, 0, 10, 0),
                                        child: Icon(
                                          Icons.vpn_key_rounded,
                                          color: Color(0xff989898),
                                          size: 30,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              } else if (choice == Constants.changePhone) {
                                return PopupMenuItem<String>(
                                  value: choice,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        choice,
                                        style: GoogleFonts.tajawal(
                                          fontSize: 20,
                                          color: const Color(0xff989898),
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            10, 0, 10, 0),
                                        child: Icon(
                                          Icons.phone_enabled_rounded,
                                          color: Color(0xff989898),
                                          size: 30,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              } else if (choice == Constants.updateMyInfo) {
                                return PopupMenuItem<String>(
                                  value: choice,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        choice,
                                        style: GoogleFonts.tajawal(
                                          fontSize: 20,
                                          color: const Color(0xff989898),
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            10, 0, 10, 0),
                                        child: Icon(
                                          Icons.person_pin_rounded,
                                          color: Color(0xff989898),
                                          size: 30,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }
                            }).toList();
                          } else {
                            return EngConstants.choices.map((String choice) {
                              if (choice == EngConstants.logout) {
                                return PopupMenuItem<String>(
                                  value: choice,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        choice,
                                        style: GoogleFonts.tajawal(
                                          fontSize: 20,
                                          color: const Color(0xffff0000),
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            10, 0, 10, 0),
                                        child: Icon(
                                          Icons.exit_to_app_rounded,
                                          color: Color(0xffff0000),
                                          size: 30,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              } else if (choice == EngConstants.changePass) {
                                return PopupMenuItem<String>(
                                  value: choice,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        choice,
                                        style: GoogleFonts.tajawal(
                                          fontSize: 20,
                                          color: const Color(0xff989898),
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            10, 0, 10, 0),
                                        child: Icon(
                                          Icons.vpn_key_rounded,
                                          color: Color(0xff989898),
                                          size: 30,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              } else if (choice == EngConstants.changePhone) {
                                return PopupMenuItem<String>(
                                  value: choice,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        choice,
                                        style: GoogleFonts.tajawal(
                                          fontSize: 20,
                                          color: const Color(0xff989898),
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            10, 0, 10, 0),
                                        child: Icon(
                                          Icons.phone_enabled_rounded,
                                          color: Color(0xff989898),
                                          size: 30,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              } else if (choice == EngConstants.updateMyInfo) {
                                return PopupMenuItem<String>(
                                  value: choice,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        choice,
                                        style: GoogleFonts.tajawal(
                                          fontSize: 20,
                                          color: const Color(0xff989898),
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            10, 0, 10, 0),
                                        child: Icon(
                                          Icons.person_pin_rounded,
                                          color: Color(0xff989898),
                                          size: 30,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }
                            }).toList();
                          }
                        },
                      ),
                    )
                  else
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: PopupMenuButton<String>(
                        icon: Icon(
                          Icons.settings,
                          color: Color(0xffffffff),
                          size: 40,
                        ),
                        onSelected: choiceAction2,
                        itemBuilder: (BuildContext context) {
                          if (_lang != 'en_US') {
                            return UserConstants.choices.map((String choice) {
                              if (choice == UserConstants.banAccount) {
                                return PopupMenuItem<String>(
                                  value: choice,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        choice,
                                        style: GoogleFonts.tajawal(
                                          fontSize: 20,
                                          color: const Color(0xffff0000),
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            10, 0, 10, 0),
                                        child: Icon(
                                          Icons.do_disturb_alt_rounded,
                                          color: Color(0xffff0000),
                                          size: 30,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              } else if (choice ==
                                  UserConstants.followAccount) {
                                return PopupMenuItem<String>(
                                  value: choice,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        choice,
                                        style: GoogleFonts.tajawal(
                                          fontSize: 20,
                                          color: const Color(0xff989898),
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            10, 0, 10, 0),
                                        child: Icon(
                                          Icons.person_add,
                                          color: Color(0xff989898),
                                          size: 30,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }
                              {
                                return PopupMenuItem<String>(
                                  value: choice,
                                  child: Row(
                                    children: [
                                      Text(
                                        choice,
                                        style: GoogleFonts.tajawal(
                                          fontSize: 20,
                                          color: const Color(0xff989898),
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                    ],
                                  ),
                                );
                              }
                            }).toList();
                          } else {
                            return EngUserConstants.choices
                                .map((String choice) {
                              if (choice == EngUserConstants.banAccount) {
                                return PopupMenuItem<String>(
                                  value: choice,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        choice,
                                        style: GoogleFonts.tajawal(
                                          fontSize: 20,
                                          color: const Color(0xffff0000),
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            10, 0, 10, 0),
                                        child: Icon(
                                          Icons.do_disturb_alt_rounded,
                                          color: Color(0xffff0000),
                                          size: 30,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              } else if (choice ==
                                  EngUserConstants.followAccount) {
                                return PopupMenuItem<String>(
                                  value: choice,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        choice,
                                        style: GoogleFonts.tajawal(
                                          fontSize: 20,
                                          color: const Color(0xff989898),
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            10, 0, 10, 0),
                                        child: Icon(
                                          Icons.person_add,
                                          color: Color(0xff989898),
                                          size: 30,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }
                              {
                                return PopupMenuItem<String>(
                                  value: choice,
                                  child: Row(
                                    children: [
                                      Text(
                                        choice,
                                        style: GoogleFonts.tajawal(
                                          fontSize: 20,
                                          color: const Color(0xff989898),
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                    ],
                                  ),
                                );
                              }
                            }).toList();
                          }
                        },
                      ),
                    ),
                ],
              )
            ],
            backgroundColor: Color(0xff00cccc),
          ),
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  width: mediaQuery.size.width,
                  height: 250,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      if (avatar.userPhone == avatar.phone)
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      avatar.users.first.image == ''
                                          ? Container(
                                              width: 150.0,
                                              height: 150.0,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                image: DecorationImage(
                                                  image: const AssetImage(
                                                      'assets/images/avatar.png'),
                                                  fit: BoxFit.contain,
                                                ),
                                              ),
                                            )
                                          : Container(
                                              width: 150.0,
                                              height: 150.0,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                image: DecorationImage(
                                                    image: NetworkImage(
                                                        'https://tadawl.com.sa/API/assets/images/avatar/${avatar.users.first.image}'),
                                                    fit: BoxFit.contain),
                                              ),
                                            ),
                                      if (avatar.estimates.isNotEmpty)
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pushNamed(
                                                context, '/main/estimate_user',
                                                arguments: {
                                                  'phone': avatar.userPhone ??
                                                      avatar.phone,
                                                });
                                          },
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        0, 0, 15, 0),
                                                child: Text(
                                                  '(${avatar.countEstimates()})',
                                                  style: GoogleFonts.tajawal(
                                                    fontSize: 10,
                                                    color:
                                                        const Color(0xff989696),
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                              if (avatar
                                                  .sumEstimates.isNotEmpty)
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          0, 0, 0, 0),
                                                  child: RatingBar(
                                                    rating: (double.parse(avatar
                                                                .sumEstimates
                                                                .first
                                                                .sum_estimates) /
                                                            avatar
                                                                .countEstimates())
                                                        .toDouble(),
                                                    icon: Icon(
                                                      Icons.star,
                                                      size: 15,
                                                      color: Colors.grey,
                                                    ),
                                                    starCount: 5,
                                                    spacing: 1.0,
                                                    size: 15,
                                                    isIndicator: true,
                                                    allowHalfRating: true,
                                                    color: Colors.amber,
                                                  ),
                                                )
                                              else
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          0, 0, 0, 0),
                                                  child: RatingBar(
                                                    rating: 3,
                                                    icon: Icon(
                                                      Icons.star,
                                                      size: 15,
                                                      color: Colors.grey,
                                                    ),
                                                    starCount: 5,
                                                    spacing: 1.0,
                                                    size: 15,
                                                    isIndicator: true,
                                                    allowHalfRating: true,
                                                    color: Colors.amber,
                                                  ),
                                                ),
                                            ],
                                          ),
                                        )
                                      else
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pushNamed(
                                                context, '/main/estimate_user',
                                                arguments: {
                                                  'phone': avatar.userPhone ??
                                                      avatar.phone,
                                                });
                                          },
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        0, 0, 15, 0),
                                                child: Text(
                                                  '(0)',
                                                  style: GoogleFonts.tajawal(
                                                    fontSize: 10,
                                                    color:
                                                        const Color(0xff989696),
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        0, 0, 0, 0),
                                                child: RatingBar(
                                                  rating: 3,
                                                  icon: Icon(
                                                    Icons.star,
                                                    size: 15,
                                                    color: Colors.grey,
                                                  ),
                                                  starCount: 5,
                                                  spacing: 1.0,
                                                  size: 15,
                                                  isIndicator: true,
                                                  allowHalfRating: true,
                                                  color: Colors.amber,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            15, 0, 15, 0),
                                        child: Text(
                                          avatar.users.first.username ??
                                              'UserName',
                                          style: GoogleFonts.tajawal(
                                            fontSize: 15,
                                            color: const Color(0xff00cccc),
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                5, 0, 15, 0),
                                            child: Text(
                                              AppLocalizations.of(context)
                                                  .registered,
                                              style: GoogleFonts.tajawal(
                                                fontSize: 15,
                                                color: const Color(0xff989696),
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                15, 0, 15, 0),
                                            child: Text(
                                              DateFormat('yyyy-MM-dd').format(
                                                  DateTime.parse(avatar.users
                                                      .first.timeRegistered)),
                                              style: GoogleFonts.tajawal(
                                                fontSize: 15,
                                                color: const Color(0xff989696),
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                5, 0, 15, 0),
                                            child: Text(
                                              AppLocalizations.of(context)
                                                  .lastSeen,
                                              style: GoogleFonts.tajawal(
                                                fontSize: 15,
                                                color: const Color(0xff989696),
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                          if (avatar.phone != null)
                                            Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        15, 0, 15, 0),
                                                child: Text(
                                                  Jiffy(DateTime.now())
                                                      .fromNow(),
                                                  style: GoogleFonts.tajawal(
                                                    fontSize: 13,
                                                    color:
                                                        const Color(0xff989696),
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ))
                                          else
                                            Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        15, 0, 0, 0),
                                                child: Text(
                                                  Jiffy(DateTime.parse(avatar
                                                                  .users
                                                                  .first
                                                                  .lastActive ??
                                                              '')
                                                          .add(Duration(
                                                              hours: 3)))
                                                      .fromNow(),
                                                  style: GoogleFonts.tajawal(
                                                    fontSize: 15,
                                                    color:
                                                        const Color(0xff989696),
                                                  ),
                                                  textAlign: TextAlign.center,
                                                )),
                                        ],
                                      ),
                                      if (avatar.userPhone != avatar.phone)
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              0, 30, 0, 30),
                                          child: TextButton(
                                            onPressed: _callNumber,
                                            child: Container(
                                              width:
                                                  mediaQuery.size.width * 0.4,
                                              height: 50.0,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                                border: Border.all(
                                                    color:
                                                        const Color(0xff3f9d28),
                                                    width: 1),
                                                color: const Color(0xffffffff),
                                              ),
                                              child: Align(
                                                alignment: Alignment.center,
                                                child: Icon(
                                                  Icons.phone_enabled,
                                                  color: Color(0xff3f9d28),
                                                  size: 40,
                                                ),
                                              ),
                                            ),
                                          ),
                                        )
                                      else
                                        Container(),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      else
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      avatar.avatars.isNotEmpty
                                          ? avatar.avatars.first.image == null
                                              ? Container(
                                                  width: 150.0,
                                                  height: 150.0,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    image: DecorationImage(
                                                      image: const AssetImage(
                                                          'assets/images/avatar.png'),
                                                      fit: BoxFit.contain,
                                                    ),
                                                  ),
                                                )
                                              : Container(
                                                  width: 150.0,
                                                  height: 150.0,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    image: DecorationImage(
                                                        image: NetworkImage(
                                                            'https://tadawl.com.sa/API/assets/images/avatar/${avatar.avatars.first.image}'),
                                                        fit: BoxFit.contain),
                                                  ),
                                                )
                                          : Container(
                                              width: 150.0,
                                              height: 150.0,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                image: DecorationImage(
                                                  image: const AssetImage(
                                                      'assets/images/avatar.png'),
                                                  fit: BoxFit.contain,
                                                ),
                                              ),
                                            ),
                                      if (avatar.estimates.isNotEmpty)
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pushNamed(
                                                context, '/main/estimate_user',
                                                arguments: {
                                                  'phone': avatar.userPhone ??
                                                      avatar.phone,
                                                });
                                          },
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        0, 0, 15, 0),
                                                child: Text(
                                                  '(${avatar.countEstimates()})',
                                                  style: GoogleFonts.tajawal(
                                                    fontSize: 10,
                                                    color:
                                                        const Color(0xff989696),
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                              if (avatar
                                                  .sumEstimates.isNotEmpty)
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          0, 0, 0, 0),
                                                  child: RatingBar(
                                                    rating: (double.parse(avatar
                                                                .sumEstimates
                                                                .first
                                                                .sum_estimates) /
                                                            avatar
                                                                .countEstimates())
                                                        .toDouble(),
                                                    icon: Icon(
                                                      Icons.star,
                                                      size: 15,
                                                      color: Colors.grey,
                                                    ),
                                                    starCount: 5,
                                                    spacing: 1.0,
                                                    size: 15,
                                                    isIndicator: true,
                                                    allowHalfRating: true,
                                                    color: Colors.amber,
                                                  ),
                                                )
                                              else
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          0, 0, 0, 0),
                                                  child: RatingBar(
                                                    rating: 3,
                                                    icon: Icon(
                                                      Icons.star,
                                                      size: 15,
                                                      color: Colors.grey,
                                                    ),
                                                    starCount: 5,
                                                    spacing: 1.0,
                                                    size: 15,
                                                    isIndicator: true,
                                                    allowHalfRating: true,
                                                    color: Colors.amber,
                                                  ),
                                                ),
                                            ],
                                          ),
                                        )
                                      else
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pushNamed(
                                                context, '/main/estimate_user',
                                                arguments: {
                                                  'phone': avatar.userPhone ??
                                                      avatar.phone,
                                                });
                                          },
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        0, 0, 15, 0),
                                                child: Text(
                                                  '(0)',
                                                  style: GoogleFonts.tajawal(
                                                    fontSize: 10,
                                                    color:
                                                        const Color(0xff989696),
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        0, 0, 0, 0),
                                                child: RatingBar(
                                                  rating: 3,
                                                  icon: Icon(
                                                    Icons.star,
                                                    size: 15,
                                                    color: Colors.grey,
                                                  ),
                                                  starCount: 5,
                                                  spacing: 1.0,
                                                  size: 15,
                                                  isIndicator: true,
                                                  allowHalfRating: true,
                                                  color: Colors.amber,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            15, 0, 15, 0),
                                        child: Text(
                                          avatar.avatars.first.username ??
                                              'UserName',
                                          style: GoogleFonts.tajawal(
                                            fontSize: 15,
                                            color: const Color(0xff00cccc),
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                5, 0, 15, 0),
                                            child: Text(
                                              AppLocalizations.of(context)
                                                  .registered,
                                              style: GoogleFonts.tajawal(
                                                fontSize: 15,
                                                color: const Color(0xff989696),
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                15, 0, 15, 0),
                                            child: Text(
                                              DateFormat('yyyy-MM-dd').format(
                                                  DateTime.parse(avatar.avatars
                                                      .first.timeRegistered)),
                                              style: GoogleFonts.tajawal(
                                                fontSize: 15,
                                                color: const Color(0xff989696),
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                5, 0, 15, 0),
                                            child: Text(
                                              AppLocalizations.of(context)
                                                  .lastSeen,
                                              style: GoogleFonts.tajawal(
                                                fontSize: 15,
                                                color: const Color(0xff989696),
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                          if (avatar.phone != null)
                                            Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        15, 0, 15, 0),
                                                child: Text(
                                                  Jiffy(DateTime.now())
                                                      .fromNow(),
                                                  style: GoogleFonts.tajawal(
                                                    fontSize: 13,
                                                    color:
                                                        const Color(0xff989696),
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ))
                                          else
                                            Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        15, 0, 0, 0),
                                                child: Text(
                                                  Jiffy(DateTime.parse(avatar
                                                                  .avatars
                                                                  .first
                                                                  .lastActive ??
                                                              '')
                                                          .add(Duration(
                                                              hours: 3)))
                                                      .fromNow(),
                                                  style: GoogleFonts.tajawal(
                                                    fontSize: 15,
                                                    color:
                                                        const Color(0xff989696),
                                                  ),
                                                  textAlign: TextAlign.center,
                                                )),
                                        ],
                                      ),
                                      if (avatar.userPhone != avatar.phone)
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              0, 30, 0, 30),
                                          child: TextButton(
                                            onPressed: _callNumber,
                                            child: Container(
                                              width:
                                                  mediaQuery.size.width * 0.4,
                                              height: 50.0,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                                border: Border.all(
                                                    color:
                                                        const Color(0xff3f9d28),
                                                    width: 1),
                                                color: const Color(0xffffffff),
                                              ),
                                              child: Align(
                                                alignment: Alignment.center,
                                                child: Icon(
                                                  Icons.phone_enabled,
                                                  color: Color(0xff3f9d28),
                                                  size: 40,
                                                ),
                                              ),
                                            ),
                                          ),
                                        )
                                      else
                                        Container(),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
                SizedBox(
                  width: mediaQuery.size.width,
                  height: avatar.userPhone != avatar.phone ? 200 : 100,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        if (avatar.userPhone != avatar.phone)
                          for (var i = 0; i < avatar.countAvatars(); i++)
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                if (avatar.userPhone != avatar.phone)
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 30, 0, 30),
                                    child: TextButton(
                                      onPressed: () {
                                        avatar.setRecAvatarUserName(avatar.users.first.username);
                                        Navigator.pushNamed(
                                            context, '/main/discussion_main',
                                            arguments: {
                                              'phone_user': avatar.userPhone,
                                            });
                                      },
                                      child: Container(
                                        width: mediaQuery.size.width * 0.6,
                                        height: 50.0,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          border: Border.all(
                                              color: const Color(0xff00cccc),
                                              width: 1),
                                          color: const Color(0xffffffff),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      15, 0, 0, 0),
                                              child: Icon(
                                                Icons.comment_rounded,
                                                color: Color(0xff00cccc),
                                                size: 40,
                                              ),
                                            ),
                                            Text(
                                              AppLocalizations.of(context)
                                                  .sendMess,
                                              style: GoogleFonts.tajawal(
                                                fontSize: 15,
                                                color: const Color(0xff00cccc),
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 0, 20, 0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        AppLocalizations.of(context).aboutMe,
                                        style: GoogleFonts.tajawal(
                                          fontSize: 15,
                                          color: const Color(0xff000000),
                                        ),
                                        textAlign: TextAlign.right,
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 0, 20, 0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        avatar.avatars[i].about ?? '',
                                        style: GoogleFonts.tajawal(
                                          fontSize: 13,
                                          color: const Color(0xff989696),
                                        ),
                                        //textAlign: TextAlign.right,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )
                        else
                          for (var i = 0; i < avatar.countUsers(); i++)
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                if (avatar.userPhone != avatar.phone)
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 30, 0, 30),
                                    child: TextButton(
                                      onPressed: () {
                                        avatar.setRecAvatarUserName(avatar.users.first.username);
                                        Navigator.pushNamed(
                                            context, '/main/discussion_main',
                                            arguments: {
                                              'phone_user': avatar.userPhone,
                                            });
                                      },
                                      child: Container(
                                        width: mediaQuery.size.width * 0.6,
                                        height: 50.0,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          border: Border.all(
                                              color: const Color(0xff00cccc),
                                              width: 1),
                                          color: const Color(0xffffffff),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      15, 0, 0, 0),
                                              child: Icon(
                                                Icons.comment_rounded,
                                                color: Color(0xff00cccc),
                                                size: 40,
                                              ),
                                            ),
                                            Text(
                                              AppLocalizations.of(context)
                                                  .sendMess,
                                              style: GoogleFonts.tajawal(
                                                fontSize: 15,
                                                color: const Color(0xff00cccc),
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 0, 20, 0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        AppLocalizations.of(context).aboutMe,
                                        style: GoogleFonts.tajawal(
                                          fontSize: 15,
                                          color: const Color(0xff000000),
                                        ),
                                        textAlign: TextAlign.right,
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 0, 20, 0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        avatar.users[i].about ?? '',
                                        style: GoogleFonts.tajawal(
                                          fontSize: 13,
                                          color: const Color(0xff989696),
                                        ),
                                        //textAlign: TextAlign.right,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                      ],
                    ),
                  ),
                ),
                if (avatar.offices.isNotEmpty)
                  Column(
                    children: [
                      if (avatar.offices.first.state == '1')
                        Container(
                          width: mediaQuery.size.width * 0.5,
                          height: 50.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(
                                color: const Color(0xff3f9d28), width: 1),
                            color: const Color(0xff3f9d28),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                AppLocalizations.of(context).certifiedOffice,
                                style: GoogleFonts.tajawal(
                                  fontSize: 15,
                                  color: const Color(0xffffffff),
                                ),
                                textAlign: TextAlign.center,
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
                                child: Icon(
                                  Icons.verified,
                                  color: Color(0xffffffff),
                                  size: 40,
                                ),
                              ),
                            ],
                          ),
                        )
                      else if (avatar.offices.first.state == '0')
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                          child: Text(
                            AppLocalizations.of(context).certifiedOfficeAwait,
                            style: GoogleFonts.tajawal(
                              fontSize: 15,
                              color: const Color(0xff989696),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                    ],
                  )
                else
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                        child: Text(
                          AppLocalizations.of(context).member,
                          style: GoogleFonts.tajawal(
                            fontSize: 15,
                            color: const Color(0xff989696),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      if (avatar.userPhone == avatar.phone)
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => OfficesVR()),
                            );
                          },
                          child: Container(
                            width: mediaQuery.size.width * 0.6,
                            height: 40.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(
                                  color: const Color(0xff00cccc), width: 1),
                              color: const Color(0xffffffff),
                            ),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                AppLocalizations.of(context)
                                    .officesAccreditation,
                                style: GoogleFonts.tajawal(
                                  fontSize: 15,
                                  color: const Color(0xff00cccc),
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                if (avatar.userPhone == avatar.phone)
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: Container(
                      width: mediaQuery.size.width,
                      height: 50.0,
                      decoration: BoxDecoration(
                        color: const Color(0xffdddddd),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ToggleButtons(
                            children: <Widget>[
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(50, 5, 50, 5),
                                child: Text(
                                  AppLocalizations.of(context).ads,
                                  style: GoogleFonts.tajawal(
                                    fontSize: 15,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(50, 5, 50, 5),
                                child: Text(
                                  AppLocalizations.of(context).payments,
                                  style: GoogleFonts.tajawal(
                                    fontSize: 15,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                            onPressed: (int index) {
                                avatar.updateSelected(index);
                            },
                            isSelected: avatar.isSelected,
                            color: const Color(0xff8d8d8d),
                            selectedColor: const Color(0xff00cccc),
                            fillColor: const Color(0xffdddddd),
                            borderWidth: 2,
                            borderColor: const Color(0xffdddddd),
                            selectedBorderColor: const Color(0xffdddddd),
                          ),
                        ],
                      ),
                    ),
                  ),
                if ((avatar.userPhone == avatar.phone) && (avatar.selectedNav == 1))
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        '...',
                        style: GoogleFonts.tajawal(
                          fontSize: 15,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                if ((avatar.userPhone == avatar.phone) && (avatar.selectedNav == 0))
                  Column(
                    children: [
                      if (avatar.userAds.isNotEmpty)
                        for (int i = 0; i < avatar.countUserAds(); i++)
                          TextButton(
                            onPressed: () {
                              Provider.of<AdsProvider>(context, listen: false)
                                  .getAdsPageList(
                                      context, avatar.userAds[i].idDescription);
                              Provider.of<AdsProvider>(context, listen: false)
                                  .getImagesAdsPageList(
                                      context, avatar.userAds[i].idDescription);
                              Provider.of<AdsProvider>(context, listen: false)
                                  .getUserAdsPageInfo(
                                      context, avatar.userAds[i].idDescription);
                              Provider.of<AdsProvider>(context, listen: false)
                                  .getAdsVRInfo(
                                      context, avatar.userAds[i].idDescription);
                              Provider.of<AdsProvider>(context, listen: false)
                                  .getBFAdsPageList(
                                      context, avatar.userAds[i].idDescription);
                              Provider.of<AdsProvider>(context, listen: false)
                                  .getQFAdsPageList(
                                      context, avatar.userAds[i].idDescription);
                              Provider.of<AdsProvider>(context, listen: false)
                                  .getViewsChartInfo(
                                      context, avatar.userAds[i].idDescription);
                              Provider.of<AdsProvider>(context, listen: false)
                                  .getNavigationAdsPageList(context);
                              Provider.of<AdsProvider>(context, listen: false)
                                  .setIdDescription(avatar.userAds[i].idDescription);
                              Provider.of<AdsProvider>(context, listen: false).getSimilarAdsList(context, avatar.userAds[i].idCategory, avatar.userAds[i].idDescription);


                              Future.delayed(Duration(seconds: 0), () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                      builder: (context) => AdPage()),
                              );
                              });
                            },
                            child: Container(
                              width: mediaQuery.size.width,
                              height: 150.0,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0xffa6a6a6),
                                    offset: const Offset(
                                      0.0,
                                      0.0,
                                    ),
                                    blurRadius: 7.0,
                                    spreadRadius: 2.0,
                                  ), //BoxShadow
                                  BoxShadow(
                                    color: Colors.white,
                                    offset: const Offset(0.0, 0.0),
                                    blurRadius: 0.0,
                                    spreadRadius: 0.0,
                                  ), //BoxShadow
                                ],
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Stack(children: [
                                    Container(
                                      width: 180.0,
                                      height: 150.0,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                              'https://tadawl.com.sa/API/assets/images/ads/' +
                                                      avatar.userAds[i]
                                                          .ads_image ??
                                                  ''),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(
                                          Provider.of<AdsProvider>(context, listen: false).randdLeft,
                                          Provider.of<AdsProvider>(context, listen: false).randdTop,
                                          5, 5),
                                      child: Opacity(
                                        opacity: 0.7,
                                        child: Container(
                                          width: 50.0,
                                          height: 50.0,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: const NetworkImage(
                                                  'https://tadawl.com.sa/API/assets/images/logo22.png'),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ]),
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      if (avatar.userAds[i].idSpecial == '1')
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              10, 5, 10, 5),
                                          child: Icon(
                                            Icons.verified,
                                            color: Color(0xffe6e600),
                                            size: 30,
                                          ),
                                        ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            10, 5, 10, 5),
                                        child: (
                                            Provider.of<AdsProvider>(context, listen: false).busy == true && Provider.of<AdsProvider>(context, listen: false).number == i)
                                            ? CircularProgressIndicator()
                                            : TextButton(
                                                onPressed: () {
                                                  Provider.of<AdsProvider>(context, listen: false).setNumber(i);
                                                  Provider.of<AdsProvider>(context, listen: false).updateAds(context, avatar.userAds[i].id_ads);
                                                },
                                                child: Container(
                                                  width: mediaQuery.size.width *
                                                      0.15,
                                                  height: 35.0,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5.0),
                                                    border: Border.all(
                                                        width: 1.0,
                                                        color: const Color(
                                                            0xff3f9d28)),
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      AppLocalizations.of(
                                                              context)
                                                          .updateAds,
                                                      style:
                                                          GoogleFonts.tajawal(
                                                        fontSize: 15,
                                                        color: const Color(
                                                            0xff3f9d28),
                                                      ),
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                      ),
                                      if (avatar.userAds[i].video.isNotEmpty)
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              15, 5, 15, 5),
                                          child: Icon(
                                            Icons.videocam_outlined,
                                            color: Color(0xff00cccc),
                                            size: 30,
                                          ),
                                        ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      5, 0, 5, 0),
                                              child: Text(
                                                avatar.userAds[i].title,
                                                style: GoogleFonts.tajawal(
                                                  fontSize: 13,
                                                  color:
                                                      const Color(0xff000000),
                                                ),
                                                textAlign: TextAlign.right,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      0, 0, 0, 0),
                                              child: Text(
                                                avatar.userAds[i].price,
                                                style: GoogleFonts.tajawal(
                                                  fontSize: 15,
                                                  color:
                                                      const Color(0xff00cccc),
                                                ),
                                                // textAlign: TextAlign.right,
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      0, 0, 0, 0),
                                              child: Text(
                                                AppLocalizations.of(context)
                                                    .rial,
                                                style: GoogleFonts.tajawal(
                                                  fontSize: 15,
                                                  color:
                                                      const Color(0xff00cccc),
                                                ),
                                                // textAlign: TextAlign.right,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      5, 0, 15, 0),
                                              child: Text(
                                                avatar.userAds[i].space,
                                                style: GoogleFonts.tajawal(
                                                  fontSize: 15,
                                                  color:
                                                      const Color(0xff000000),
                                                ),
                                                textAlign: TextAlign.right,
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      5, 0, 5, 0),
                                              child: Text(
                                                AppLocalizations.of(context).m2,
                                                style: GoogleFonts.tajawal(
                                                  fontSize: 15,
                                                  color:
                                                      const Color(0xff000000),
                                                ),
                                                textAlign: TextAlign.right,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              5, 0, 10, 0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              if (avatar.userAds[i].ads_city !=
                                                      null ||
                                                  avatar.userAds[i]
                                                          .ads_neighborhood !=
                                                      null)
                                                Text(
                                                  '${avatar.userAds[i].ads_city} - ${avatar.userAds[i].ads_neighborhood}',
                                                  style: GoogleFonts.tajawal(
                                                    fontSize: 8,
                                                    color:
                                                        const Color(0xff000000),
                                                  ),
                                                  textAlign: TextAlign.right,
                                                ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                      else
                        Container(),
                    ],
                  ),
                if (avatar.userPhone != avatar.phone)
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: Container(
                      width: mediaQuery.size.width,
                      height: 50.0,
                      decoration: BoxDecoration(
                        color: const Color(0xffdddddd),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(50, 5, 50, 5),
                            child: Text(
                              AppLocalizations.of(context).ads,
                              style: GoogleFonts.tajawal(
                                fontSize: 15,
                                color: const Color(0xff00cccc),
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                if (avatar.userPhone != avatar.phone)
                  Column(
                    children: [
                      if (avatar.userAds.isNotEmpty)
                        for (int i = 0; i < avatar.countUserAds(); i++)
                          TextButton(
                            onPressed: () {
                              Provider.of<AdsProvider>(context, listen: false)
                                  .getAdsPageList(
                                      context, avatar.userAds[i].idDescription);
                              Provider.of<AdsProvider>(context, listen: false)
                                  .getImagesAdsPageList(
                                      context, avatar.userAds[i].idDescription);
                              Provider.of<AdsProvider>(context, listen: false)
                                  .getUserAdsPageInfo(
                                      context, avatar.userAds[i].idDescription);
                              Provider.of<AdsProvider>(context, listen: false)
                                  .getAdsVRInfo(
                                      context, avatar.userAds[i].idDescription);
                              Provider.of<AdsProvider>(context, listen: false)
                                  .getBFAdsPageList(
                                      context, avatar.userAds[i].idDescription);
                              Provider.of<AdsProvider>(context, listen: false)
                                  .getQFAdsPageList(
                                      context, avatar.userAds[i].idDescription);
                              Provider.of<AdsProvider>(context, listen: false)
                                  .getViewsChartInfo(
                                      context, avatar.userAds[i].idDescription);
                              Provider.of<AdsProvider>(context, listen: false)
                                  .getNavigationAdsPageList(context);
                              Provider.of<AdsProvider>(context, listen: false)
                                  .setIdDescription(avatar.userAds[i].idDescription);
                              Provider.of<AdsProvider>(context, listen: false).getSimilarAdsList(context, avatar.userAds[i].idCategory, avatar.userAds[i].idDescription);

                              Future.delayed(Duration(seconds: 0), () {
                            Navigator.push(
                                 context,
                                  MaterialPageRoute(
                                    builder: (context) => AdPage()),
                               );
                              });
                            },
                            child: Container(
                              width: mediaQuery.size.width,
                              height: 150.0,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0xffa6a6a6),
                                    offset: const Offset(
                                      0.0,
                                      0.0,
                                    ),
                                    blurRadius: 7.0,
                                    spreadRadius: 2.0,
                                  ), //BoxShadow
                                  BoxShadow(
                                    color: Colors.white,
                                    offset: const Offset(0.0, 0.0),
                                    blurRadius: 0.0,
                                    spreadRadius: 0.0,
                                  ), //BoxShadow
                                ],
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Stack(children: [
                                    Container(
                                      width: 180.0,
                                      height: 150.0,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                              'https://tadawl.com.sa/API/assets/images/ads/' +
                                                      avatar.userAds[i]
                                                          .ads_image ??
                                                  ''),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(
                                          Provider.of<AdsProvider>(context, listen: false).randdLeft,
                                          Provider.of<AdsProvider>(context, listen: false).randdTop,
                                          5, 5),
                                      child: Opacity(
                                        opacity: 0.7,
                                        child: Container(
                                          width: 50.0,
                                          height: 50.0,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: const NetworkImage(
                                                  'https://tadawl.com.sa/API/assets/images/logo22.png'),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ]),
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            if (avatar.userAds[i].idSpecial ==
                                                '1')
                                              Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        5, 0, 10, 0),
                                                child: Icon(
                                                  Icons.verified,
                                                  color: Color(0xffe6e600),
                                                  size: 30,
                                                ),
                                              ),
                                            Text(
                                              avatar.userAds[i].title,
                                              style: GoogleFonts.tajawal(
                                                fontSize: 20,
                                                color: const Color(0xff000000),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              avatar.userAds[i].price,
                                              style: GoogleFonts.tajawal(
                                                fontSize: 15,
                                                color: const Color(0xff00cccc),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      0, 0, 5, 0),
                                              child: Text(
                                                AppLocalizations.of(context)
                                                    .rial,
                                                style: GoogleFonts.tajawal(
                                                  fontSize: 15,
                                                  color:
                                                      const Color(0xff00cccc),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              avatar.userAds[i].space,
                                              style: GoogleFonts.tajawal(
                                                fontSize: 15,
                                                color: const Color(0xff000000),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      0, 0, 5, 0),
                                              child: Text(
                                                AppLocalizations.of(context).m2,
                                                style: GoogleFonts.tajawal(
                                                  fontSize: 15,
                                                  color:
                                                      const Color(0xff000000),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              5, 0, 10, 0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              if (avatar
                                                  .userAds[i].video.isNotEmpty)
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          0, 0, 5, 0),
                                                  child: Icon(
                                                    Icons.videocam_outlined,
                                                    color: Color(0xff00cccc),
                                                    size: 30,
                                                  ),
                                                ),
                                              if (avatar.userAds[i].ads_city !=
                                                      null ||
                                                  avatar.userAds[i]
                                                          .ads_neighborhood !=
                                                      null)
                                                Text(
                                                  '${avatar.userAds[i].ads_city} - ${avatar.userAds[i].ads_neighborhood}',
                                                  style: GoogleFonts.tajawal(
                                                    fontSize: 8,
                                                    color:
                                                        const Color(0xff000000),
                                                  ),
                                                  textAlign: TextAlign.right,
                                                ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                      else
                        Container(),
                    ],
                  ),
              ],
            ),
          ),
        );
      }
    });
  }
}
