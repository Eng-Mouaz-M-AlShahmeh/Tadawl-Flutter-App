/*
Developed by: Eng Mouaz M. Al-Shahmeh
*/
import 'dart:async';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tadawl_app/provider/ads_provider.dart';
import 'package:tadawl_app/provider/locale_provider.dart';
import 'package:tadawl_app/provider/user_provider.dart';
import 'package:tadawl_app/screens/ads/advertising_fee.dart';
import 'package:tadawl_app/screens/general/terms_of_use.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:pinch_zoom_image_last/pinch_zoom_image_last.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:chewie/chewie.dart';

class Constants {
  static const String fromStudio = 'من الاستديو';
  static const String fromCamera = 'من الكاميرا';
  static const List<String> choices = <String>[fromStudio, fromCamera];
}

class EngConstants {
  static const String fromStudio = 'From Studio';
  static const String fromCamera = 'From Camera';
  static const List<String> choices = <String>[fromStudio, fromCamera];
}

class AddAds extends StatelessWidget {
  AddAds({
    Key key,
  }) : super(key: key);

  final GlobalKey<FormState> _addAdsKey = GlobalKey<FormState>();

  /*
  Future<void> choiceAction(String choice) async {
    if (choice == 'من الاستديو' || choice == 'From Studio') {
      await addAds.getGalleryVideo(context);
    } else if (choice == 'من الكاميرا' || choice == 'From Camera') {
      await addAds.getCameraVideo();
    }
  }
  */

  @override
  Widget build(BuildContext context) {
    return Consumer<AdsProvider>(builder: (context, addAds, child) {
      var mediaQuery = MediaQuery.of(context);
      addAds.setInitSelectionsAddAds();

      // ignore: missing_return
      Future<bool> _onBackPressed() {
        if (addAds.currentStageAddAds == 1) {
          return showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text(
                    'إلغاء نشر الإعلان',
                    style: GoogleFonts.tajawal(
                      fontSize: 20,
                      color: const Color(0xff00cccc),
                    ),
                    textAlign: TextAlign.right,
                  ),
                  content: Text(
                    'هل تريد إلغاء نشر الإعلان، بموافقتك سوف تفقد أية معلومات متعلقة بالإعلان؟',
                    style: GoogleFonts.tajawal(
                      fontSize: 15,
                      color: const Color(0xff000000),
                    ),
                    textAlign: TextAlign.right,
                  ),
                  actions: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
                      child: GestureDetector(
                        onTap: () {
                          addAds.clearChacheAddAds();
                          Navigator.of(context).pop(true);
                        },
                        child: Text(
                          'نعم',
                          style: GoogleFonts.tajawal(
                            fontSize: 15,
                            color: const Color(0xff000000),
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
                      child: GestureDetector(
                        onTap: () => Navigator.of(context).pop(false),
                        child: Text(
                          'لا',
                          style: GoogleFonts.tajawal(
                            fontSize: 15,
                            color: const Color(0xff000000),
                          ),
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ),
                  ],
                ),
              ) ??
              false;
        } else if (addAds.currentStageAddAds != 1) {
          addAds.setCurrentStageBackAddAds();
        }
      }

      Future<bool> _onInterfaceCheck() {
        return showDialog(
              context: context,
              builder: (context) => AlertDialog(
                content: Text(
                  AppLocalizations.of(context).reqInterface,
                  style: GoogleFonts.tajawal(
                    fontSize: 17,
                    color: const Color(0xff000000),
                  ),
                  textAlign: TextAlign.right,
                ),
                actions: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
                    child: GestureDetector(
                      onTap: () => Navigator.of(context).pop(false),
                      child: Text(
                        AppLocalizations.of(context).accept,
                        style: GoogleFonts.tajawal(
                          fontSize: 17,
                          color: const Color(0xff00cccc),
                        ),
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ),
                ],
              ),
            ) ??
            false;
      }

      Future<bool> _onLocationContinue() {
        return showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text(
                  AppLocalizations.of(context).confirmLocationPlace,
                  style: GoogleFonts.tajawal(
                    fontSize: 20,
                    color: const Color(0xff00cccc),
                  ),
                  textAlign: TextAlign.right,
                ),
                content: Text(
                  AppLocalizations.of(context).reLocationIn +
                      ' ( ${addAds.ads_neighborhoodAddAds} ) ',
                  style: GoogleFonts.tajawal(
                    fontSize: 17,
                    color: const Color(0xff000000),
                  ),
                  textAlign: TextAlign.right,
                ),
                actions: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop(false);
                        addAds.setCurrentStageAddAds(5);
                      },
                      child: Text(
                        AppLocalizations.of(context).yes,
                        style: GoogleFonts.tajawal(
                          fontSize: 17,
                          color: const Color(0xff000000),
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  //SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
                    child: GestureDetector(
                      onTap: () => Navigator.of(context).pop(false),
                      child: Text(
                        AppLocalizations.of(context).no,
                        style: GoogleFonts.tajawal(
                          fontSize: 17,
                          color: const Color(0xff000000),
                        ),
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ),
                ],
              ),
            ) ??
            false;
      }

      Future<bool> _onVidPressed() {
        return showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text(
                  AppLocalizations.of(context).addVed,
                  style: GoogleFonts.tajawal(
                    fontSize: 20,
                    color: const Color(0xff00cccc),
                  ),
                  textAlign: TextAlign.right,
                ),
                content: Text(
                  AppLocalizations.of(context).vidHint,
                  style: GoogleFonts.tajawal(
                    fontSize: 17,
                    color: const Color(0xff000000),
                  ),
                  textAlign: TextAlign.right,
                ),
                actions: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
                    child: GestureDetector(
                      onTap: () {
                        addAds.getCameraVideo(context);
                        Navigator.of(context).pop(false);
                      },
                      child: Text(
                        AppLocalizations.of(context).fromCamera,
                        style: GoogleFonts.tajawal(
                          fontSize: 13,
                          color: const Color(0xff000000),
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
                    child: GestureDetector(
                      onTap: () {
                        addAds.getGalleryVideo(context);
                        Navigator.of(context).pop(false);
                      },
                      child: Text(
                        AppLocalizations.of(context).fromGallery,
                        style: GoogleFonts.tajawal(
                          fontSize: 13,
                          color: const Color(0xff000000),
                        ),
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ),
                ],
              ),
            ) ??
            false;
      }

      void _onMapCreated(GoogleMapController controller) {
        controller.setMapStyle(Utils.mapStyle);
      }

      Provider.of<UserProvider>(context, listen: false).getSession();
      Provider.of<UserProvider>(context, listen: false).getLoc();

      var provider = Provider.of<LocaleProvider>(context, listen: false);
      var _lang = provider.locale.toString();

      return WillPopScope(
        onWillPop: _onBackPressed,
        child: Scaffold(
          backgroundColor: const Color(0xffffffff),
          body: SingleChildScrollView(
            physics: addAds.currentStageAddAds == 4
                ? NeverScrollableScrollPhysics()
                : ScrollPhysics(),
            child: Form(
              key: _addAdsKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  if (addAds.currentStageAddAds == null)
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Stack(
                              children: <Widget>[
                                Container(
                                  width: mediaQuery.size.width,
                                  height: 100.0,
                                  decoration: BoxDecoration(
                                    color: const Color(0xff00cccc),
                                  ),
                                  child: Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              30, 0, 30, 10),
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
                                        Text(
                                          AppLocalizations.of(context)
                                              .addAdsCond,
                                          style: GoogleFonts.tajawal(
                                            fontSize: 20,
                                            color: const Color(0xffffffff),
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Flexible(
                                child: Text(
                                  AppLocalizations.of(context).rule26,
                                  style: GoogleFonts.tajawal(
                                    fontSize: 20,
                                    color: const Color(0xff8d8d8d),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            addAds.setCurrentStageAddAds(1);
                          },
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 30, 0, 30),
                            child: Container(
                              width: mediaQuery.size.width * 0.6,
                              height: 40.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                color: const Color(0xffffffff),
                                border: Border.all(
                                    width: 1.0, color: const Color(0xff3f9d28)),
                              ),
                              child: Center(
                                child: Text(
                                  AppLocalizations.of(context).accept,
                                  style: GoogleFonts.tajawal(
                                    fontSize: 15,
                                    color: const Color(0xff3f9d28),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  //......end null conditions screen..................
                  if (addAds.currentStageAddAds == 1)
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Stack(
                              children: <Widget>[
                                Container(
                                  width: mediaQuery.size.width,
                                  height: 100.0,
                                  decoration: BoxDecoration(
                                    color: const Color(0xff00cccc),
                                  ),
                                  child: Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              30, 0, 30, 10),
                                          child: IconButton(
                                            icon: Icon(
                                              Icons.arrow_back_ios,
                                              color: Color(0xffffffff),
                                              size: 40,
                                            ),
                                            onPressed: () {
                                              addAds
                                                  .setCurrentStageAddAds(null);
                                            },
                                          ),
                                        ),
                                        Text(
                                          AppLocalizations.of(context)
                                              .chooseCategory,
                                          style: GoogleFonts.tajawal(
                                            fontSize: 20,
                                            color: const Color(0xffffffff),
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        if (addAds.categoryAddAds.isNotEmpty)
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              children: [
                                for (int i = 0;
                                    i < addAds.categoryAddAds.length;
                                    i++)
                                  if ('${addAds.id_category_finalAddAds}' ==
                                      addAds.categoryAddAds[i].id_category)
                                    TextButton(
                                      onPressed: () {
                                        addAds.updateCategoryDetailsAddAds(
                                            int.parse(addAds
                                                .categoryAddAds[i].id_category),
                                            addAds.categoryAddAds[i].name);
                                        addAds.setCurrentStageAddAds(2);
                                      },
                                      child: Container(
                                        width: mediaQuery.size.width,
                                        height: 70,
                                        decoration: BoxDecoration(
                                          color: Color(0xff00cccc),
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(15),
                                              topRight: Radius.circular(15),
                                              bottomLeft: Radius.circular(15),
                                              bottomRight: Radius.circular(15)),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                _lang != 'en_US'
                                                    ? addAds
                                                        .categoryAddAds[i].name
                                                    : addAds.categoryAddAds[i]
                                                        .en_name,
                                                style: GoogleFonts.tajawal(
                                                  fontSize: 15,
                                                  color: Colors.grey[200],
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                              Icon(
                                                Icons.arrow_forward_ios,
                                                color: Colors.grey[200],
                                                size: 30,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    )
                                  else
                                    TextButton(
                                      onPressed: () {
                                        addAds.updateCategoryDetailsAddAds(
                                            int.parse(addAds
                                                .categoryAddAds[i].id_category),
                                            addAds.categoryAddAds[i].name);
                                        addAds.setCurrentStageAddAds(2);
                                      },
                                      child: Container(
                                        width: mediaQuery.size.width,
                                        height: 70,
                                        decoration: BoxDecoration(
                                          color: Colors.grey[200],
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(15),
                                              topRight: Radius.circular(15),
                                              bottomLeft: Radius.circular(15),
                                              bottomRight: Radius.circular(15)),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                _lang != 'en_US'
                                                    ? addAds
                                                        .categoryAddAds[i].name
                                                    : addAds.categoryAddAds[i]
                                                        .en_name,
                                                style: GoogleFonts.tajawal(
                                                  fontSize: 15,
                                                  color:
                                                      const Color(0xff00cccc),
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                              Icon(
                                                Icons.arrow_forward_ios,
                                                color: Color(0xff00cccc),
                                                size: 30,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                              ],
                            ),
                          )
                        else
                          Container(),
                      ],
                    ),
                  //...........end 1 category screen.............
                  if (addAds.currentStageAddAds == 2)
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Stack(
                              children: <Widget>[
                                Container(
                                  width: mediaQuery.size.width,
                                  height: 100.0,
                                  decoration: BoxDecoration(
                                    color: const Color(0xff00cccc),
                                  ),
                                  child: Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              30, 0, 30, 10),
                                          child: IconButton(
                                            icon: Icon(
                                              Icons.arrow_back_ios,
                                              color: Color(0xffffffff),
                                              size: 40,
                                            ),
                                            onPressed: () {
                                              addAds.setCurrentStageAddAds(1);
                                            },
                                          ),
                                        ),
                                        Text(
                                          AppLocalizations.of(context).advFees,
                                          style: GoogleFonts.tajawal(
                                            fontSize: 20,
                                            color: const Color(0xffffffff),
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Expanded(
                                child: Text(
                                  AppLocalizations.of(context).title1,
                                  style: GoogleFonts.tajawal(
                                    fontSize: 20,
                                    color: const Color(0xff000000),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                AppLocalizations.of(context).rule27,
                                style: GoogleFonts.tajawal(
                                  fontSize: 15,
                                  color: const Color(0xff8d8d8d),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Expanded(
                                child: Text(
                                  AppLocalizations.of(context).title2,
                                  style: GoogleFonts.tajawal(
                                    fontSize: 20,
                                    color: const Color(0xff000000),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Expanded(
                                child: Text(
                                  AppLocalizations.of(context).rule28,
                                  style: GoogleFonts.tajawal(
                                    fontSize: 15,
                                    color: const Color(0xff8d8d8d),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Expanded(
                                child: Text(
                                  AppLocalizations.of(context).rule29,
                                  style: GoogleFonts.tajawal(
                                    fontSize: 13,
                                    color: const Color(0xff8d8d8d),
                                  ),
                                  textAlign: _lang != 'en_US'
                                      ? TextAlign.right
                                      : TextAlign.left,
                                  textDirection: _lang != 'en_US'
                                      ? TextDirection.rtl
                                      : TextDirection.ltr,
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => AdvertisingFee()),
                                  );
                                },
                                child: Text(
                                  AppLocalizations.of(context).advFees,
                                  style: GoogleFonts.tajawal(
                                    fontSize: 13,
                                    color: const Color(0xff0000ff),
                                  ),
                                  textAlign: _lang != 'en_US'
                                      ? TextAlign.right
                                      : TextAlign.left,
                                  textDirection: _lang != 'en_US'
                                      ? TextDirection.rtl
                                      : TextDirection.ltr,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                AppLocalizations.of(context).marketingSolution,
                                style: GoogleFonts.tajawal(
                                  fontSize: 20,
                                  color: const Color(0xff000000),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Expanded(
                                child: Text(
                                  AppLocalizations.of(context).contactEmail,
                                  style: GoogleFonts.tajawal(
                                    fontSize: 15,
                                    color: const Color(0xff8d8d8d),
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  launch(_emailLaunchUri.toString());
                                },
                                child: Text(
                                  'support@tadawl.com.sa',
                                  style: GoogleFonts.tajawal(
                                    fontSize: 15,
                                    color: const Color(0xff8d8d8d),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                AppLocalizations.of(context).explanatoryPoints,
                                style: GoogleFonts.tajawal(
                                  fontSize: 20,
                                  color: const Color(0xff000000),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Flexible(
                                child: Text(
                                  AppLocalizations.of(context).rule30,
                                  style: GoogleFonts.tajawal(
                                    fontSize: 15,
                                    color: const Color(0xff8d8d8d),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            if (!_addAdsKey.currentState.validate()) {
                              return;
                            }
                            _addAdsKey.currentState.save();
                            addAds.setCurrentStageAddAds(3);
                          },
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 30, 0, 30),
                            child: Container(
                              width: mediaQuery.size.width * 0.6,
                              height: 40.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                color: const Color(0xffffffff),
                                border: Border.all(
                                    width: 1.0, color: const Color(0xff00cccc)),
                              ),
                              child: Center(
                                child: Text(
                                  AppLocalizations.of(context).rule31,
                                  style: GoogleFonts.tajawal(
                                    fontSize: 15,
                                    color: const Color(0xff00cccc),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  //...........end 2  advertising fees screen.............
                  if (addAds.currentStageAddAds == 3)
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Stack(
                              children: <Widget>[
                                Container(
                                  width: mediaQuery.size.width,
                                  height: 100.0,
                                  decoration: BoxDecoration(
                                    color: const Color(0xff00cccc),
                                  ),
                                  child: Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              30, 0, 30, 10),
                                          child: IconButton(
                                            icon: Icon(
                                              Icons.arrow_back_ios,
                                              color: Color(0xffffffff),
                                              size: 40,
                                            ),
                                            onPressed: () {
                                              addAds.setCurrentStageAddAds(2);
                                            },
                                          ),
                                        ),
                                        Text(
                                          AppLocalizations.of(context).images,
                                          style: GoogleFonts.tajawal(
                                            fontSize: 20,
                                            color: const Color(0xffffffff),
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        addAds.imagesListAddAds.isNotEmpty
                            ? Container(
                                width: MediaQuery.of(context).size.width,
                                height:
                                    MediaQuery.of(context).size.height * 0.4,
                                child: Stack(
                                  children: [
                                    Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.4,
                                        child: PageView.builder(
                                          itemCount:
                                              addAds.imagesListAddAds.length,
                                          itemBuilder: (context, position) {
                                            return Stack(
                                              children: [
                                                PinchZoomImage(
                                                  image: Image.file(
                                                    addAds.imagesListAddAds[
                                                            position] ??
                                                        '',
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.4,
                                                    fit: BoxFit.cover,
                                                  ),
                                                  zoomedBackgroundColor:
                                                      Color.fromRGBO(
                                                          240, 240, 240, 1.0),
                                                  hideStatusBarWhileZooming:
                                                      true,
                                                  onZoomStart: () {},
                                                  onZoomEnd: () {},
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.fromLTRB(
                                                      addAds.randdLeft,
                                                      addAds.randdTop,
                                                      5,
                                                      5),
                                                  child: Opacity(
                                                    opacity: 0.7,
                                                    child: Container(
                                                      width: 60.0,
                                                      height: 60.0,
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
                                              ],
                                            );
                                          },
                                          onPageChanged: (index) {
                                            addAds
                                                .setCurrentControllerPageAddAds(
                                                    index);
                                            addAds.randomPosition(200);
                                          },
                                          controller: addAds.controllerAddAds,
                                        )),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        height: 30,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            if (addAds.imagesListAddAds.length <
                                                10)
                                              InkWell(
                                                onTap: () {
                                                  addAds.getImagesAddAds(context);
                                                },
                                                child: Container(
                                                  padding: EdgeInsets.all(4),
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color:
                                                              Colors.blueGrey,
                                                          width: 1),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              6)),
                                                  child: Center(
                                                    child: Row(
                                                      children: [
                                                        Icon(
                                                          Icons.add,
                                                          color:
                                                              Colors.blueGrey,
                                                          size: 20,
                                                        ),
                                                        SizedBox(
                                                          width: 4,
                                                        ),
                                                        Text(
                                                          AppLocalizations.of(
                                                                  context)
                                                              .addImages,
                                                          style: GoogleFonts
                                                              .tajawal(
                                                                  fontSize: 10,
                                                                  color: Colors
                                                                      .blueGrey),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            InkWell(
                                              onTap: () {
                                                addAds.removeImageAddAds();
                                              },
                                              child: Container(
                                                alignment: Alignment.center,
                                                width: 30,
                                                height: 30,
                                                decoration: BoxDecoration(
                                                    color: Colors.blueGrey,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30)),
                                                child: Center(
                                                  child: Icon(
                                                    Icons.close,
                                                    color: Colors.white,
                                                    size: 25,
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.bottomRight,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                            height: 19,
                                            child: ListView.builder(
                                              scrollDirection: Axis.horizontal,
                                              itemBuilder:
                                                  (context, indexListView) {
                                                return Padding(
                                                  padding:
                                                      const EdgeInsets.all(4),
                                                  child: Container(
                                                    width: 10,
                                                    height: 10,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(30),
                                                        color: addAds
                                                                    .currentControllerPageAddAds ==
                                                                indexListView
                                                            ? Color(0xff00cccc)
                                                            : Colors.grey),
                                                  ),
                                                );
                                              },
                                              itemCount: addAds
                                                  .imagesListAddAds.length,
                                            )),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : Container(
                                alignment: Alignment.center,
                                child: Container(
                                  child: Center(
                                    child: InkWell(
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 15, 0, 15),
                                        child: Container(
                                          width: mediaQuery.size.width * 0.6,
                                          height: 40.0,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                            color: const Color(0xffffffff),
                                            border: Border.all(
                                                width: 1.0,
                                                color: const Color(0xff00cccc)),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              Text(
                                                AppLocalizations.of(context)
                                                    .uplaodImages,
                                                style: GoogleFonts.tajawal(
                                                  fontSize: 15,
                                                  color:
                                                      const Color(0xff00cccc),
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        15, 0, 0, 0),
                                                child: Icon(
                                                  Icons.camera_alt_rounded,
                                                  color: Color(0xff00cccc),
                                                  size: 30,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      onTap: () {
                                        addAds.getImagesAddAds(context);
                                      },
                                    ),
                                  ),
                                ),
                              ),
                        if (addAds.videoAddAds != null)
                          SizedBox(
                            width: mediaQuery.size.width * 0.9,
                            height: 500,
                            child: AspectRatio(
                              aspectRatio: addAds.chewieControllerAddAds
                                  .videoPlayerController.value.aspectRatio,
                              child: Stack(
                                children: [
                                  Column(
                                    children: <Widget>[
                                      Expanded(
                                        child: Center(
                                          child: addAds.chewieControllerAddAds !=
                                                      null &&
                                                  addAds
                                                      .chewieControllerAddAds
                                                      .videoPlayerController
                                                      .value
                                                      .initialized
                                              ? Chewie(
                                                  controller: addAds
                                                      .chewieControllerAddAds,
                                                )
                                              : Container(),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        5, 20, 250, 5),
                                    child: TextButton(
                                      child: Icon(
                                        Icons.delete_forever_rounded,
                                        color: Color(0xffff0000),
                                        size: 40,
                                      ),
                                      onPressed: () {
                                        addAds.removeVideoAddAds();
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(5, 5, 5, 5),
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
                                ],
                              ),
                            ),
                          ),
                        addAds.videoAddAds != null
                            ? Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(0, 15, 0, 15),
                                child: Container(
                                  width: mediaQuery.size.width * 0.6,
                                  height: 40.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.0),
                                    color: const Color(0xffffffff),
                                    border: Border.all(
                                        width: 1.0,
                                        color: const Color(0xff818181)),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        AppLocalizations.of(context).addVed,
                                        style: GoogleFonts.tajawal(
                                          fontSize: 15,
                                          color: const Color(0xff818181),
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            15, 0, 0, 0),
                                        child: Icon(
                                          Icons.videocam_rounded,
                                          color: Color(0xff818181),
                                          size: 30,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            : TextButton(
                                onPressed: _onVidPressed,
                                child: Container(
                                  width: mediaQuery.size.width * 0.6,
                                  height: 40.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.0),
                                    color: const Color(0xffffffff),
                                    border: Border.all(
                                        width: 1.0,
                                        color: const Color(0xff00cccc)),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        AppLocalizations.of(context).addVed,
                                        style: GoogleFonts.tajawal(
                                          fontSize: 15,
                                          color: const Color(0xff00cccc),
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            15, 0, 0, 0),
                                        child: Icon(
                                          Icons.videocam_rounded,
                                          color: Color(0xff00cccc),
                                          size: 30,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                        TextButton(
                          onPressed: () {
                            if (!_addAdsKey.currentState.validate()) {
                              return;
                            }
                            _addAdsKey.currentState.save();
                            if (addAds.videoAddAds != null) {
                              addAds.stopVideoAddAds();
                            }
                            addAds.setCurrentStageAddAds(4);
                          },
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 15, 0, 30),
                            child: Container(
                              width: mediaQuery.size.width * 0.6,
                              height: 40.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                color: const Color(0xffffffff),
                                border: Border.all(
                                    width: 1.0, color: const Color(0xff3f9d28)),
                              ),
                              child: Center(
                                child: Text(
                                  AppLocalizations.of(context).continuee,
                                  style: GoogleFonts.tajawal(
                                    fontSize: 15,
                                    color: const Color(0xff3f9d28),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 20, 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Expanded(
                                child: Text(
                                  AppLocalizations.of(context).rule32,
                                  style: GoogleFonts.tajawal(
                                    fontSize: 15,
                                    color: const Color(0xff8d8d8d),
                                  ),
                                  textAlign: _lang != 'en_US'
                                      ? TextAlign.right
                                      : TextAlign.left,
                                  textDirection: _lang != 'en_US'
                                      ? TextDirection.rtl
                                      : TextDirection.ltr,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  //...........end 3 images video screen.............
                  if (addAds.currentStageAddAds == 4)
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Stack(
                              children: <Widget>[
                                Container(
                                  width: mediaQuery.size.width,
                                  height: 100.0,
                                  decoration: BoxDecoration(
                                    color: const Color(0xff00cccc),
                                  ),
                                  child: Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              30, 0, 30, 10),
                                          child: IconButton(
                                            icon: Icon(
                                              Icons.arrow_back_ios,
                                              color: Color(0xffffffff),
                                              size: 40,
                                            ),
                                            onPressed: () {
                                              addAds.setCurrentStageAddAds(3);
                                            },
                                          ),
                                        ),
                                        Text(
                                          AppLocalizations.of(context)
                                              .chooseLocation,
                                          style: GoogleFonts.tajawal(
                                            fontSize: 20,
                                            color: const Color(0xffffffff),
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 15, 10, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              addAds.ads_cityAddAds == null
                                  ? Text(
                                      AppLocalizations.of(context).city,
                                      style: GoogleFonts.tajawal(
                                        fontSize: 13,
                                        color: const Color(0xff989696),
                                      ),
                                      textAlign: TextAlign.center,
                                      textDirection: TextDirection.rtl,
                                    )
                                  : Text(
                                      AppLocalizations.of(context).city +
                                          '${addAds.ads_cityAddAds}',
                                      style: GoogleFonts.tajawal(
                                        fontSize: 13,
                                        color: const Color(0xff989696),
                                      ),
                                      textAlign: TextAlign.center,
                                      textDirection: TextDirection.rtl,
                                    ),
                              addAds.ads_neighborhoodAddAds == null
                                  ? Text(
                                      AppLocalizations.of(context).neighborhood,
                                      style: GoogleFonts.tajawal(
                                        fontSize: 13,
                                        color: const Color(0xff989696),
                                      ),
                                      textAlign: TextAlign.center,
                                      textDirection: TextDirection.rtl,
                                    )
                                  : Text(
                                      AppLocalizations.of(context)
                                              .neighborhood +
                                          ' ${addAds.ads_neighborhoodAddAds}',
                                      style: GoogleFonts.tajawal(
                                        fontSize: 13,
                                        color: const Color(0xff989696),
                                      ),
                                      textAlign: TextAlign.center,
                                      textDirection: TextDirection.rtl,
                                    ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 400,
                          child: Stack(
                            children: [
                              GoogleMap(
                                      myLocationButtonEnabled: true,
                                      zoomGesturesEnabled: true,
                                      zoomControlsEnabled: true,
                                      scrollGesturesEnabled: true,
                                      rotateGesturesEnabled: true,
                                      myLocationEnabled: true,
                                      mapType: MapType.normal,
                                      initialCameraPosition: CameraPosition(
                                          target: addAds.customCameraPositionAddAds ??
                                              addAds.initialCameraPosition,
                                          zoom: 13),
                                      onMapCreated: _onMapCreated,
                                      onCameraMove: (CameraPosition position) {
                                        addAds.handleCameraMoveAddAds(position);
                                      },
                                    ),
                              Center(
                                child: Icon(
                                  Icons.my_location_rounded,
                                  color: Color(0xff00cccc),
                                  size: 25,
                                ),
                              ),
                            ],
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            if (addAds.ads_cordinatesAddAds == null) {
                              Fluttertoast.showToast(
                                  msg:
                                      'حرك الخريطة للوصول لموقع العقار المطلوب',
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 15.0);
                            } else {
                              if (!_addAdsKey.currentState.validate()) {
                                return;
                              }
                              _addAdsKey.currentState.save();
                              _onLocationContinue();
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
                            child: Container(
                              width: mediaQuery.size.width * 0.6,
                              height: 40.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                color: const Color(0xffffffff),
                                border: Border.all(
                                    width: 1.0, color: const Color(0xff3f9d28)),
                              ),
                              child: Center(
                                child: Text(
                                  AppLocalizations.of(context).continuee,
                                  style: GoogleFonts.tajawal(
                                    fontSize: 15,
                                    color: const Color(0xff3f9d28),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  //...........end 4 location screen.............
                  if (addAds.currentStageAddAds == 5)
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Stack(
                              children: <Widget>[
                                Container(
                                  width: mediaQuery.size.width,
                                  height: 100.0,
                                  decoration: BoxDecoration(
                                    color: const Color(0xff00cccc),
                                  ),
                                  child: Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              30, 0, 30, 10),
                                          child: IconButton(
                                            icon: Icon(
                                              Icons.arrow_back_ios,
                                              color: Color(0xffffffff),
                                              size: 40,
                                            ),
                                            onPressed: () {
                                              addAds.setCurrentStageAddAds(4);
                                            },
                                          ),
                                        ),
                                        Text(
                                          AppLocalizations.of(context)
                                              .addAdsDetails,
                                          style: GoogleFonts.tajawal(
                                            fontSize: 20,
                                            color: const Color(0xffffffff),
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
//...............................
                        if (addAds.id_category_finalAddAds == 1 ||
                            addAds.id_category_finalAddAds == 2 ||
                            addAds.id_category_finalAddAds == 3 ||
                            addAds.id_category_finalAddAds == 4 ||
                            addAds.id_category_finalAddAds == 5 ||
                            addAds.id_category_finalAddAds == 6 ||
                            addAds.id_category_finalAddAds == 7 ||
                            addAds.id_category_finalAddAds == 8 ||
                            addAds.id_category_finalAddAds == 9 ||
                            addAds.id_category_finalAddAds == 10 ||
                            addAds.id_category_finalAddAds == 11 ||
                            addAds.id_category_finalAddAds == 12 ||
                            addAds.id_category_finalAddAds == 13 ||
                            addAds.id_category_finalAddAds == 14 ||
                            addAds.id_category_finalAddAds == 15 ||
                            addAds.id_category_finalAddAds == 16 ||
                            addAds.id_category_finalAddAds == 17 ||
                            addAds.id_category_finalAddAds == 18 ||
                            addAds.id_category_finalAddAds == 19 ||
                            addAds.id_category_finalAddAds == 20 ||
                            addAds.id_category_finalAddAds == 21)
                          //    toggle .............. 4 ......................
                          Column(
                            children: [
                              if (addAds.id_category_finalAddAds == 1 ||
                                  addAds.id_category_finalAddAds == 2 ||
                                  addAds.id_category_finalAddAds == 3 ||
                                  addAds.id_category_finalAddAds == 4 ||
                                  addAds.id_category_finalAddAds == 5 ||
                                  addAds.id_category_finalAddAds == 7 ||
                                  addAds.id_category_finalAddAds == 8 ||
                                  addAds.id_category_finalAddAds == 9 ||
                                  addAds.id_category_finalAddAds == 10 ||
                                  addAds.id_category_finalAddAds == 11 ||
                                  addAds.id_category_finalAddAds == 15 ||
                                  addAds.id_category_finalAddAds == 16 ||
                                  addAds.id_category_finalAddAds == 18 ||
                                  addAds.id_category_finalAddAds == 19 ||
                                  addAds.id_category_finalAddAds == 21)
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 10, 20, 0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            20, 10, 20, 0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              AppLocalizations.of(context)
                                                  .interface,
                                              style: GoogleFonts.tajawal(
                                                fontSize: 15,
                                                color: const Color(0xff000000),
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        height: 50,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                width: 1, color: Colors.grey),
                                            borderRadius:
                                                BorderRadius.circular(0)),
                                        child: DropdownButtonHideUnderline(
                                          child: ButtonTheme(
                                            alignedDropdown: true,
                                            child: DropdownButton<String>(
                                              hint: Text(
                                                AppLocalizations.of(context)
                                                    .interface,
                                                style: GoogleFonts.tajawal(
                                                  fontSize: 15,
                                                  color:
                                                      const Color(0xff989696),
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                              value: addAds
                                                      .interfaceSelectedAddAds ??
                                                  '1',
                                              onChanged: (String newValue) {
                                                addAds
                                                    .setInterfaceSelectedAddAds(
                                                        newValue);
                                              },
                                              items: _lang != 'en_US'
                                                  ? addAds.Interface.map(
                                                      (Map map) {
                                                      return DropdownMenuItem<
                                                          String>(
                                                        value: map['id_type']
                                                            .toString(),
                                                        child: Row(
                                                          children: <Widget>[
                                                            Container(
                                                              child: Text(
                                                                map['type'],
                                                                style:
                                                                    GoogleFonts
                                                                        .tajawal(
                                                                  fontSize: 15,
                                                                  color: const Color(
                                                                      0xff989696),
                                                                ),
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      );
                                                    }).toList()
                                                  : addAds.EnInterface.map(
                                                      (Map map) {
                                                      return DropdownMenuItem<
                                                          String>(
                                                        value: map['id_type']
                                                            .toString(),
                                                        child: Row(
                                                          children: <Widget>[
                                                            Container(
                                                              child: Text(
                                                                map['type'],
                                                                style:
                                                                    GoogleFonts
                                                                        .tajawal(
                                                                  fontSize: 15,
                                                                  color: const Color(
                                                                      0xff989696),
                                                                ),
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      );
                                                    }).toList(),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              if (addAds.id_category_finalAddAds == 2 ||
                                  addAds.id_category_finalAddAds == 3 ||
                                  addAds.id_category_finalAddAds == 10 ||
                                  addAds.id_category_finalAddAds == 11)
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 15, 20, 0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ToggleButtons(
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                30, 0, 30, 0),
                                            child: Text(
                                              AppLocalizations.of(context)
                                                  .commHousing,
                                              style: GoogleFonts.tajawal(
                                                fontSize: 15,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                30, 0, 30, 0),
                                            child: Text(
                                              AppLocalizations.of(context)
                                                  .commercial,
                                              style: GoogleFonts.tajawal(
                                                fontSize: 15,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                30, 0, 30, 0),
                                            child: Text(
                                              AppLocalizations.of(context)
                                                  .housing,
                                              style: GoogleFonts.tajawal(
                                                fontSize: 15,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ],
                                        onPressed: (int index) {
                                          addAds.setTyprAqarAddAds(index);
                                        },
                                        isSelected: addAds.typeAqarAddAds,
                                        color: const Color(0xff00cccc),
                                        selectedColor: const Color(0xffffffff),
                                        fillColor: const Color(0xff00cccc),
                                        borderColor: const Color(0xff00cccc),
                                        selectedBorderColor:
                                            const Color(0xff00cccc),
                                        borderWidth: 1,
                                      ),
                                    ],
                                  ),
                                ),
                              if (addAds.id_category_finalAddAds == 14)
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 15, 20, 0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ToggleButtons(
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                66, 0, 66, 0),
                                            child: Text(
                                              AppLocalizations.of(context)
                                                  .single,
                                              style: GoogleFonts.tajawal(
                                                fontSize: 13,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                66, 0, 66, 0),
                                            child: Text(
                                              AppLocalizations.of(context)
                                                  .family,
                                              style: GoogleFonts.tajawal(
                                                fontSize: 13,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ],
                                        onPressed: (int index) {
                                          addAds.setFamilyAddAds(index);
                                        },
                                        isSelected: addAds.familyAddAds,
                                        color: const Color(0xff00cccc),
                                        selectedColor: const Color(0xffffffff),
                                        fillColor: const Color(0xff00cccc),
                                        borderColor: const Color(0xff00cccc),
                                        selectedBorderColor:
                                            const Color(0xff00cccc),
                                        borderWidth: 1,
                                      ),
                                    ],
                                  ),
                                ),
                              if (addAds.id_category_finalAddAds == 12 ||
                                  addAds.id_category_finalAddAds == 14 ||
                                  addAds.id_category_finalAddAds == 17 ||
                                  addAds.id_category_finalAddAds == 20)
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 15, 20, 0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ToggleButtons(
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                37, 0, 37, 0),
                                            child: Text(
                                              AppLocalizations.of(context)
                                                  .daily,
                                              style: GoogleFonts.tajawal(
                                                fontSize: 13,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                37, 0, 37, 0),
                                            child: Text(
                                              AppLocalizations.of(context)
                                                  .monthly,
                                              style: GoogleFonts.tajawal(
                                                fontSize: 13,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                37, 0, 37, 0),
                                            child: Text(
                                              AppLocalizations.of(context)
                                                  .annual,
                                              style: GoogleFonts.tajawal(
                                                fontSize: 13,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ],
                                        onPressed: (int index) {
                                          addAds.setPlanAddAds(index);
                                        },
                                        isSelected: addAds.planAddAds,
                                        color: const Color(0xff00cccc),
                                        selectedColor: const Color(0xffffffff),
                                        fillColor: const Color(0xff00cccc),
                                        borderColor: const Color(0xff00cccc),
                                        selectedBorderColor:
                                            const Color(0xff00cccc),
                                        borderWidth: 1,
                                      ),
                                    ],
                                  ),
                                ),
// ....... end toggle ......
// sliders .............. 11 .................

                              if (addAds.id_category_finalAddAds == 1 ||
                                  addAds.id_category_finalAddAds == 4 ||
                                  addAds.id_category_finalAddAds == 5 ||
                                  addAds.id_category_finalAddAds == 8 ||
                                  addAds.id_category_finalAddAds == 9 ||
                                  addAds.id_category_finalAddAds == 12 ||
                                  addAds.id_category_finalAddAds == 14 ||
                                  addAds.id_category_finalAddAds == 15)
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 15, 20, 0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        AppLocalizations.of(context).lounges,
                                        style: GoogleFonts.tajawal(
                                          fontSize: 15,
                                          color: const Color(0xff000000),
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      if (addAds.LoungesAddAds == 5)
                                        Text(
                                          '+5',
                                          style: GoogleFonts.tajawal(
                                            fontSize: 15,
                                            color: const Color(0xff000000),
                                          ),
                                          textAlign: TextAlign.center,
                                        )
                                      else
                                        Text(
                                          addAds.LoungesAddAds.floor()
                                              .toString(),
                                          style: GoogleFonts.tajawal(
                                            fontSize: 15,
                                            color: const Color(0xff000000),
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                    ],
                                  ),
                                ),

                              if (addAds.id_category_finalAddAds == 1 ||
                                  addAds.id_category_finalAddAds == 4 ||
                                  addAds.id_category_finalAddAds == 5 ||
                                  addAds.id_category_finalAddAds == 8 ||
                                  addAds.id_category_finalAddAds == 9 ||
                                  addAds.id_category_finalAddAds == 12 ||
                                  addAds.id_category_finalAddAds == 14 ||
                                  addAds.id_category_finalAddAds == 15)
                                Slider(
                                  activeColor: const Color(0xff00cccc),
                                  value: addAds.LoungesAddAds,
                                  min: 0,
                                  max: 5,
                                  divisions: 5,
                                  label:
                                      addAds.LoungesAddAds.floor().toString(),
                                  onChanged: (double value) {
                                    addAds.setLoungesAddAds(value);
                                  },
                                ),
                              if (addAds.id_category_finalAddAds == 1 ||
                                  addAds.id_category_finalAddAds == 4 ||
                                  addAds.id_category_finalAddAds == 5 ||
                                  addAds.id_category_finalAddAds == 8 ||
                                  addAds.id_category_finalAddAds == 9 ||
                                  addAds.id_category_finalAddAds == 12 ||
                                  addAds.id_category_finalAddAds == 14 ||
                                  addAds.id_category_finalAddAds == 15)
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 15, 20, 0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        AppLocalizations.of(context).toilets,
                                        style: GoogleFonts.tajawal(
                                          fontSize: 15,
                                          color: const Color(0xff000000),
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      if (addAds.ToiletsAddAds == 5)
                                        Text(
                                          '+5',
                                          style: GoogleFonts.tajawal(
                                            fontSize: 15,
                                            color: const Color(0xff000000),
                                          ),
                                          textAlign: TextAlign.center,
                                        )
                                      else
                                        Text(
                                          addAds.ToiletsAddAds.floor()
                                              .toString(),
                                          style: GoogleFonts.tajawal(
                                            fontSize: 15,
                                            color: const Color(0xff000000),
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                    ],
                                  ),
                                ),
                              if (addAds.id_category_finalAddAds == 1 ||
                                  addAds.id_category_finalAddAds == 4 ||
                                  addAds.id_category_finalAddAds == 5 ||
                                  addAds.id_category_finalAddAds == 8 ||
                                  addAds.id_category_finalAddAds == 9 ||
                                  addAds.id_category_finalAddAds == 12 ||
                                  addAds.id_category_finalAddAds == 14 ||
                                  addAds.id_category_finalAddAds == 15)
                                Slider(
                                  activeColor: const Color(0xff00cccc),
                                  value: addAds.ToiletsAddAds,
                                  min: 0,
                                  max: 5,
                                  divisions: 5,
                                  label:
                                      addAds.ToiletsAddAds.floor().toString(),
                                  onChanged: (double value) {
                                    addAds.setToiletsAddAds(value);
                                  },
                                ),

                              if (addAds.id_category_finalAddAds == 1 ||
                                  addAds.id_category_finalAddAds == 2 ||
                                  addAds.id_category_finalAddAds == 3 ||
                                  addAds.id_category_finalAddAds == 4 ||
                                  addAds.id_category_finalAddAds == 5 ||
                                  addAds.id_category_finalAddAds == 7 ||
                                  addAds.id_category_finalAddAds == 8 ||
                                  addAds.id_category_finalAddAds == 9 ||
                                  addAds.id_category_finalAddAds == 10 ||
                                  addAds.id_category_finalAddAds == 11 ||
                                  addAds.id_category_finalAddAds == 16 ||
                                  addAds.id_category_finalAddAds == 18 ||
                                  addAds.id_category_finalAddAds == 19 ||
                                  addAds.id_category_finalAddAds == 21)
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 15, 20, 0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        AppLocalizations.of(context)
                                            .streetWidth,
                                        style: GoogleFonts.tajawal(
                                          fontSize: 15,
                                          color: const Color(0xff000000),
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      Text(
                                        addAds.StreetWidthAddAds.floor()
                                            .toString(),
                                        style: GoogleFonts.tajawal(
                                          fontSize: 15,
                                          color: const Color(0xff000000),
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ),
                              if (addAds.id_category_finalAddAds == 1 ||
                                  addAds.id_category_finalAddAds == 2 ||
                                  addAds.id_category_finalAddAds == 3 ||
                                  addAds.id_category_finalAddAds == 4 ||
                                  addAds.id_category_finalAddAds == 5 ||
                                  addAds.id_category_finalAddAds == 7 ||
                                  addAds.id_category_finalAddAds == 8 ||
                                  addAds.id_category_finalAddAds == 9 ||
                                  addAds.id_category_finalAddAds == 10 ||
                                  addAds.id_category_finalAddAds == 11 ||
                                  addAds.id_category_finalAddAds == 16 ||
                                  addAds.id_category_finalAddAds == 18 ||
                                  addAds.id_category_finalAddAds == 19 ||
                                  addAds.id_category_finalAddAds == 21)
                                Slider(
                                  activeColor: const Color(0xff00cccc),
                                  value: addAds.StreetWidthAddAds,
                                  min: 0,
                                  max: 99,
                                  divisions: 99,
                                  label: addAds.StreetWidthAddAds.floor()
                                      .toString(),
                                  onChanged: (double value) {
                                    addAds.setStreetWidthAddAds(value);
                                  },
                                ),
                              if (addAds.id_category_finalAddAds == 1 ||
                                  addAds.id_category_finalAddAds == 4 ||
                                  addAds.id_category_finalAddAds == 5 ||
                                  addAds.id_category_finalAddAds == 8 ||
                                  addAds.id_category_finalAddAds == 9 ||
                                  addAds.id_category_finalAddAds == 12 ||
                                  addAds.id_category_finalAddAds == 14 ||
                                  addAds.id_category_finalAddAds == 15)
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 15, 20, 0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        AppLocalizations.of(context).rooms,
                                        style: GoogleFonts.tajawal(
                                          fontSize: 15,
                                          color: const Color(0xff000000),
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      if (addAds.RoomsAddAds == 5)
                                        Text(
                                          '+5',
                                          style: GoogleFonts.tajawal(
                                            fontSize: 15,
                                            color: const Color(0xff000000),
                                          ),
                                          textAlign: TextAlign.center,
                                        )
                                      else
                                        Text(
                                          addAds.RoomsAddAds.floor().toString(),
                                          style: GoogleFonts.tajawal(
                                            fontSize: 15,
                                            color: const Color(0xff000000),
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                    ],
                                  ),
                                ),

                              if (addAds.id_category_finalAddAds == 1 ||
                                  addAds.id_category_finalAddAds == 4 ||
                                  addAds.id_category_finalAddAds == 5 ||
                                  addAds.id_category_finalAddAds == 8 ||
                                  addAds.id_category_finalAddAds == 9 ||
                                  addAds.id_category_finalAddAds == 12 ||
                                  addAds.id_category_finalAddAds == 14 ||
                                  addAds.id_category_finalAddAds == 15)
                                Slider(
                                  activeColor: const Color(0xff00cccc),
                                  value: addAds.RoomsAddAds,
                                  min: 0,
                                  max: 5,
                                  divisions: 5,
                                  label: addAds.RoomsAddAds.floor().toString(),
                                  onChanged: (double value) {
                                    addAds.setRoomsAddAds(value);
                                  },
                                ),
                              if (addAds.id_category_finalAddAds == 1 ||
                                  addAds.id_category_finalAddAds == 3 ||
                                  addAds.id_category_finalAddAds == 11)
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 15, 20, 0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        AppLocalizations.of(context).apartments,
                                        style: GoogleFonts.tajawal(
                                          fontSize: 15,
                                          color: const Color(0xff000000),
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      if (addAds.ApartmentsAddAds == 30)
                                        Text(
                                          '+30',
                                          style: GoogleFonts.tajawal(
                                            fontSize: 15,
                                            color: const Color(0xff000000),
                                          ),
                                          textAlign: TextAlign.center,
                                        )
                                      else
                                        Text(
                                          addAds.ApartmentsAddAds.floor()
                                              .toString(),
                                          style: GoogleFonts.tajawal(
                                            fontSize: 15,
                                            color: const Color(0xff000000),
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                    ],
                                  ),
                                ),
                              if (addAds.id_category_finalAddAds == 1 ||
                                  addAds.id_category_finalAddAds == 3 ||
                                  addAds.id_category_finalAddAds == 11)
                                Slider(
                                  activeColor: const Color(0xff00cccc),
                                  value: addAds.ApartmentsAddAds,
                                  min: 0,
                                  max: 30,
                                  divisions: 30,
                                  label: addAds.ApartmentsAddAds.floor()
                                      .toString(),
                                  onChanged: (double value) {
                                    addAds.setApartementsAddAds(value);
                                  },
                                ),
                              if (addAds.id_category_finalAddAds == 8 ||
                                  addAds.id_category_finalAddAds == 14 ||
                                  addAds.id_category_finalAddAds == 15)
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 15, 20, 0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        AppLocalizations.of(context).floor,
                                        style: GoogleFonts.tajawal(
                                          fontSize: 15,
                                          color: const Color(0xff000000),
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      if (addAds.FloorAddAds == 0)
                                        Text(
                                          AppLocalizations.of(context)
                                              .undefined,
                                          style: GoogleFonts.tajawal(
                                            fontSize: 15,
                                            color: const Color(0xff000000),
                                          ),
                                          textAlign: TextAlign.center,
                                        )
                                      else if (addAds.FloorAddAds == 1)
                                        Text(
                                          AppLocalizations.of(context)
                                              .groundFloor,
                                          style: GoogleFonts.tajawal(
                                            fontSize: 15,
                                            color: const Color(0xff000000),
                                          ),
                                          textAlign: TextAlign.center,
                                        )
                                      else if (addAds.FloorAddAds == 2)
                                        Text(
                                          AppLocalizations.of(context).first,
                                          style: GoogleFonts.tajawal(
                                            fontSize: 15,
                                            color: const Color(0xff000000),
                                          ),
                                          textAlign: TextAlign.center,
                                        )
                                      else if (addAds.FloorAddAds == 20)
                                        Text(
                                          '+20',
                                          style: GoogleFonts.tajawal(
                                            fontSize: 15,
                                            color: const Color(0xff000000),
                                          ),
                                          textAlign: TextAlign.center,
                                        )
                                      else
                                        Text(
                                          addAds.FloorAddAds.floor().toString(),
                                          style: GoogleFonts.tajawal(
                                            fontSize: 15,
                                            color: const Color(0xff000000),
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                    ],
                                  ),
                                ),
                              if (addAds.id_category_finalAddAds == 8 ||
                                  addAds.id_category_finalAddAds == 14 ||
                                  addAds.id_category_finalAddAds == 15)
                                Slider(
                                  activeColor: const Color(0xff00cccc),
                                  value: addAds.FloorAddAds,
                                  min: 0,
                                  max: 20,
                                  divisions: 20,
                                  label: addAds.FloorAddAds.floor().toString(),
                                  onChanged: (double value) {
                                    addAds.setFloorAddAds(value);
                                  },
                                ),
                              if (addAds.id_category_finalAddAds == 1 ||
                                  addAds.id_category_finalAddAds == 3 ||
                                  addAds.id_category_finalAddAds == 4 ||
                                  addAds.id_category_finalAddAds == 5 ||
                                  addAds.id_category_finalAddAds == 7 ||
                                  addAds.id_category_finalAddAds == 8 ||
                                  addAds.id_category_finalAddAds == 9 ||
                                  addAds.id_category_finalAddAds == 11 ||
                                  addAds.id_category_finalAddAds == 14 ||
                                  addAds.id_category_finalAddAds == 15 ||
                                  addAds.id_category_finalAddAds == 16 ||
                                  addAds.id_category_finalAddAds == 17 ||
                                  addAds.id_category_finalAddAds == 18 ||
                                  addAds.id_category_finalAddAds == 19 ||
                                  addAds.id_category_finalAddAds == 21)
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 15, 20, 0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        AppLocalizations.of(context)
                                            .ageOfRealEstate,
                                        style: GoogleFonts.tajawal(
                                          fontSize: 15,
                                          color: const Color(0xff000000),
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      if (addAds.AgeOfRealEstateAddAds == -1)
                                        Text(
                                          AppLocalizations.of(context)
                                              .undefined,
                                          style: GoogleFonts.tajawal(
                                            fontSize: 15,
                                            color: const Color(0xff000000),
                                          ),
                                          textAlign: TextAlign.center,
                                        )
                                      else if (addAds.AgeOfRealEstateAddAds ==
                                          0)
                                        Text(
                                          AppLocalizations.of(context).lessYear,
                                          style: GoogleFonts.tajawal(
                                            fontSize: 15,
                                            color: const Color(0xff000000),
                                          ),
                                          textAlign: TextAlign.center,
                                        )
                                      else if (addAds.AgeOfRealEstateAddAds ==
                                          35)
                                        Text(
                                          '+35',
                                          style: GoogleFonts.tajawal(
                                            fontSize: 15,
                                            color: const Color(0xff000000),
                                          ),
                                          textAlign: TextAlign.center,
                                        )
                                      else
                                        Text(
                                          addAds.AgeOfRealEstateAddAds.floor()
                                              .toString(),
                                          style: GoogleFonts.tajawal(
                                            fontSize: 15,
                                            color: const Color(0xff000000),
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                    ],
                                  ),
                                ),
                              if (addAds.id_category_finalAddAds == 1 ||
                                  addAds.id_category_finalAddAds == 3 ||
                                  addAds.id_category_finalAddAds == 4 ||
                                  addAds.id_category_finalAddAds == 5 ||
                                  addAds.id_category_finalAddAds == 7 ||
                                  addAds.id_category_finalAddAds == 8 ||
                                  addAds.id_category_finalAddAds == 9 ||
                                  addAds.id_category_finalAddAds == 11 ||
                                  addAds.id_category_finalAddAds == 14 ||
                                  addAds.id_category_finalAddAds == 15 ||
                                  addAds.id_category_finalAddAds == 16 ||
                                  addAds.id_category_finalAddAds == 17 ||
                                  addAds.id_category_finalAddAds == 18 ||
                                  addAds.id_category_finalAddAds == 19 ||
                                  addAds.id_category_finalAddAds == 21)
                                Slider(
                                  activeColor: const Color(0xff00cccc),
                                  value: addAds.AgeOfRealEstateAddAds,
                                  min: 0,
                                  max: 36,
                                  divisions: 36,
                                  label: addAds.AgeOfRealEstateAddAds.floor()
                                      .toString(),
                                  onChanged: (double value) {
                                    addAds.setAgeOfREAddAds(value);
                                  },
                                ),
                              if (addAds.id_category_finalAddAds == 3 ||
                                  addAds.id_category_finalAddAds == 11)
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 15, 20, 0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        AppLocalizations.of(context).stores,
                                        style: GoogleFonts.tajawal(
                                          fontSize: 15,
                                          color: const Color(0xff000000),
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      Text(
                                        addAds.StoresAddAds.floor().toString(),
                                        style: GoogleFonts.tajawal(
                                          fontSize: 15,
                                          color: const Color(0xff000000),
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ),
                              if (addAds.id_category_finalAddAds == 3 ||
                                  addAds.id_category_finalAddAds == 11)
                                Slider(
                                  activeColor: const Color(0xff00cccc),
                                  value: addAds.StoresAddAds,
                                  min: 0,
                                  max: 50,
                                  divisions: 50,
                                  label: addAds.StoresAddAds.floor().toString(),
                                  onChanged: (double value) {
                                    addAds.setStoresAddAds(value);
                                  },
                                ),
                              if (addAds.id_category_finalAddAds == 3 ||
                                  addAds.id_category_finalAddAds == 11)
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 15, 20, 0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        AppLocalizations.of(context).rooms,
                                        style: GoogleFonts.tajawal(
                                          fontSize: 15,
                                          color: const Color(0xff000000),
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      Text(
                                        addAds.RoomsAddAds.floor().toString(),
                                        style: GoogleFonts.tajawal(
                                          fontSize: 15,
                                          color: const Color(0xff000000),
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ),

                              if (addAds.id_category_finalAddAds == 3 ||
                                  addAds.id_category_finalAddAds == 11)
                                Slider(
                                  activeColor: const Color(0xff00cccc),
                                  value: addAds.RoomsAddAds,
                                  min: 0,
                                  max: 9999,
                                  divisions: 9999,
                                  label: addAds.RoomsAddAds.floor().toString(),
                                  onChanged: (double value) {
                                    addAds.setRoomsAddAds(value);
                                  },
                                ),
                              if (addAds.id_category_finalAddAds == 6 ||
                                  addAds.id_category_finalAddAds == 13)
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 15, 20, 0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        AppLocalizations.of(context).trees,
                                        style: GoogleFonts.tajawal(
                                          fontSize: 15,
                                          color: const Color(0xff000000),
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      Text(
                                        addAds.TreesAddAds.floor().toString(),
                                        style: GoogleFonts.tajawal(
                                          fontSize: 15,
                                          color: const Color(0xff000000),
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ),
                              if (addAds.id_category_finalAddAds == 6 ||
                                  addAds.id_category_finalAddAds == 13)
                                Slider(
                                  activeColor: const Color(0xff00cccc),
                                  value: addAds.TreesAddAds,
                                  min: 0,
                                  max: 9999,
                                  divisions: 9999,
                                  label: addAds.TreesAddAds.floor().toString(),
                                  onChanged: (double value) {
                                    addAds.setTreesAddAds(value);
                                  },
                                ),
                              if (addAds.id_category_finalAddAds == 6 ||
                                  addAds.id_category_finalAddAds == 13)
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 15, 20, 0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        AppLocalizations.of(context).wells,
                                        style: GoogleFonts.tajawal(
                                          fontSize: 15,
                                          color: const Color(0xff000000),
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      Text(
                                        addAds.WellsAddAds.floor().toString(),
                                        style: GoogleFonts.tajawal(
                                          fontSize: 15,
                                          color: const Color(0xff000000),
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ),

                              if (addAds.id_category_finalAddAds == 6 ||
                                  addAds.id_category_finalAddAds == 13)
                                Slider(
                                  activeColor: const Color(0xff00cccc),
                                  value: addAds.WellsAddAds,
                                  min: 0,
                                  max: 10,
                                  divisions: 10,
                                  label: addAds.WellsAddAds.floor().toString(),
                                  onChanged: (double value) {
                                    addAds.setWellsAddAds(value);
                                  },
                                ),
//........end sliders...........
// switches ................... 18 ..................
                              if (addAds.id_category_finalAddAds == 1 ||
                                  addAds.id_category_finalAddAds == 9)
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 15, 20, 0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        AppLocalizations.of(context)
                                            .hallStaircase,
                                        style: GoogleFonts.tajawal(
                                          fontSize: 15,
                                          color: const Color(0xff000000),
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      FlutterSwitch(
                                        activeColor: const Color(0xff00cccc),
                                        width: 40.0,
                                        height: 20.0,
                                        valueFontSize: 15.0,
                                        toggleSize: 15.0,
                                        value: addAds.isHallStaircaseAddAds,
                                        borderRadius: 15.0,
                                        padding: 2.0,
                                        showOnOff: false,
                                        onToggle: (val) {
                                          addAds.setIsHallStaircaseAddAds(val);
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              if (addAds.id_category_finalAddAds == 1 ||
                                  addAds.id_category_finalAddAds == 4 ||
                                  addAds.id_category_finalAddAds == 9)
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 15, 20, 0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        AppLocalizations.of(context).driverRoom,
                                        style: GoogleFonts.tajawal(
                                          fontSize: 15,
                                          color: const Color(0xff000000),
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      FlutterSwitch(
                                        activeColor: const Color(0xff00cccc),
                                        width: 40.0,
                                        height: 20.0,
                                        valueFontSize: 15.0,
                                        toggleSize: 15.0,
                                        value: addAds.isDriverRoomAddAds,
                                        borderRadius: 15.0,
                                        padding: 2.0,
                                        showOnOff: false,
                                        onToggle: (val) {
                                          addAds.setIsDriverRoomAddAds(val);
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              if (addAds.id_category_finalAddAds == 1 ||
                                  addAds.id_category_finalAddAds == 4 ||
                                  addAds.id_category_finalAddAds == 9)
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 15, 20, 0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        AppLocalizations.of(context).maidRoom,
                                        style: GoogleFonts.tajawal(
                                          fontSize: 15,
                                          color: const Color(0xff000000),
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      FlutterSwitch(
                                        activeColor: const Color(0xff00cccc),
                                        width: 40.0,
                                        height: 20.0,
                                        valueFontSize: 15.0,
                                        toggleSize: 15.0,
                                        value: addAds.isMaidRoomAddAds,
                                        borderRadius: 15.0,
                                        padding: 2.0,
                                        showOnOff: false,
                                        onToggle: (val) {
                                          addAds.setIsMaidRoomAddAds(val);
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              if (addAds.id_category_finalAddAds == 1 ||
                                  addAds.id_category_finalAddAds == 5 ||
                                  addAds.id_category_finalAddAds == 9 ||
                                  addAds.id_category_finalAddAds == 12)
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 15, 20, 0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        AppLocalizations.of(context)
                                            .swimmingPool,
                                        style: GoogleFonts.tajawal(
                                          fontSize: 15,
                                          color: const Color(0xff000000),
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      FlutterSwitch(
                                        activeColor: const Color(0xff00cccc),
                                        width: 40.0,
                                        height: 20.0,
                                        valueFontSize: 15.0,
                                        toggleSize: 15.0,
                                        value: addAds.isSwimmingPoolAddAds,
                                        borderRadius: 15.0,
                                        padding: 2.0,
                                        showOnOff: false,
                                        onToggle: (val) {
                                          addAds.setIsSwimmingPoolAddAds(val);
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              if (addAds.id_category_finalAddAds == 5 ||
                                  addAds.id_category_finalAddAds == 12)
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 15, 20, 0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        AppLocalizations.of(context)
                                            .footballCourt,
                                        style: GoogleFonts.tajawal(
                                          fontSize: 15,
                                          color: const Color(0xff000000),
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      FlutterSwitch(
                                        activeColor: const Color(0xff00cccc),
                                        width: 40.0,
                                        height: 20.0,
                                        valueFontSize: 15.0,
                                        toggleSize: 15.0,
                                        value: addAds.isFootballCourtAddAds,
                                        borderRadius: 15.0,
                                        padding: 2.0,
                                        showOnOff: false,
                                        onToggle: (val) {
                                          addAds.setIsFootballCourtAddAds(val);
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              if (addAds.id_category_finalAddAds == 5 ||
                                  addAds.id_category_finalAddAds == 12)
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 15, 20, 0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        AppLocalizations.of(context)
                                            .volleyballCourt,
                                        style: GoogleFonts.tajawal(
                                          fontSize: 15,
                                          color: const Color(0xff000000),
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      FlutterSwitch(
                                        activeColor: const Color(0xff00cccc),
                                        width: 40.0,
                                        height: 20.0,
                                        valueFontSize: 15.0,
                                        toggleSize: 15.0,
                                        value: addAds.isVolleyballCourtAddAds,
                                        borderRadius: 15.0,
                                        padding: 2.0,
                                        showOnOff: false,
                                        onToggle: (val) {
                                          addAds
                                              .setIsVolleyballCourtAddAds(val);
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              if (addAds.id_category_finalAddAds == 1 ||
                                  addAds.id_category_finalAddAds == 3 ||
                                  addAds.id_category_finalAddAds == 4 ||
                                  addAds.id_category_finalAddAds == 8 ||
                                  addAds.id_category_finalAddAds == 9 ||
                                  addAds.id_category_finalAddAds == 11 ||
                                  addAds.id_category_finalAddAds == 14 ||
                                  addAds.id_category_finalAddAds == 15 ||
                                  addAds.id_category_finalAddAds == 16 ||
                                  addAds.id_category_finalAddAds == 17)
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 15, 20, 0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        AppLocalizations.of(context).furnished,
                                        style: GoogleFonts.tajawal(
                                          fontSize: 15,
                                          color: const Color(0xff000000),
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      FlutterSwitch(
                                        activeColor: const Color(0xff00cccc),
                                        width: 40.0,
                                        height: 20.0,
                                        valueFontSize: 15.0,
                                        toggleSize: 15.0,
                                        value: addAds.isFurnishedAddAds,
                                        borderRadius: 15.0,
                                        padding: 2.0,
                                        showOnOff: false,
                                        onToggle: (val) {
                                          addAds.setIsFurnishedAddAds(val);
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              if (addAds.id_category_finalAddAds == 1 ||
                                  addAds.id_category_finalAddAds == 4 ||
                                  addAds.id_category_finalAddAds == 5 ||
                                  addAds.id_category_finalAddAds == 6 ||
                                  addAds.id_category_finalAddAds == 9 ||
                                  addAds.id_category_finalAddAds == 12)
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 15, 20, 0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        AppLocalizations.of(context).verse,
                                        style: GoogleFonts.tajawal(
                                          fontSize: 15,
                                          color: const Color(0xff000000),
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      FlutterSwitch(
                                        activeColor: const Color(0xff00cccc),
                                        width: 40.0,
                                        height: 20.0,
                                        valueFontSize: 15.0,
                                        toggleSize: 15.0,
                                        value: addAds.isVerseAddAds,
                                        borderRadius: 15.0,
                                        padding: 2.0,
                                        showOnOff: false,
                                        onToggle: (val) {
                                          addAds.setIsVerseAddAds(val);
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              if (addAds.id_category_finalAddAds == 1 ||
                                  addAds.id_category_finalAddAds == 4 ||
                                  addAds.id_category_finalAddAds == 9)
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 15, 20, 0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        AppLocalizations.of(context).yard,
                                        style: GoogleFonts.tajawal(
                                          fontSize: 15,
                                          color: const Color(0xff000000),
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      FlutterSwitch(
                                        activeColor: const Color(0xff00cccc),
                                        width: 40.0,
                                        height: 20.0,
                                        valueFontSize: 15.0,
                                        toggleSize: 15.0,
                                        value: addAds.isMonstersAddAds,
                                        borderRadius: 15.0,
                                        padding: 2.0,
                                        showOnOff: false,
                                        onToggle: (val) {
                                          addAds.setIsMonstersAddAds(val);
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              if (addAds.id_category_finalAddAds == 1 ||
                                  addAds.id_category_finalAddAds == 4 ||
                                  addAds.id_category_finalAddAds == 8 ||
                                  addAds.id_category_finalAddAds == 9 ||
                                  addAds.id_category_finalAddAds == 12 ||
                                  addAds.id_category_finalAddAds == 14 ||
                                  addAds.id_category_finalAddAds == 17)
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 15, 20, 0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        AppLocalizations.of(context).kitchen,
                                        style: GoogleFonts.tajawal(
                                          fontSize: 15,
                                          color: const Color(0xff000000),
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      FlutterSwitch(
                                        activeColor: const Color(0xff00cccc),
                                        width: 40.0,
                                        height: 20.0,
                                        valueFontSize: 15.0,
                                        toggleSize: 15.0,
                                        value: addAds.isKitchenAddAds,
                                        borderRadius: 15.0,
                                        padding: 2.0,
                                        showOnOff: false,
                                        onToggle: (val) {
                                          addAds.setIsKitchenAddAds(val);
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              if (addAds.id_category_finalAddAds == 1 ||
                                  addAds.id_category_finalAddAds == 4 ||
                                  addAds.id_category_finalAddAds == 8 ||
                                  addAds.id_category_finalAddAds == 9 ||
                                  addAds.id_category_finalAddAds == 14)
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 15, 20, 0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        AppLocalizations.of(context).appendix,
                                        style: GoogleFonts.tajawal(
                                          fontSize: 15,
                                          color: const Color(0xff000000),
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      FlutterSwitch(
                                        activeColor: const Color(0xff00cccc),
                                        width: 40.0,
                                        height: 20.0,
                                        valueFontSize: 15.0,
                                        toggleSize: 15.0,
                                        value: addAds.isAppendixAddAds,
                                        borderRadius: 15.0,
                                        padding: 2.0,
                                        showOnOff: false,
                                        onToggle: (val) {
                                          addAds.setIsAppendixAddAds(val);
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              if (addAds.id_category_finalAddAds == 1 ||
                                  addAds.id_category_finalAddAds == 4 ||
                                  addAds.id_category_finalAddAds == 8 ||
                                  addAds.id_category_finalAddAds == 9 ||
                                  addAds.id_category_finalAddAds == 14 ||
                                  addAds.id_category_finalAddAds == 15)
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 15, 20, 0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        AppLocalizations.of(context)
                                            .carEntrance,
                                        style: GoogleFonts.tajawal(
                                          fontSize: 15,
                                          color: const Color(0xff000000),
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      FlutterSwitch(
                                        activeColor: const Color(0xff00cccc),
                                        width: 40.0,
                                        height: 20.0,
                                        valueFontSize: 15.0,
                                        toggleSize: 15.0,
                                        value: addAds.isCarEntranceAddAds,
                                        borderRadius: 15.0,
                                        padding: 2.0,
                                        showOnOff: false,
                                        onToggle: (val) {
                                          addAds.setIsCarEntranceAddAds(val);
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              if (addAds.id_category_finalAddAds == 1 ||
                                  addAds.id_category_finalAddAds == 9)
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 15, 20, 0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        AppLocalizations.of(context).cellar,
                                        style: GoogleFonts.tajawal(
                                          fontSize: 15,
                                          color: const Color(0xff000000),
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      FlutterSwitch(
                                        activeColor: const Color(0xff00cccc),
                                        width: 40.0,
                                        height: 20.0,
                                        valueFontSize: 15.0,
                                        toggleSize: 15.0,
                                        value: addAds.isCellarAddAds,
                                        borderRadius: 15.0,
                                        padding: 2.0,
                                        showOnOff: false,
                                        onToggle: (val) {
                                          addAds.setIsCellarAddAds(val);
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              if (addAds.id_category_finalAddAds == 1 ||
                                  addAds.id_category_finalAddAds == 8 ||
                                  addAds.id_category_finalAddAds == 9 ||
                                  addAds.id_category_finalAddAds == 14)
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 15, 20, 0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        AppLocalizations.of(context).elevator,
                                        style: GoogleFonts.tajawal(
                                          fontSize: 15,
                                          color: const Color(0xff000000),
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      FlutterSwitch(
                                        activeColor: const Color(0xff00cccc),
                                        width: 40.0,
                                        height: 20.0,
                                        valueFontSize: 15.0,
                                        toggleSize: 15.0,
                                        value: addAds.isElevatorAddAds,
                                        borderRadius: 15.0,
                                        padding: 2.0,
                                        showOnOff: false,
                                        onToggle: (val) {
                                          addAds.setIsElevatorAddAds(val);
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              if (addAds.id_category_finalAddAds == 1 ||
                                  addAds.id_category_finalAddAds == 9)
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 15, 20, 0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        AppLocalizations.of(context).duplex,
                                        style: GoogleFonts.tajawal(
                                          fontSize: 15,
                                          color: const Color(0xff000000),
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      FlutterSwitch(
                                        activeColor: const Color(0xff00cccc),
                                        width: 40.0,
                                        height: 20.0,
                                        valueFontSize: 15.0,
                                        toggleSize: 15.0,
                                        value: addAds.isDuplexAddAds,
                                        borderRadius: 15.0,
                                        padding: 2.0,
                                        showOnOff: false,
                                        onToggle: (val) {
                                          addAds.setIsDuplexAddAds(val);
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              if (addAds.id_category_finalAddAds == 9 ||
                                  addAds.id_category_finalAddAds == 14 ||
                                  addAds.id_category_finalAddAds == 15)
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 15, 20, 0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        AppLocalizations.of(context)
                                            .conditioner,
                                        style: GoogleFonts.tajawal(
                                          fontSize: 15,
                                          color: const Color(0xff000000),
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      FlutterSwitch(
                                        activeColor: const Color(0xff00cccc),
                                        width: 40.0,
                                        height: 20.0,
                                        valueFontSize: 15.0,
                                        toggleSize: 15.0,
                                        value: addAds.isConditionerAddAds,
                                        borderRadius: 15.0,
                                        padding: 2.0,
                                        showOnOff: false,
                                        onToggle: (val) {
                                          addAds.setIsConditionerAddAds(val);
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              if (addAds.id_category_finalAddAds == 5 ||
                                  addAds.id_category_finalAddAds == 12)
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 15, 20, 0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        AppLocalizations.of(context)
                                            .amusementPark,
                                        style: GoogleFonts.tajawal(
                                          fontSize: 15,
                                          color: const Color(0xff000000),
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      FlutterSwitch(
                                        activeColor: const Color(0xff00cccc),
                                        width: 40.0,
                                        height: 20.0,
                                        valueFontSize: 15.0,
                                        toggleSize: 15.0,
                                        value: addAds.isAmusementParkAddAds,
                                        borderRadius: 15.0,
                                        padding: 2.0,
                                        showOnOff: false,
                                        onToggle: (val) {
                                          addAds.setIsAmusementParkAddAds(val);
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              if (addAds.id_category_finalAddAds == 5 ||
                                  addAds.id_category_finalAddAds == 12 ||
                                  addAds.id_category_finalAddAds == 20)
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 15, 20, 0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        AppLocalizations.of(context)
                                            .familyPartition,
                                        style: GoogleFonts.tajawal(
                                          fontSize: 15,
                                          color: const Color(0xff000000),
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      FlutterSwitch(
                                        activeColor: const Color(0xff00cccc),
                                        width: 40.0,
                                        height: 20.0,
                                        valueFontSize: 15.0,
                                        toggleSize: 15.0,
                                        value: addAds.isFamilyPartitionAddAds,
                                        borderRadius: 15.0,
                                        padding: 2.0,
                                        showOnOff: false,
                                        onToggle: (val) {
                                          addAds
                                              .setIsFamilyPartitionAddAds(val);
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                            ],
                          ),
//........end switches...........
//..............................
                        TextButton(
                          onPressed: () {
                            if (!_addAdsKey.currentState.validate()) {
                              return;
                            }
                            _addAdsKey.currentState.save();
                            if ((addAds.id_category_finalAddAds == 1 ||
                                    addAds.id_category_finalAddAds == 2 ||
                                    addAds.id_category_finalAddAds == 3 ||
                                    addAds.id_category_finalAddAds == 4 ||
                                    addAds.id_category_finalAddAds == 5 ||
                                    addAds.id_category_finalAddAds == 7 ||
                                    addAds.id_category_finalAddAds == 8 ||
                                    addAds.id_category_finalAddAds == 9 ||
                                    addAds.id_category_finalAddAds == 10 ||
                                    addAds.id_category_finalAddAds == 11 ||
                                    addAds.id_category_finalAddAds == 15 ||
                                    addAds.id_category_finalAddAds == 16 ||
                                    addAds.id_category_finalAddAds == 18 ||
                                    addAds.id_category_finalAddAds == 19 ||
                                    addAds.id_category_finalAddAds == 21) &&
                                (addAds.interfaceSelectedAddAds == null ||
                                    addAds.interfaceSelectedAddAds == '0')) {
                              _onInterfaceCheck();
                            } else {
                              addAds.setCurrentStageAddAds(6);
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 15, 0, 30),
                            child: Container(
                              width: mediaQuery.size.width * 0.6,
                              height: 40.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                color: const Color(0xffffffff),
                                border: Border.all(
                                    width: 1.0, color: const Color(0xff3f9d28)),
                              ),
                              child: Center(
                                child: Text(
                                  AppLocalizations.of(context).continuee,
                                  style: GoogleFonts.tajawal(
                                    fontSize: 15,
                                    color: const Color(0xff3f9d28),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  //...........end 5 ads details toggle , swatches, sliders screen.............
                  if (addAds.currentStageAddAds == 6)
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Stack(
                              children: <Widget>[
                                Container(
                                  width: mediaQuery.size.width,
                                  height: 100.0,
                                  decoration: BoxDecoration(
                                    color: const Color(0xff00cccc),
                                  ),
                                  child: Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              30, 0, 30, 10),
                                          child: IconButton(
                                            icon: Icon(
                                              Icons.arrow_back_ios,
                                              color: Color(0xffffffff),
                                              size: 40,
                                            ),
                                            onPressed: () {
                                              addAds.setCurrentStageAddAds(5);
                                            },
                                          ),
                                        ),
                                        Text(
                                          AppLocalizations.of(context)
                                              .addAdsDetails,
                                          style: GoogleFonts.tajawal(
                                            fontSize: 20,
                                            color: const Color(0xffffffff),
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        if (addAds.id_category_finalAddAds != 14)
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  AppLocalizations.of(context).space,
                                  style: GoogleFonts.tajawal(
                                    fontSize: 15,
                                    color: const Color(0xff000000),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        if (addAds.id_category_finalAddAds != 14)
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                          child: TextFormField(
                            controller: addAds.spaceControllerAddAds ??
                                TextEditingController(text: ''),
                            decoration: InputDecoration(
                              labelText: AppLocalizations.of(context).space,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(0.0),
                                borderSide: BorderSide(),
                              ),
                            ),
                            style: GoogleFonts.tajawal(
                              fontSize: 15,
                              color: const Color(0xff989696),
                            ),
                            keyboardType: TextInputType.number,
                            minLines: 1,
                            maxLines: 1,
                            validator: (String value) {
                              if (value.isEmpty) {
                                return AppLocalizations.of(context).reqSpace;
                              }
                              return null;
                            },
                            onChanged: (String value) {
                              addAds.setOnChangedSpaceAddAds(value);
                            },
                            onSaved: (String value) {
                              addAds.setOnSavedSpaceAddAds(value);
                            },
                          ),
                        ),
                        if (addAds.id_category_finalAddAds == 2)
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  AppLocalizations.of(context).meterPrice,
                                  style: GoogleFonts.tajawal(
                                    fontSize: 15,
                                    color: const Color(0xff000000),
                                  ),
                                ),
                                SizedBox(
                                  width: mediaQuery.size.width * 0.6,
                                  height: 50,
                                  child: TextFormField(
                                    controller:
                                        addAds.meterPriceControllerAddAds ??
                                            TextEditingController(text: ''),
                                    decoration: InputDecoration(
                                      labelText: AppLocalizations.of(context)
                                          .meterPrice,
                                      fillColor: Colors.white,
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(0.0),
                                        borderSide: BorderSide(),
                                      ),
                                    ),
                                    style: GoogleFonts.tajawal(
                                      fontSize: 15,
                                      color: const Color(0xff989696),
                                    ),
                                    keyboardType: TextInputType.number,
                                    minLines: 1,
                                    maxLines: 1,
                                    onChanged: (value) {
                                      addAds
                                          .setOnChangedMeterPriceAddAds(value);
                                    },
                                    onSaved: (value) {
                                      addAds.setOnSavedMeterPriceAddAds(value);
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                AppLocalizations.of(context).totalPrice,
                                style: GoogleFonts.tajawal(
                                  fontSize: 15,
                                  color: const Color(0xff000000),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                          child: TextFormField(
                            controller: addAds.priceControllerAddAds ??
                                TextEditingController(text: ''),
                            decoration: InputDecoration(
                              labelText:
                                  AppLocalizations.of(context).totalPrice,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(0.0),
                                borderSide: BorderSide(),
                              ),
                            ),
                            style: GoogleFonts.tajawal(
                              fontSize: 15,
                              color: const Color(0xff989696),
                            ),
                            keyboardType: TextInputType.number,
                            minLines: 1,
                            maxLines: 1,
                            validator: (String value) {
                              if (value.isEmpty) {
                                return AppLocalizations.of(context)
                                    .reqTotalPrice;
                              }
                              return null;
                            },
                            onSaved: (String value) {
                              addAds.setOnSavedTotalPriceAddAds(value);
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                AppLocalizations.of(context).aqarDesc,
                                style: GoogleFonts.tajawal(
                                  fontSize: 15,
                                  color: const Color(0xff000000),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                          child: TextFormField(
                            controller: addAds.descControllerAddAds ??
                                TextEditingController(text: ''),
                            decoration: InputDecoration(
                              labelText: AppLocalizations.of(context)
                                  .writeAdditionalDetailsHere,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(0.0),
                                borderSide: BorderSide(),
                              ),
                            ),
                            style: GoogleFonts.tajawal(
                              fontSize: 15,
                              color: const Color(0xff989696),
                            ),
                            keyboardType: TextInputType.text,
                            minLines: 5,
                            maxLines: 15,
                            validator: (String value) {
                              if (value.isEmpty) {
                                return AppLocalizations.of(context).reqDesc;
                              }
                              return null;
                            },
                            onSaved: (String value) {
                              addAds.setOnSavedDetailsAddAds(value);
                            },
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            if (!_addAdsKey.currentState.validate()) {
                              return;
                            }
                            _addAdsKey.currentState.save();
                            addAds.setCurrentStageAddAds(7);
                          },
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 15, 0, 30),
                            child: Container(
                              width: mediaQuery.size.width * 0.6,
                              height: 40.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                color: const Color(0xffffffff),
                                border: Border.all(
                                    width: 1.0, color: const Color(0xff3f9d28)),
                              ),
                              child: Center(
                                child: Text(
                                  AppLocalizations.of(context).continuee,
                                  style: GoogleFonts.tajawal(
                                    fontSize: 15,
                                    color: const Color(0xff3f9d28),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  //...........end 6 ads details price space details screen.............
                  if (addAds.currentStageAddAds == 7)
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Stack(
                              children: <Widget>[
                                Container(
                                  width: mediaQuery.size.width,
                                  height: 100.0,
                                  decoration: BoxDecoration(
                                    color: const Color(0xff00cccc),
                                  ),
                                  child: Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              30, 0, 30, 10),
                                          child: IconButton(
                                            icon: Icon(
                                              Icons.arrow_back_ios,
                                              color: Color(0xffffffff),
                                              size: 40,
                                            ),
                                            onPressed: () {
                                              addAds.setCurrentStageAddAds(6);
                                            },
                                          ),
                                        ),
                                        Text(
                                          AppLocalizations.of(context).adReview,
                                          style: GoogleFonts.tajawal(
                                            fontSize: 20,
                                            color: const Color(0xffffffff),
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        if (addAds.videoAddAds != null)
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                            child: SizedBox(
                              width: mediaQuery.size.width * 0.9,
                              height: 500,
                              child: AspectRatio(
                                aspectRatio: addAds
                                    .videoControllerAddAds.value.aspectRatio,
                                child: Stack(
                                  children: [
                                    Column(
                                      children: <Widget>[
                                        Expanded(
                                          child: Center(
                                            child: addAds.chewieControllerAddAds !=
                                                        null &&
                                                    addAds
                                                        .chewieControllerAddAds
                                                        .videoPlayerController
                                                        .value
                                                        .initialized
                                                ? Chewie(
                                                    controller: addAds
                                                        .chewieControllerAddAds,
                                                  )
                                                : Container(),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          250, 5, 5, 5),
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
                                  ],
                                ),
                              ),
                            ),
                          ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                addAds.category_finalAddAds.toString(),
                                style: GoogleFonts.tajawal(
                                  fontSize: 20,
                                  color: const Color(0xff000000),
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                addAds.totalPricAddAds,
                                style: GoogleFonts.tajawal(
                                  fontSize: 20,
                                  color: const Color(0xff00cccc),
                                ),
                                textAlign: TextAlign.center,
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                                child: Text(
                                  AppLocalizations.of(context).rial,
                                  style: GoogleFonts.tajawal(
                                    fontSize: 20,
                                    color: const Color(0xff00cccc),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              if (addAds.selectedPlanAddAds == 1)
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(5, 0, 0, 0),
                                  child: Text(
                                    AppLocalizations.of(context).annual,
                                    style: GoogleFonts.tajawal(
                                      fontSize: 20,
                                      color: const Color(0xff00cccc),
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              if (addAds.selectedPlanAddAds == 2)
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(5, 0, 0, 0),
                                  child: Text(
                                    AppLocalizations.of(context).monthly,
                                    style: GoogleFonts.tajawal(
                                      fontSize: 20,
                                      color: const Color(0xff00cccc),
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              if (addAds.selectedPlanAddAds == 3)
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(5, 0, 0, 0),
                                  child: Text(
                                    AppLocalizations.of(context).daily ,
                                    style: GoogleFonts.tajawal(
                                      fontSize: 20,
                                      color: const Color(0xff00cccc),
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                            ],
                          ),
                        ),
                        addAds.imagesListAddAds.isNotEmpty
                            ? Container(
                                width: MediaQuery.of(context).size.width,
                                height:
                                    MediaQuery.of(context).size.height * 0.4,
                                child: Stack(
                                  children: [
                                    Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.4,
                                        child: PageView.builder(
                                          itemCount:
                                              addAds.imagesListAddAds.length,
                                          itemBuilder: (context, position) {
                                            return Stack(
                                              children: [
                                                PinchZoomImage(
                                                  image: Image.file(
                                                    addAds.imagesListAddAds[
                                                            position] ??
                                                        '',
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.4,
                                                    fit: BoxFit.cover,
                                                  ),
                                                  zoomedBackgroundColor:
                                                      Color.fromRGBO(
                                                          240, 240, 240, 1.0),
                                                  hideStatusBarWhileZooming:
                                                      true,
                                                  onZoomStart: () {},
                                                  onZoomEnd: () {},
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.fromLTRB(
                                                      addAds.randdLeft,
                                                      addAds.randdTop,
                                                      5,
                                                      5),
                                                  child: Opacity(
                                                    opacity: 0.7,
                                                    child: Container(
                                                      width: 60.0,
                                                      height: 60.0,
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
                                              ],
                                            );
                                          },
                                          onPageChanged: (index) {
                                            addAds
                                                .setCurrentControllerPageAddAds(
                                                    index);
                                            addAds.randomPosition(200);
                                          },
                                          controller: addAds.controllerAddAds,
                                        )),
                                    Align(
                                      alignment: Alignment.bottomRight,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                            height: 19,
                                            child: ListView.builder(
                                              scrollDirection: Axis.horizontal,
                                              itemBuilder:
                                                  (context, indexListView) {
                                                return Padding(
                                                  padding:
                                                      const EdgeInsets.all(4),
                                                  child: Container(
                                                    width: 10,
                                                    height: 10,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(30),
                                                        color: addAds
                                                                    .currentControllerPageAddAds ==
                                                                indexListView
                                                            ? Color(0xff00cccc)
                                                            : Colors.grey),
                                                  ),
                                                );
                                              },
                                              itemCount: addAds
                                                  .imagesListAddAds.length,
                                            )),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : Container(),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                          child: Table(
                            border: TableBorder.all(
                                color: Color(0xffffffff), width: 2),
                            defaultVerticalAlignment:
                                TableCellVerticalAlignment.middle,
                            defaultColumnWidth: FractionColumnWidth(0.5),
                            children: [
                              if (addAds.totalSpaceAddAds != null)
                                TableRow(
                                  decoration: BoxDecoration(
                                    color: Color(0xfff2f2f2),
                                  ),
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(5, 5, 5, 5),
                                      child: Text(
                                        AppLocalizations.of(context).space,
                                        style: GoogleFonts.tajawal(
                                          fontSize: 15,
                                          color: const Color(0xff989696),
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(5, 5, 5, 5),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Text(
                                            addAds.totalSpaceAddAds,
                                            style: GoogleFonts.tajawal(
                                              fontSize: 15,
                                              color: const Color(0xff989696),
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                0, 5, 5, 5),
                                            child: Text(
                                              AppLocalizations.of(context).m2,
                                              style: GoogleFonts.tajawal(
                                                fontSize: 15,
                                                color: const Color(0xff989696),
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              if (addAds.interfaceSelectedAddAds != null)
                                TableRow(
                                  decoration: BoxDecoration(
                                    color: Color(0xffffffff),
                                  ),
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(5, 5, 5, 5),
                                      child: Text(
                                        AppLocalizations.of(context).interface,
                                        style: GoogleFonts.tajawal(
                                          fontSize: 15,
                                          color: const Color(0xff989696),
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(5, 5, 5, 5),
                                      child: Text(
                                        addAds.interfaceSelectedAddAds,
                                        style: GoogleFonts.tajawal(
                                          fontSize: 15,
                                          color: const Color(0xff989696),
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ],
                                ),
                              if (addAds.selectedFamilyAddAds == 0)
                                TableRow(
                                  decoration: BoxDecoration(
                                    color: Color(0xfff2f2f2),
                                  ),
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(5, 5, 5, 5),
                                      child: Text(
                                        AppLocalizations.of(context).category,
                                        style: GoogleFonts.tajawal(
                                          fontSize: 15,
                                          color: const Color(0xff989696),
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(5, 5, 5, 5),
                                      child: Text(
                                        AppLocalizations.of(context).single,
                                        style: GoogleFonts.tajawal(
                                          fontSize: 15,
                                          color: const Color(0xff989696),
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ],
                                ),
                              if (addAds.selectedFamilyAddAds == 1)
                                TableRow(
                                  decoration: BoxDecoration(
                                    color: Color(0xfff2f2f2),
                                  ),
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(5, 5, 5, 5),
                                      child: Text(
                                        AppLocalizations.of(context).category,
                                        style: GoogleFonts.tajawal(
                                          fontSize: 15,
                                          color: const Color(0xff989696),
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(5, 5, 5, 5),
                                      child: Text(
                                        AppLocalizations.of(context).family,
                                        style: GoogleFonts.tajawal(
                                          fontSize: 15,
                                          color: const Color(0xff989696),
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ],
                                ),
                              if (addAds.selectedTypeAqarAddAds == 0)
                                TableRow(
                                  decoration: BoxDecoration(
                                    color: Color(0xfff2f2f2),
                                  ),
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(5, 5, 5, 5),
                                      child: Text(
                                        AppLocalizations.of(context).aqarType,
                                        style: GoogleFonts.tajawal(
                                          fontSize: 15,
                                          color: const Color(0xff989696),
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(5, 5, 5, 5),
                                      child: Text(
                                        AppLocalizations.of(context)
                                            .commHousing,
                                        style: GoogleFonts.tajawal(
                                          fontSize: 15,
                                          color: const Color(0xff989696),
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ],
                                ),
                              if (addAds.selectedTypeAqarAddAds == 1)
                                TableRow(
                                  decoration: BoxDecoration(
                                    color: Color(0xfff2f2f2),
                                  ),
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(5, 5, 5, 5),
                                      child: Text(
                                        AppLocalizations.of(context).aqarType,
                                        style: GoogleFonts.tajawal(
                                          fontSize: 15,
                                          color: const Color(0xff989696),
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(5, 5, 5, 5),
                                      child: Text(
                                        AppLocalizations.of(context).commercial,
                                        style: GoogleFonts.tajawal(
                                          fontSize: 15,
                                          color: const Color(0xff989696),
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ],
                                ),
                              if (addAds.selectedTypeAqarAddAds == 2)
                                TableRow(
                                  decoration: BoxDecoration(
                                    color: Color(0xfff2f2f2),
                                  ),
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(5, 5, 5, 5),
                                      child: Text(
                                        AppLocalizations.of(context).aqarType,
                                        style: GoogleFonts.tajawal(
                                          fontSize: 15,
                                          color: const Color(0xff989696),
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(5, 5, 5, 5),
                                      child: Text(
                                        AppLocalizations.of(context).housing,
                                        style: GoogleFonts.tajawal(
                                          fontSize: 15,
                                          color: const Color(0xff989696),
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ],
                                ),
                              if (addAds.LoungesAddAds != 0)
                                TableRow(
                                  decoration: BoxDecoration(
                                    color: Color(0xfff2f2f2),
                                  ),
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(5, 5, 5, 5),
                                      child: Text(
                                        AppLocalizations.of(context).lounges,
                                        style: GoogleFonts.tajawal(
                                          fontSize: 15,
                                          color: const Color(0xff989696),
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(5, 5, 5, 5),
                                      child: Text(
                                        addAds.LoungesAddAds.floor().toString(),
                                        style: GoogleFonts.tajawal(
                                          fontSize: 15,
                                          color: const Color(0xff989696),
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ],
                                ),
                              if (addAds.ToiletsAddAds != 0)
                                TableRow(
                                  decoration: BoxDecoration(
                                    color: Color(0xffffffff),
                                  ),
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(5, 5, 5, 5),
                                      child: Text(
                                        AppLocalizations.of(context).toilets,
                                        style: GoogleFonts.tajawal(
                                          fontSize: 15,
                                          color: const Color(0xff989696),
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(5, 5, 5, 5),
                                      child: Text(
                                        addAds.ToiletsAddAds.floor().toString(),
                                        style: GoogleFonts.tajawal(
                                          fontSize: 15,
                                          color: const Color(0xff989696),
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ],
                                ),
                              if (addAds.RoomsAddAds != 0)
                                TableRow(
                                  decoration: BoxDecoration(
                                    color: Color(0xfff2f2f2),
                                  ),
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(5, 5, 5, 5),
                                      child: Text(
                                        AppLocalizations.of(context).rooms,
                                        style: GoogleFonts.tajawal(
                                          fontSize: 15,
                                          color: const Color(0xff989696),
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(5, 5, 5, 5),
                                      child: Text(
                                        addAds.RoomsAddAds.floor().toString(),
                                        style: GoogleFonts.tajawal(
                                          fontSize: 15,
                                          color: const Color(0xff989696),
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ],
                                ),
                              if (addAds.AgeOfRealEstateAddAds != 0)
                                TableRow(
                                  decoration: BoxDecoration(
                                    color: Color(0xffffffff),
                                  ),
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(5, 5, 5, 5),
                                      child: Text(
                                        AppLocalizations.of(context)
                                            .ageOfRealEstate,
                                        style: GoogleFonts.tajawal(
                                          fontSize: 15,
                                          color: const Color(0xff989696),
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    if (addAds.AgeOfRealEstateAddAds <= 1)
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            5, 5, 5, 5),
                                        child: Text(
                                          AppLocalizations.of(context).neww,
                                          style: GoogleFonts.tajawal(
                                            fontSize: 15,
                                            color: const Color(0xff989696),
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      )
                                    else
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            5, 5, 5, 5),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      0, 5, 5, 5),
                                              child: Text(
                                                AppLocalizations.of(context)
                                                    .year,
                                                style: GoogleFonts.tajawal(
                                                  fontSize: 15,
                                                  color:
                                                      const Color(0xff989696),
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                            Text(
                                              addAds.AgeOfRealEstateAddAds
                                                      .floor()
                                                  .toString(),
                                              style: GoogleFonts.tajawal(
                                                fontSize: 15,
                                                color: const Color(0xff989696),
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ],
                                        ),
                                      ),
                                  ],
                                ),
                              if (addAds.ApartmentsAddAds != 0)
                                TableRow(
                                  decoration: BoxDecoration(
                                    color: Color(0xfff2f2f2),
                                  ),
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(5, 5, 5, 5),
                                      child: Text(
                                        AppLocalizations.of(context).apartments,
                                        style: GoogleFonts.tajawal(
                                          fontSize: 15,
                                          color: const Color(0xff989696),
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(5, 5, 5, 5),
                                      child: Text(
                                        addAds.ApartmentsAddAds.floor()
                                            .toString(),
                                        style: GoogleFonts.tajawal(
                                          fontSize: 15,
                                          color: const Color(0xff989696),
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ],
                                ),
                              if (addAds.StoresAddAds != 0)
                                TableRow(
                                  decoration: BoxDecoration(
                                    color: Color(0xffffffff),
                                  ),
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(5, 5, 5, 5),
                                      child: Text(
                                        AppLocalizations.of(context).stores,
                                        style: GoogleFonts.tajawal(
                                          fontSize: 15,
                                          color: const Color(0xff989696),
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(5, 5, 5, 5),
                                      child: Text(
                                        addAds.StoresAddAds.floor().toString(),
                                        style: GoogleFonts.tajawal(
                                          fontSize: 15,
                                          color: const Color(0xff989696),
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ],
                                ),
                              if (addAds.WellsAddAds != 0)
                                TableRow(
                                  decoration: BoxDecoration(
                                    color: Color(0xfff2f2f2),
                                  ),
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(5, 5, 5, 5),
                                      child: Text(
                                        AppLocalizations.of(context).wells,
                                        style: GoogleFonts.tajawal(
                                          fontSize: 15,
                                          color: const Color(0xff989696),
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(5, 5, 5, 5),
                                      child: Text(
                                        addAds.WellsAddAds.floor().toString(),
                                        style: GoogleFonts.tajawal(
                                          fontSize: 15,
                                          color: const Color(0xff989696),
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ],
                                ),
                              if (addAds.TreesAddAds != 0)
                                TableRow(
                                  decoration: BoxDecoration(
                                    color: Color(0xffffffff),
                                  ),
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(5, 5, 5, 5),
                                      child: Text(
                                        AppLocalizations.of(context).trees,
                                        style: GoogleFonts.tajawal(
                                          fontSize: 15,
                                          color: const Color(0xff989696),
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(5, 5, 5, 5),
                                      child: Text(
                                        addAds.TreesAddAds.floor().toString(),
                                        style: GoogleFonts.tajawal(
                                          fontSize: 15,
                                          color: const Color(0xff989696),
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ],
                                ),
                              if (addAds.FloorAddAds != 0)
                                TableRow(
                                  decoration: BoxDecoration(
                                    color: Color(0xfff2f2f2),
                                  ),
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(5, 5, 5, 5),
                                      child: Text(
                                        AppLocalizations.of(context).floor,
                                        style: GoogleFonts.tajawal(
                                          fontSize: 15,
                                          color: const Color(0xff989696),
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    if (addAds.FloorAddAds == 1)
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            5, 5, 5, 5),
                                        child: Text(
                                          AppLocalizations.of(context)
                                              .groundFloor,
                                          style: GoogleFonts.tajawal(
                                            fontSize: 15,
                                            color: const Color(0xff989696),
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      )
                                    else if (addAds.FloorAddAds == 2)
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            5, 5, 5, 5),
                                        child: Text(
                                          AppLocalizations.of(context).first,
                                          style: GoogleFonts.tajawal(
                                            fontSize: 15,
                                            color: const Color(0xff989696),
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      )
                                    else
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            5, 5, 5, 5),
                                        child: Text(
                                          addAds.FloorAddAds.floor().toString(),
                                          style: GoogleFonts.tajawal(
                                            fontSize: 15,
                                            color: const Color(0xff989696),
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                  ],
                                ),
                              if (addAds.StreetWidthAddAds != 0)
                                TableRow(
                                  decoration: BoxDecoration(
                                    color: Color(0xffffffff),
                                  ),
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(5, 5, 5, 5),
                                      child: Text(
                                        AppLocalizations.of(context)
                                            .streetWidth,
                                        style: GoogleFonts.tajawal(
                                          fontSize: 15,
                                          color: const Color(0xff989696),
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(5, 5, 5, 5),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Text(
                                            addAds.StreetWidthAddAds.floor()
                                                .toString(),
                                            style: GoogleFonts.tajawal(
                                              fontSize: 13,
                                              color: const Color(0xff989696),
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                0, 5, 5, 5),
                                            child: Text(
                                              AppLocalizations.of(context).m,
                                              style: GoogleFonts.tajawal(
                                                fontSize: 15,
                                                color: const Color(0xff989696),
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              if (addAds.isFurnishedAddAds == true)
                                TableRow(
                                  decoration: BoxDecoration(
                                    color: Color(0xfff2f2f2),
                                  ),
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(5, 5, 5, 5),
                                      child: Text(
                                        AppLocalizations.of(context).furnished,
                                        style: GoogleFonts.tajawal(
                                          fontSize: 15,
                                          color: const Color(0xff989696),
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(5, 5, 5, 5),
                                      child: Icon(
                                        Icons.done_rounded,
                                        color: Color(0xff00cccc),
                                        size: 30,
                                      ),
                                    ),
                                  ],
                                ),
                              if (addAds.isKitchenAddAds == true)
                                TableRow(
                                  decoration: BoxDecoration(
                                    color: Color(0xffffffff),
                                  ),
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(5, 5, 5, 5),
                                      child: Text(
                                        AppLocalizations.of(context).kitchen,
                                        style: GoogleFonts.tajawal(
                                          fontSize: 15,
                                          color: const Color(0xff989696),
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(5, 5, 5, 5),
                                      child: Icon(
                                        Icons.done_rounded,
                                        color: Color(0xff00cccc),
                                        size: 30,
                                      ),
                                    ),
                                  ],
                                ),
                              if (addAds.isAppendixAddAds == true)
                                TableRow(
                                  decoration: BoxDecoration(
                                    color: Color(0xfff2f2f2),
                                  ),
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(5, 5, 5, 5),
                                      child: Text(
                                        AppLocalizations.of(context).appendix,
                                        style: GoogleFonts.tajawal(
                                          fontSize: 15,
                                          color: const Color(0xff989696),
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(5, 5, 5, 5),
                                      child: Icon(
                                        Icons.done_rounded,
                                        color: Color(0xff00cccc),
                                        size: 30,
                                      ),
                                    ),
                                  ],
                                ),
                              if (addAds.isCarEntranceAddAds == true)
                                TableRow(
                                  decoration: BoxDecoration(
                                    color: Color(0xffffffff),
                                  ),
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(5, 5, 5, 5),
                                      child: Text(
                                        AppLocalizations.of(context)
                                            .carEntrance,
                                        style: GoogleFonts.tajawal(
                                          fontSize: 15,
                                          color: const Color(0xff989696),
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(5, 5, 5, 5),
                                      child: Icon(
                                        Icons.done_rounded,
                                        color: Color(0xff00cccc),
                                        size: 30,
                                      ),
                                    ),
                                  ],
                                ),
                              if (addAds.isElevatorAddAds == true)
                                TableRow(
                                  decoration: BoxDecoration(
                                    color: Color(0xfff2f2f2),
                                  ),
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(5, 5, 5, 5),
                                      child: Text(
                                        AppLocalizations.of(context).elevator,
                                        style: GoogleFonts.tajawal(
                                          fontSize: 15,
                                          color: const Color(0xff989696),
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(5, 5, 5, 5),
                                      child: Icon(
                                        Icons.done_rounded,
                                        color: Color(0xff00cccc),
                                        size: 30,
                                      ),
                                    ),
                                  ],
                                ),
                              if (addAds.isConditionerAddAds == true)
                                TableRow(
                                  decoration: BoxDecoration(
                                    color: Color(0xffffffff),
                                  ),
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(5, 5, 5, 5),
                                      child: Text(
                                        AppLocalizations.of(context)
                                            .conditioner,
                                        style: GoogleFonts.tajawal(
                                          fontSize: 15,
                                          color: const Color(0xff989696),
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(5, 5, 5, 5),
                                      child: Icon(
                                        Icons.done_rounded,
                                        color: Color(0xff00cccc),
                                        size: 30,
                                      ),
                                    ),
                                  ],
                                ),
                              if (addAds.isHallStaircaseAddAds == true)
                                TableRow(
                                  decoration: BoxDecoration(
                                    color: Color(0xfff2f2f2),
                                  ),
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(5, 5, 5, 5),
                                      child: Text(
                                        AppLocalizations.of(context)
                                            .hallStaircase,
                                        style: GoogleFonts.tajawal(
                                          fontSize: 15,
                                          color: const Color(0xff989696),
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(5, 5, 5, 5),
                                      child: Icon(
                                        Icons.done_rounded,
                                        color: Color(0xff00cccc),
                                        size: 30,
                                      ),
                                    ),
                                  ],
                                ),
                              if (addAds.isDuplexAddAds == true)
                                TableRow(
                                  decoration: BoxDecoration(
                                    color: Color(0xffffffff),
                                  ),
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(5, 5, 5, 5),
                                      child: Text(
                                        AppLocalizations.of(context).duplex,
                                        style: GoogleFonts.tajawal(
                                          fontSize: 15,
                                          color: const Color(0xff989696),
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(5, 5, 5, 5),
                                      child: Icon(
                                        Icons.done_rounded,
                                        color: Color(0xff00cccc),
                                        size: 30,
                                      ),
                                    ),
                                  ],
                                ),
                              if (addAds.isDriverRoomAddAds == true)
                                TableRow(
                                  decoration: BoxDecoration(
                                    color: Color(0xfff2f2f2),
                                  ),
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(5, 5, 5, 5),
                                      child: Text(
                                        AppLocalizations.of(context).driverRoom,
                                        style: GoogleFonts.tajawal(
                                          fontSize: 15,
                                          color: const Color(0xff989696),
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(5, 5, 5, 5),
                                      child: Icon(
                                        Icons.done_rounded,
                                        color: Color(0xff00cccc),
                                        size: 30,
                                      ),
                                    ),
                                  ],
                                ),
                              if (addAds.isSwimmingPoolAddAds == true)
                                TableRow(
                                  decoration: BoxDecoration(
                                    color: Color(0xffffffff),
                                  ),
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(5, 5, 5, 5),
                                      child: Text(
                                        AppLocalizations.of(context)
                                            .swimmingPool,
                                        style: GoogleFonts.tajawal(
                                          fontSize: 15,
                                          color: const Color(0xff989696),
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(5, 5, 5, 5),
                                      child: Icon(
                                        Icons.done_rounded,
                                        color: Color(0xff00cccc),
                                        size: 30,
                                      ),
                                    ),
                                  ],
                                ),
                              if (addAds.isMaidRoomAddAds == true)
                                TableRow(
                                  decoration: BoxDecoration(
                                    color: Color(0xfff2f2f2),
                                  ),
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(5, 5, 5, 5),
                                      child: Text(
                                        AppLocalizations.of(context).maidRoom,
                                        style: GoogleFonts.tajawal(
                                          fontSize: 15,
                                          color: const Color(0xff989696),
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(5, 5, 5, 5),
                                      child: Icon(
                                        Icons.done_rounded,
                                        color: Color(0xff00cccc),
                                        size: 30,
                                      ),
                                    ),
                                  ],
                                ),
                              if (addAds.isMonstersAddAds == true)
                                TableRow(
                                  decoration: BoxDecoration(
                                    color: Color(0xffffffff),
                                  ),
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(5, 5, 5, 5),
                                      child: Text(
                                        AppLocalizations.of(context).yard,
                                        style: GoogleFonts.tajawal(
                                          fontSize: 15,
                                          color: const Color(0xff989696),
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(5, 5, 5, 5),
                                      child: Icon(
                                        Icons.done_rounded,
                                        color: Color(0xff00cccc),
                                        size: 30,
                                      ),
                                    ),
                                  ],
                                ),
                              if (addAds.isVerseAddAds == true)
                                TableRow(
                                  decoration: BoxDecoration(
                                    color: Color(0xfff2f2f2),
                                  ),
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(5, 5, 5, 5),
                                      child: Text(
                                        AppLocalizations.of(context).verse,
                                        style: GoogleFonts.tajawal(
                                          fontSize: 15,
                                          color: const Color(0xff989696),
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(5, 5, 5, 5),
                                      child: Icon(
                                        Icons.done_rounded,
                                        color: Color(0xff00cccc),
                                        size: 30,
                                      ),
                                    ),
                                  ],
                                ),
                              if (addAds.isCellarAddAds == true)
                                TableRow(
                                  decoration: BoxDecoration(
                                    color: Color(0xffffffff),
                                  ),
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(5, 5, 5, 5),
                                      child: Text(
                                        AppLocalizations.of(context).cellar,
                                        style: GoogleFonts.tajawal(
                                          fontSize: 15,
                                          color: const Color(0xff989696),
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(5, 5, 5, 5),
                                      child: Icon(
                                        Icons.done_rounded,
                                        color: Color(0xff00cccc),
                                        size: 30,
                                      ),
                                    ),
                                  ],
                                ),
                              if (addAds.isFamilyPartitionAddAds == true)
                                TableRow(
                                  decoration: BoxDecoration(
                                    color: Color(0xfff2f2f2),
                                  ),
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(5, 5, 5, 5),
                                      child: Text(
                                        AppLocalizations.of(context)
                                            .familyPartition,
                                        style: GoogleFonts.tajawal(
                                          fontSize: 15,
                                          color: const Color(0xff989696),
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(5, 5, 5, 5),
                                      child: Icon(
                                        Icons.done_rounded,
                                        color: Color(0xff00cccc),
                                        size: 30,
                                      ),
                                    ),
                                  ],
                                ),
                              if (addAds.isAmusementParkAddAds == true)
                                TableRow(
                                  decoration: BoxDecoration(
                                    color: Color(0xffffffff),
                                  ),
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(5, 5, 5, 5),
                                      child: Text(
                                        AppLocalizations.of(context)
                                            .amusementPark,
                                        style: GoogleFonts.tajawal(
                                          fontSize: 15,
                                          color: const Color(0xff989696),
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(5, 5, 5, 5),
                                      child: Icon(
                                        Icons.done_rounded,
                                        color: Color(0xff00cccc),
                                        size: 30,
                                      ),
                                    ),
                                  ],
                                ),
                              if (addAds.isVolleyballCourtAddAds == true)
                                TableRow(
                                  decoration: BoxDecoration(
                                    color: Color(0xfff2f2f2),
                                  ),
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(5, 5, 5, 5),
                                      child: Text(
                                        AppLocalizations.of(context)
                                            .volleyballCourt,
                                        style: GoogleFonts.tajawal(
                                          fontSize: 15,
                                          color: const Color(0xff989696),
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(5, 5, 5, 5),
                                      child: Icon(
                                        Icons.done_rounded,
                                        color: Color(0xff00cccc),
                                        size: 30,
                                      ),
                                    ),
                                  ],
                                ),
                              if (addAds.isFootballCourtAddAds == true)
                                TableRow(
                                  decoration: BoxDecoration(
                                    color: Color(0xffffffff),
                                  ),
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(5, 5, 5, 5),
                                      child: Text(
                                        AppLocalizations.of(context)
                                            .footballCourt,
                                        style: GoogleFonts.tajawal(
                                          fontSize: 15,
                                          color: const Color(0xff989696),
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(5, 5, 5, 5),
                                      child: Icon(
                                        Icons.done_rounded,
                                        color: Color(0xff00cccc),
                                        size: 30,
                                      ),
                                    ),
                                  ],
                                ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                AppLocalizations.of(context).desc,
                                style: GoogleFonts.tajawal(
                                  fontSize: 15,
                                  color: const Color(0xff000000),
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Flexible(
                                child: Text(
                                  addAds.detailsAqarAddAds,
                                  style: GoogleFonts.tajawal(
                                    fontSize: 15,
                                    color: const Color(0xff000000),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        CheckboxListTile(
                          activeColor: const Color(0xff00cccc),
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                AppLocalizations.of(context).accept,
                                style: GoogleFonts.tajawal(
                                  fontSize: 13,
                                  color: const Color(0xff000000),
                                ),
                                textAlign: TextAlign.right,
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => TermsOfUse()),
                                  );
                                },
                                child: Text(
                                  AppLocalizations.of(context).usageTerms,
                                  style: GoogleFonts.tajawal(
                                    fontSize: 13,
                                    color: Colors.blue,
                                  ),
                                  textAlign: TextAlign.right,
                                ),
                              ),
                              Text(
                                AppLocalizations.of(context).committed,
                                style: GoogleFonts.tajawal(
                                  fontSize: 13,
                                  color: const Color(0xff000000),
                                ),
                                textAlign: TextAlign.right,
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => AdvertisingFee()),
                                  );
                                },
                                child: Text(
                                  AppLocalizations.of(context).advFees,
                                  style: GoogleFonts.tajawal(
                                    fontSize: 13,
                                    color: Colors.blue,
                                  ),
                                  textAlign: TextAlign.right,
                                ),
                              ),
                            ],
                          ),
                          value: addAds.AcceptedAddAds,
                          onChanged: (bool value) {
                            addAds.setAcceptedAddAds(value);
                          },
                        ),
                        if (addAds.AcceptedAddAds == true)
                          TextButton(
                            onPressed: () {
                              addAds.setAcceptedAddAds(false);
                              addAds.addNewAd(
                                context,
                                addAds.detailsAqarAddAds,
                                addAds.isFootballCourtAddAds.toString(),
                                addAds.isVolleyballCourtAddAds.toString(),
                                addAds.isAmusementParkAddAds.toString(),
                                addAds.isFamilyPartitionAddAds.toString(),
                                addAds.isVerseAddAds.toString(),
                                addAds.isCellarAddAds.toString(),
                                addAds.isMonstersAddAds.toString(),
                                addAds.isMaidRoomAddAds.toString(),
                                addAds.isSwimmingPoolAddAds.toString(),
                                addAds.isDriverRoomAddAds.toString(),
                                addAds.isDuplexAddAds.toString(),
                                addAds.isHallStaircaseAddAds.toString(),
                                addAds.isConditionerAddAds.toString(),
                                addAds.isElevatorAddAds.toString(),
                                addAds.isCarEntranceAddAds.toString(),
                                addAds.isAppendixAddAds.toString(),
                                addAds.isKitchenAddAds.toString(),
                                addAds.isFurnishedAddAds.toString(),
                                addAds.StreetWidthAddAds.toString(),
                                addAds.FloorAddAds.toString(),
                                addAds.TreesAddAds.toString(),
                                addAds.WellsAddAds.toString(),
                                addAds.StoresAddAds.toString(),
                                addAds.ApartmentsAddAds.toString(),
                                addAds.AgeOfRealEstateAddAds.toString(),
                                addAds.RoomsAddAds.toString(),
                                addAds.ToiletsAddAds.toString(),
                                addAds.LoungesAddAds.toString(),
                                addAds.selectedTypeAqarAddAds.toString(),
                                addAds.selectedFamilyAddAds.toString(),
                                addAds.interfaceSelectedAddAds,
                                addAds.totalSpaceAddAds,
                                addAds.totalPricAddAds,
                                addAds.selectedPlanAddAds.toString(),
                                addAds.id_category_finalAddAds.toString(),
                                addAds.ads_cordinates_latAddAds.toString(),
                                addAds.ads_cordinates_lngAddAds.toString(),
                                null,
                                null,
                                Provider.of<UserProvider>(context,
                                        listen: false)
                                    .phone,
                                addAds.ads_cityAddAds,
                                addAds.ads_neighborhoodAddAds,
                                addAds.ads_roadAddAds,
                                addAds.videoAddAds,
                                addAds.imagesListAddAds,
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 15, 0, 30),
                              child: Container(
                                width: mediaQuery.size.width * 0.6,
                                height: 40.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  color: const Color(0xffffffff),
                                  border: Border.all(
                                      width: 1.0,
                                      color: const Color(0xff3f9d28)),
                                ),
                                child: Center(
                                  child: Text(
                                    AppLocalizations.of(context)
                                        .postAdvertisement,
                                    style: GoogleFonts.tajawal(
                                      fontSize: 15,
                                      color: const Color(0xff3f9d28),
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        if (addAds.AcceptedAddAds == false)
                          TextButton(
                            onPressed: () {
                              Fluttertoast.showToast(
                                  msg:
                                      'من فضلك وافق على شروط الاستخدام ورسوم الإعلان للمتابعة',
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 15.0);
                            },
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 15, 0, 30),
                              child: Container(
                                width: mediaQuery.size.width * 0.6,
                                height: 40.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  color: const Color(0xffffffff),
                                  border: Border.all(
                                      width: 1.0,
                                      color: const Color(0xff989696)),
                                ),
                                child: Center(
                                  child: Text(
                                    AppLocalizations.of(context)
                                        .postAdvertisement,
                                    style: GoogleFonts.tajawal(
                                      fontSize: 15,
                                      color: const Color(0xff989696),
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  //...........end 7 review ads screen.............
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}

class Utils {
  static String mapStyle = '''
  []
  ''';
}

final Uri _emailLaunchUri = Uri(
    scheme: 'mailto',
    path: 'support@tadawl.com.sa',
    queryParameters: {'subject': 'تطبيق تداول العقاري - الحلول التسويقية'});
