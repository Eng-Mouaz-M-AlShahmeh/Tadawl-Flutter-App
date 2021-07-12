/*
Developed by: Eng Mouaz M. Al-Shahmeh
*/
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_simple_rating_bar/flutter_simple_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jiffy/jiffy.dart';
import 'package:pinch_zoom_image_last/pinch_zoom_image_last.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';
//import 'package:tadawl_app/mainWidgets/openMap.dart';
import 'package:tadawl_app/mainWidgets/views_chart.dart';
import 'package:tadawl_app/models/views_series.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tadawl_app/provider/ads_provider.dart';
import 'package:tadawl_app/provider/locale_provider.dart';
import 'package:tadawl_app/provider/user_provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:qr_flutter/qr_flutter.dart';

class Constants {
  static const String editGallery = 'تعديل الصور والفيديو';
  static const String editLocation = 'تعديل الموقع';
  static const String editDetails = 'تعديل التفاصيل';
  static const String deleteAd = 'حذف الإعلان';
  static const List<String> choices = <String>[
    editGallery,
    editLocation,
    editDetails,
    deleteAd,
  ];
}

class EngConstants {
  static const String editGallery = 'Update Images and Videos';
  static const String editLocation = 'Update Location';
  static const String editDetails = 'Update Details';
  static const String deleteAd = 'Delete Ad';
  static const List<String> choices = <String>[
    editGallery,
    editLocation,
    editDetails,
    deleteAd,
  ];
}

List<ViewsSeriesModel> dataa = [
  ViewsSeriesModel(
      day: 'الأحد',
      views: 50,
      barColor: charts.ColorUtil.fromDartColor(Color(0xff00cccc))),
  ViewsSeriesModel(
      day: 'الاثنين',
      views: 3000,
      barColor: charts.ColorUtil.fromDartColor(Color(0xff00cccc))),
  ViewsSeriesModel(
      day: 'الثلاثاء',
      views: 2000,
      barColor: charts.ColorUtil.fromDartColor(Color(0xff00cccc))),
  ViewsSeriesModel(
      day: 'الأربعاء',
      views: 2500,
      barColor: charts.ColorUtil.fromDartColor(Color(0xff00cccc))),
  ViewsSeriesModel(
      day: 'الخميس',
      views: 10000,
      barColor: charts.ColorUtil.fromDartColor(Color(0xff00cccc))),
  ViewsSeriesModel(
      day: 'الجمعة',
      views: 2000,
      barColor: charts.ColorUtil.fromDartColor(Color(0xff1f2835))),
  ViewsSeriesModel(
      day: 'السبت',
      views: 1500,
      barColor: charts.ColorUtil.fromDartColor(Color(0xff1f2835))),
];

class AdPage extends StatelessWidget {
  AdPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return Consumer<AdsProvider>(builder: (context, adsPage, child) {

      void _launchQRLink() async {
        await adsPage.stopVideoAdsPage();
        var url = '${adsPage.qrData}';
        if (await canLaunch(url)) {
          await launch(url);
        } else {
          throw 'Could not launch $url';
        }
      }

      void _launchZain() async {
        await adsPage.stopVideoAdsPage();
        const url = 'https://sa.zain.com/ar/coverage-map';
        if (await canLaunch(url)) {
          await launch(url);
        } else {
          throw 'Could not launch $url';
        }
      }

      void _launchSTC() async {
        await adsPage.stopVideoAdsPage();
        const url =
            'https://www.stc.com.sa/wps/wcm/connect/arabic/helpAndSupport/storelocator';
        if (await canLaunch(url)) {
          await launch(url);
        } else {
          throw 'Could not launch $url';
        }
      }

      Future<void> _openMap(double latitude, double longitude) async {
        var googleUrl =
        'https://www.google.com/maps/dir/?api=1&destination=$latitude,$longitude';
           // 'https://www.google.com/maps/search/?provider.api=1&query=$latitude,$longitude';
        if (await canLaunch(googleUrl)) {
          await launch(googleUrl);
        } else {
          throw 'Could not open the map.';
        }
      }

      // ignore: missing_return
      Future<bool> _onBackPressed() async {
        if (adsPage.videoControllerAdsPage != null) {
          await adsPage.stopVideoAdsPage();
        }
        Navigator.pop(context);
      }

      var _phone = Provider.of<UserProvider>(context, listen: false).phone;

      void _onMapCreated(GoogleMapController controller) {
        controller.setMapStyle(Utils.mapStyle);
      }

      var provider = Provider.of<LocaleProvider>(context, listen: false);
      var _lang = provider.locale.toString();
      if (_lang != 'en_US') {
        Jiffy.locale('ar');
      } else if (_lang == 'en_US') {
        Jiffy.locale('en');
      }

      return WillPopScope(
        onWillPop: _onBackPressed,
        child: Scaffold(
          backgroundColor: const Color(0xffffffff),
          appBar: AppBar(
            actions: [
              adsPage.adsUser.isNotEmpty
                  ? adsPage.adsUser.first.phone == _phone
                      ? Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: PopupMenuButton<String>(
                            icon: Icon(
                              Icons.edit,
                              color: Color(0xffffffff),
                              size: 40,
                            ),
                            onSelected: (String choice) {
                              adsPage.choiceAction(
                                  context, choice, adsPage.idDescription);
                            },
                            itemBuilder: (BuildContext context) {
                              if (_lang != 'en_US') {
                                return Constants.choices.map((String choice) {
                                  if (choice == Constants.deleteAd) {
                                    return PopupMenuItem<String>(
                                      value: choice,
                                      child: Text(
                                        choice,
                                        style: GoogleFonts.tajawal(
                                          fontSize: 20,
                                          color: const Color(0xffff0000),
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                    );
                                  } else {
                                    return PopupMenuItem<String>(
                                      value: choice,
                                      child: Text(
                                        choice,
                                        style: GoogleFonts.tajawal(
                                          fontSize: 20,
                                          color: const Color(0xff989898),
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                    );
                                  }
                                }).toList();
                              } else {
                                return EngConstants.choices
                                    .map((String choice) {
                                  if (choice == EngConstants.deleteAd) {
                                    return PopupMenuItem<String>(
                                      value: choice,
                                      child: Text(
                                        choice,
                                        style: GoogleFonts.tajawal(
                                          fontSize: 20,
                                          color: const Color(0xffff0000),
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                    );
                                  } else {
                                    return PopupMenuItem<String>(
                                      value: choice,
                                      child: Text(
                                        choice,
                                        style: GoogleFonts.tajawal(
                                          fontSize: 20,
                                          color: const Color(0xff989898),
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                    );
                                  }
                                }).toList();
                              }
                            },
                          ),
                        )
                      : Container()
                  : Container(),
            ],
            leadingWidth: 100.0,
            toolbarHeight: 100.0,
            title: adsPage.is_favAdsPage == 0
                ? Padding(
                    padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
                    child: InkWell(
                      onTap: () {
                        adsPage.stopVideoAdsPage();
                        adsPage.changeAdsFavState(context, 1);
                      },
                      child: Icon(
                        Icons.star_border_rounded,
                        color: Color(0xffe6e600),
                        size: 50,
                      ),
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
                    child: InkWell(
                      onTap: () {
                        adsPage.stopVideoAdsPage();
                        adsPage.changeAdsFavState(context, 0);
                      },
                      child: Icon(
                        Icons.star_rounded,
                        color: Color(0xffe6e600),
                        size: 50,
                      ),
                    ),
                  ),
            leading: Padding(
              padding: const EdgeInsets.all(15.0),
              child: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Color(0xffffffff),
                  size: 40,
                ),
                onPressed: () {
                  if (adsPage.videoControllerAdsPage != null) {
                    adsPage.stopVideoAdsPage();
                  }
                  Navigator.pop(context);
                },
              ),
            ),
            backgroundColor: Color(0xff00cccc),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                if (adsPage.adsPage.isNotEmpty)
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            if (adsPage.adsPage.first.idSpecial == '1')
                              Padding(
                                padding: const EdgeInsets.fromLTRB(5, 0, 10, 0),
                                child: Icon(
                                  Icons.verified,
                                  color: Color(0xffe6e600),
                                  size: 30,
                                ),
                              ),
                            Text(
                              adsPage.adsPage.first.title ?? '',
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
                        padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              adsPage.adsPage.first.price ?? '',
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
                            if (adsPage.adsPage.first.idTypeRes == '1')
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                                child: Text(
                                  AppLocalizations.of(context).daily,
                                  style: GoogleFonts.tajawal(
                                    fontSize: 20,
                                    color: const Color(0xff00cccc),
                                  ),
                                  textAlign: TextAlign.center,
                                  textDirection: TextDirection.rtl,
                                ),
                              ),
                            if (adsPage.adsPage.first.idTypeRes == '2')
                              Padding(
                                padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                                child: Text(
                                  AppLocalizations.of(context).monthly,
                                  style: GoogleFonts.tajawal(
                                    fontSize: 20,
                                    color: const Color(0xff00cccc),
                                  ),
                                  textAlign: TextAlign.center,
                                  textDirection: TextDirection.rtl,
                                ),
                              ),
                            if (adsPage.adsPage.first.idTypeRes == '3')
                              Padding(
                                padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                                child: Text(
                                  AppLocalizations.of(context).annual,
                                  style: GoogleFonts.tajawal(
                                    fontSize: 20,
                                    color: const Color(0xff00cccc),
                                  ),
                                  textAlign: TextAlign.center,
                                  textDirection: TextDirection.rtl,
                                ),
                              ),
                          ],
                        ),
                      ),
                      if (adsPage.adsPage.first.video.isNotEmpty)
                        FutureBuilder(
                            future: adsPage.initializeFutureVideoPlyerAdsPage,
                            builder: (context, snapshot) {
                              if (snapshot.connectionState == ConnectionState.done) {
                                return Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(8, 8, 8, 8),
                                  child: SizedBox(
                                    width: mediaQuery.size.width,
                                    height: 400,
                                    child: AspectRatio(
                                      aspectRatio: adsPage
                                          .videoControllerAdsPage
                                          .value
                                          .aspectRatio,
                                      child: Stack(
                                        children: [
                                          Column(
                                            children: <Widget>[
                                              Expanded(
                                                child: Center(
                                                  child: adsPage.chewieControllerAdsPage !=
                                                              null &&
                                                          adsPage
                                                              .chewieControllerAdsPage
                                                              .videoPlayerController
                                                              .value
                                                              .initialized
                                                      ? Chewie(
                                                          controller: adsPage
                                                              .chewieControllerAdsPage,
                                                        )
                                                      : Container(),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                5, 300, 300, 5),
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
                                      ),
                                    ),
                                  ),
                                );
                              } else {
                                return Container();
                              }
                            }),
                      if (adsPage.adsPageImages.isNotEmpty)
                        Container(
                          width: mediaQuery.size.width,
                          height: mediaQuery.size.height * 0.3,
                          child: Stack(
                            children: [
                              Container(
                                  width: mediaQuery.size.width,
                                  height: mediaQuery.size.height * 0.3,
                                  child: PageView.builder(
                                    itemCount: adsPage.countAdsPageImages(),
                                    itemBuilder: (context, position) {
                                      return Stack(
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              adsPage.stopVideoAdsPage();
                                              adsPage.getImagesAdsPageInfo(context, adsPage.idDescription);
                                              Navigator.pushNamed(
                                                  context, '/main/open_images',
                                                  arguments: {
                                                    'id_description':
                                                        adsPage.idDescription,
                                                  });
                                            },
                                            child: PinchZoomImage(
                                              image: Image.network(
                                                'https://tadawl.com.sa/API/assets/images/ads/${adsPage.adsPageImages[position].ads_image}',
                                                width: mediaQuery.size.width,
                                                height: mediaQuery.size.height *
                                                    0.3,
                                                fit: BoxFit.cover,
                                              ),
                                              zoomedBackgroundColor:
                                                  Color.fromRGBO(
                                                      240, 240, 240, 1.0),
                                              hideStatusBarWhileZooming: true,
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                adsPage.randdLeft,
                                                adsPage.randdTop,
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
                                      adsPage.currentControllerPageAdsPageFunc(
                                          index);
                                      adsPage.randomPosition(200);
                                    },
                                    controller: adsPage.controllerAdsPage,
                                  )),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                      height: 19,
                                      child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, indexListView) {
                                          return Padding(
                                            padding: const EdgeInsets.all(4),
                                            child: Container(
                                              width: 10,
                                              height: 10,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(30),
                                                  color:
                                                      adsPage.currentControllerPageAdsPage ==
                                                              indexListView
                                                          ? Color(0xff00cccc)
                                                          : Colors.grey),
                                            ),
                                          );
                                        },
                                        itemCount: adsPage.countAdsPageImages(),
                                      )),
                                ),
                              ),
                            ],
                          ),
                        ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                              onPressed: () {
                                adsPage.stopVideoAdsPage();
                                Share.share('${adsPage.qrData}');
                              },
                              child: Text(
                                '${adsPage.adsPage.first.ads_city} - ${adsPage.adsPage.first.ads_neighborhood} - ${adsPage.adsPage.first.ads_road}',
                                style: GoogleFonts.tajawal(
                                  fontSize: 11,
                                  color: Colors.grey,
                                ),
                                textAlign: TextAlign.right,
                              ),
                            ),
                            TextButton(
                              child: Icon(
                                Icons.share,
                                color: Colors.grey,
                                size: 40,
                              ),
                              onPressed: () {
                                adsPage.stopVideoAdsPage();
                                Share.share('${adsPage.qrData}');
                              },
                            ),
                          ],
                        ),
                      ),
                      if (adsPage.adsUser.isNotEmpty)
                        if (adsPage.adsUser.first.phone == _phone)
                          Padding(
                            padding: const EdgeInsets.fromLTRB(65, 15, 65, 0),
                            child: Container(
                              width: mediaQuery.size.width,
                              height: 40.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                border: Border.all(
                                    width: 1.0, color: const Color(0xffe6e600)),
                              ),
                              child: Center(
                                child: Text(
                                  AppLocalizations.of(context).advUpgrade,
                                  style: GoogleFonts.tajawal(
                                    fontSize: 15,
                                    color: const Color(0xffe6e600),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          )
                        else
                          Container(),
                      if (adsPage.adsVR.isNotEmpty)
                        Padding(
                          padding: const EdgeInsets.fromLTRB(65, 15, 65, 0),
                          child: Column(
                            children: [
                              if (adsPage.adsVR.first.state_aqar == '1')
                                Container(
                                  width: mediaQuery.size.width,
                                  height: 40.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(
                                        color: const Color(0xff3f9d28),
                                        width: 1),
                                    color: const Color(0xff3f9d28),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 0, 15, 0),
                                        child: Icon(
                                          Icons.verified,
                                          color: Color(0xffffffff),
                                          size: 35,
                                        ),
                                      ),
                                      Text(
                                        AppLocalizations.of(context).verAqar,
                                        style: GoogleFonts.tajawal(
                                          fontSize: 15,
                                          color: const Color(0xffffffff),
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                )
                              else if (adsPage.adsVR.first.state_aqar == '0')
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 10, 20, 0),
                                  child: Text(
                                    AppLocalizations.of(context).rule33,
                                    style: GoogleFonts.tajawal(
                                      fontSize: 15,
                                      color: const Color(0xff989696),
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                            ],
                          ),
                        )
                      else
                        Container(),
                      if (adsPage.adsUser.isNotEmpty)
                        if (adsPage.adsUser.first.phone == _phone)
                          Padding(
                            padding: const EdgeInsets.fromLTRB(65, 15, 65, 0),
                            child: TextButton(
                              onPressed: () {
                                adsPage.stopVideoAdsPage();
                                Navigator.pushNamed(context, '/main/aqar_vr',
                                    arguments: {
                                      'id_description':
                                          adsPage.adsPage.first.idDescription,
                                    });
                              },
                              child: Container(
                                width: double.infinity,
                                height: 40.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  border: Border.all(
                                      width: 1.0,
                                      color: const Color(0xff00cccc)),
                                ),
                                child: Center(
                                  child: Text(
                                    AppLocalizations.of(context).reVR,
                                    style: GoogleFonts.tajawal(
                                      fontSize: 15,
                                      color: const Color(0xff00cccc),
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                          )
                        else
                          Container()
                      else
                        Container(),
                      if (adsPage.adsUser.isNotEmpty)
                        if (adsPage.adsUser.first.phone == _phone)
                          Padding(
                            padding: const EdgeInsets.fromLTRB(65, 15, 65, 0),
                            child: TextButton(
                              onPressed: () {
                                adsPage.stopVideoAdsPage();
                                return showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: Text(
                                      AppLocalizations.of(context).uniqueAdv,
                                      style: GoogleFonts.tajawal(
                                        fontSize: 20,
                                        color: const Color(0xff00cccc),
                                      ),
                                      textAlign: TextAlign.right,
                                    ),
                                    content: Text(
                                      AppLocalizations.of(context).rule34,
                                      style: GoogleFonts.tajawal(
                                        fontSize: 15,
                                        color: const Color(0xff000000),
                                      ),
                                      textAlign: TextAlign.right,
                                      textDirection: TextDirection.rtl,
                                    ),
                                    actions: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            5, 0, 20, 0),
                                        child: GestureDetector(
                                          onTap: () {
                                            Navigator.pushNamed(
                                                context, '/main/aqar_vr',
                                                arguments: {
                                                  'id_description': adsPage
                                                      .adsPage
                                                      .first
                                                      .idDescription,
                                                });
                                          },
                                          child: Text(
                                            AppLocalizations.of(context).reVR,
                                            style: GoogleFonts.tajawal(
                                              fontSize: 15,
                                              color: const Color(0xff00cccc),
                                            ),
                                            textAlign: TextAlign.left,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            20, 0, 5, 0),
                                        child: GestureDetector(
                                          onTap: () =>
                                              Navigator.of(context).pop(false),
                                          child: Text(
                                            AppLocalizations.of(context).undo,
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
                                );
                              },
                              child: Container(
                                width: double.infinity,
                                height: 40.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  border: Border.all(
                                      width: 1.0,
                                      color: const Color(0xff3f9d28)),
                                ),
                                child: Center(
                                  child: Text(
                                    AppLocalizations.of(context).makeUnique,
                                    style: GoogleFonts.tajawal(
                                      fontSize: 15,
                                      color: const Color(0xff3f9d28),
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                          )
                        else
                          Container()
                      else
                        Container(),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: Table(
                          border: TableBorder.all(
                              color: Color(0xffffffff), width: 2),
                          defaultVerticalAlignment:
                              TableCellVerticalAlignment.middle,
                          defaultColumnWidth: FractionColumnWidth(0.5),
                          children: [
                            if (adsPage.adsPage.isNotEmpty)
                              if (adsPage.adsPage.first.idTypeAqar != '0' &&
                                  adsPage.adsPage.first.idTypeAqar != '-1' &&
                                  adsPage.adsPage.first.idTypeAqar != 'null')
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
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          if (adsPage
                                                  .adsPage.first.idTypeAqar ==
                                              '1')
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      0, 5, 5, 5),
                                              child: Text(
                                                AppLocalizations.of(context)
                                                    .commHousing,
                                                style: GoogleFonts.tajawal(
                                                  fontSize: 15,
                                                  color:
                                                      const Color(0xff989696),
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          if (adsPage
                                                  .adsPage.first.idTypeAqar ==
                                              '2')
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      0, 5, 5, 5),
                                              child: Text(
                                                AppLocalizations.of(context)
                                                    .commercial,
                                                style: GoogleFonts.tajawal(
                                                  fontSize: 15,
                                                  color:
                                                      const Color(0xff989696),
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          if (adsPage
                                                  .adsPage.first.idTypeAqar ==
                                              '3')
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      0, 5, 5, 5),
                                              child: Text(
                                                AppLocalizations.of(context)
                                                    .housing,
                                                style: GoogleFonts.tajawal(
                                                  fontSize: 15,
                                                  color:
                                                      const Color(0xff989696),
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                            if (adsPage.adsPage.first.idInterface != '1' &&
                                adsPage.adsPage.first.idInterface != 'null')
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
                                        const EdgeInsets.fromLTRB(5, 0, 5, 0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        if (adsPage.adsPage.first.idInterface ==
                                            '2')
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                0, 5, 5, 5),
                                            child: Text(
                                              AppLocalizations.of(context)
                                                  .north,
                                              style: GoogleFonts.tajawal(
                                                fontSize: 15,
                                                color: const Color(0xff989696),
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          )
                                        else if (adsPage
                                                .adsPage.first.idInterface ==
                                            '3')
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                0, 5, 5, 5),
                                            child: Text(
                                              AppLocalizations.of(context).east,
                                              style: GoogleFonts.tajawal(
                                                fontSize: 15,
                                                color: const Color(0xff989696),
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          )
                                        else if (adsPage
                                                .adsPage.first.idInterface ==
                                            '4')
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                0, 5, 5, 5),
                                            child: Text(
                                              AppLocalizations.of(context).west,
                                              style: GoogleFonts.tajawal(
                                                fontSize: 15,
                                                color: const Color(0xff989696),
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          )
                                        else if (adsPage
                                                .adsPage.first.idInterface ==
                                            '5')
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                0, 5, 5, 5),
                                            child: Text(
                                              AppLocalizations.of(context)
                                                  .south,
                                              style: GoogleFonts.tajawal(
                                                fontSize: 15,
                                                color: const Color(0xff989696),
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          )
                                        else if (adsPage
                                                .adsPage.first.idInterface ==
                                            '6')
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                0, 5, 5, 5),
                                            child: Text(
                                              AppLocalizations.of(context)
                                                  .northeast,
                                              style: GoogleFonts.tajawal(
                                                fontSize: 15,
                                                color: const Color(0xff989696),
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          )
                                        else if (adsPage
                                                .adsPage.first.idInterface ==
                                            '7')
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                0, 5, 5, 5),
                                            child: Text(
                                              AppLocalizations.of(context)
                                                  .southeast,
                                              style: GoogleFonts.tajawal(
                                                fontSize: 15,
                                                color: const Color(0xff989696),
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          )
                                        else if (adsPage
                                                .adsPage.first.idInterface ==
                                            '8')
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                0, 5, 5, 5),
                                            child: Text(
                                              AppLocalizations.of(context)
                                                  .southwest,
                                              style: GoogleFonts.tajawal(
                                                fontSize: 15,
                                                color: const Color(0xff989696),
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          )
                                        else if (adsPage
                                                .adsPage.first.idInterface ==
                                            '9')
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                0, 5, 5, 5),
                                            child: Text(
                                              AppLocalizations.of(context)
                                                  .northwest,
                                              style: GoogleFonts.tajawal(
                                                fontSize: 15,
                                                color: const Color(0xff989696),
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          )
                                        else if (adsPage
                                                .adsPage.first.idInterface ==
                                            '10')
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                0, 5, 5, 5),
                                            child: Text(
                                              AppLocalizations.of(context)
                                                  .threeRoads,
                                              style: GoogleFonts.tajawal(
                                                fontSize: 15,
                                                color: const Color(0xff989696),
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          )
                                        else if (adsPage
                                                .adsPage.first.idInterface ==
                                            '11')
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                0, 5, 5, 5),
                                            child: Text(
                                              AppLocalizations.of(context)
                                                  .fourRoads,
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
                            if (adsPage.adsPage.first.space != 'null')
                              TableRow(
                                decoration: BoxDecoration(
                                  color: Color(0xfff2f2f2),
                                ),
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(5, 0, 5, 0),
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
                                          adsPage.adsPage.first.space ?? '',
                                          style: GoogleFonts.tajawal(
                                            fontSize: 15,
                                            color: const Color(0xff989696),
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              0, 0, 5, 0),
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
                          ],
                        ),
// space ......................
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: Column(
                          children: [
                            if (adsPage.adsQF.isNotEmpty)
                              Table(
                                border: TableBorder.all(
                                    color: Color(0xffffffff), width: 2),
                                defaultVerticalAlignment:
                                    TableCellVerticalAlignment.middle,
                                defaultColumnWidth: FractionColumnWidth(0.5),
                                children: [
                                  for (var i = 0; i < adsPage.adsQF.length; i++)
                                    if (adsPage.adsQF[i].quantity != '0' &&
                                        adsPage.adsQF[i].id_QFAT == '13')
                                      TableRow(
                                        decoration: BoxDecoration(
                                          color: i.isEven
                                              ? Color(0xffffffff)
                                              : Color(0xfff2f2f2),
                                        ),
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                5, 5, 5, 5),
                                            child: Text(
                                              _lang != 'en_US'
                                                  ? adsPage.adsQF[i].title ?? ''
                                                  : adsPage
                                                          .adsQF[i].eng_title ??
                                                      '',
                                              style: GoogleFonts.tajawal(
                                                fontSize: 15,
                                                color: const Color(0xff989696),
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                5, 5, 5, 5),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  adsPage.adsQF[i].quantity,
                                                  style: GoogleFonts.tajawal(
                                                    fontSize: 13,
                                                    color:
                                                        const Color(0xff989696),
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                                Text(
                                                  AppLocalizations.of(context)
                                                      .m,
                                                  style: GoogleFonts.tajawal(
                                                    fontSize: 15,
                                                    color:
                                                        const Color(0xff989696),
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      )
                                    else if (adsPage.adsQF[i].quantity != '-1')
                                      if (adsPage.adsQF[i].quantity != '0' &&
                                          adsPage.adsQF[i].id_QFAT == '11')
                                        TableRow(
                                          decoration: BoxDecoration(
                                            color: i.isEven
                                                ? Color(0xffffffff)
                                                : Color(0xfff2f2f2),
                                          ),
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      5, 5, 5, 5),
                                              child: Text(
                                                _lang != 'en_US'
                                                    ? adsPage.adsQF[i].title ??
                                                        ''
                                                    : adsPage.adsQF[i]
                                                            .eng_title ??
                                                        '',
                                                style: GoogleFonts.tajawal(
                                                  fontSize: 15,
                                                  color:
                                                      const Color(0xff989696),
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      5, 5, 5, 5),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    adsPage.adsQF[i].quantity,
                                                    style: GoogleFonts.tajawal(
                                                      fontSize: 15,
                                                      color: const Color(
                                                          0xff989696),
                                                    ),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                  Text(
                                                    AppLocalizations.of(context)
                                                        .year,
                                                    style: GoogleFonts.tajawal(
                                                      fontSize: 15,
                                                      color: const Color(
                                                          0xff989696),
                                                    ),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        )
                                      else if (adsPage.adsQF[i].quantity !=
                                              '0' &&
                                          adsPage.adsQF[i].id_QFAT == '10')
                                        TableRow(
                                          decoration: BoxDecoration(
                                            color: i.isEven
                                                ? Color(0xffffffff)
                                                : Color(0xfff2f2f2),
                                          ),
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      5, 5, 5, 5),
                                              child: Text(
                                                _lang != 'en_US'
                                                    ? adsPage.adsQF[i].title ??
                                                        ''
                                                    : adsPage.adsQF[i]
                                                            .eng_title ??
                                                        '',
                                                style: GoogleFonts.tajawal(
                                                  fontSize: 15,
                                                  color:
                                                      const Color(0xff989696),
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      5, 5, 5, 5),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  if (adsPage
                                                          .adsQF[i].quantity ==
                                                      '1')
                                                    Text(
                                                      AppLocalizations.of(
                                                              context)
                                                          .groundFloor,
                                                      style:
                                                          GoogleFonts.tajawal(
                                                        fontSize: 15,
                                                        color: const Color(
                                                            0xff989696),
                                                      ),
                                                      textAlign:
                                                          TextAlign.center,
                                                    )
                                                  else if (adsPage
                                                          .adsQF[i].quantity ==
                                                      '2')
                                                    Text(
                                                      AppLocalizations.of(
                                                              context)
                                                          .first,
                                                      style:
                                                          GoogleFonts.tajawal(
                                                        fontSize: 15,
                                                        color: const Color(
                                                            0xff989696),
                                                      ),
                                                      textAlign:
                                                          TextAlign.center,
                                                    )
                                                  else
                                                    Text(
                                                      adsPage.adsQF[i].quantity,
                                                      style:
                                                          GoogleFonts.tajawal(
                                                        fontSize: 15,
                                                        color: const Color(
                                                            0xff989696),
                                                      ),
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        )
                                      else if (adsPage.adsQF[i].quantity != '0')
                                        TableRow(
                                          decoration: BoxDecoration(
                                            color: i.isEven
                                                ? Color(0xffffffff)
                                                : Color(0xfff2f2f2),
                                          ),
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      5, 5, 5, 5),
                                              child: Text(
                                                _lang != 'en_US'
                                                    ? adsPage.adsQF[i].title ??
                                                        ''
                                                    : adsPage.adsQF[i]
                                                            .eng_title ??
                                                        '',
                                                style: GoogleFonts.tajawal(
                                                  fontSize: 15,
                                                  color:
                                                      const Color(0xff989696),
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      5, 5, 5, 5),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    adsPage.adsQF[i].quantity,
                                                    style: GoogleFonts.tajawal(
                                                      fontSize: 15,
                                                      color: const Color(
                                                          0xff989696),
                                                    ),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                ],
                              )
// quatity features ads ...........................
                            else
                              Container(),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: Column(
                          children: [
                            if (adsPage.adsBF.isNotEmpty)
                              Table(
                                border: TableBorder.all(
                                    color: Color(0xffffffff), width: 2),
                                defaultVerticalAlignment:
                                    TableCellVerticalAlignment.middle,
                                defaultColumnWidth: FractionColumnWidth(0.5),
                                children: [
                                  for (var i = 0; i < adsPage.adsBF.length; i++)
                                    if (adsPage.adsBF[i].state == 'true')
                                      TableRow(
                                        decoration: BoxDecoration(
                                          color: i.isOdd
                                              ? Color(0xffffffff)
                                              : Color(0xfff2f2f2),
                                        ),
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                5, 5, 5, 5),
                                            child: Text(
                                              _lang != 'en_US'
                                                  ? adsPage.adsBF[i].title ?? ''
                                                  : adsPage
                                                          .adsBF[i].eng_title ??
                                                      '',
                                              style: GoogleFonts.tajawal(
                                                fontSize: 15,
                                                color: const Color(0xff989696),
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                5, 0, 5, 0),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      5, 0, 5, 0),
                                              child: Icon(
                                                Icons.done_rounded,
                                                color: Color(0xff00cccc),
                                                size: 30,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
// boolean features ads ..............
                                ],
                              )
                            else
                              Container(),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: Column(
                          children: [
                            Table(
                              border: TableBorder.all(
                                  color: Color(0xffffffff), width: 2),
                              defaultVerticalAlignment:
                                  TableCellVerticalAlignment.middle,
                              defaultColumnWidth: FractionColumnWidth(0.5),
                              children: [
                                TableRow(
                                  decoration: BoxDecoration(
                                    color: Color(0xfff2f2f2),
                                  ),
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(5, 5, 5, 5),
                                      child: Text(
                                        AppLocalizations.of(context).views,
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
                                            adsPage.adsPage.first.views ?? '',
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
// views score ............................
                                TableRow(
                                  decoration: BoxDecoration(
                                    color: Color(0xffffffff),
                                  ),
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(5, 5, 5, 5),
                                      child: Text(
                                        AppLocalizations.of(context).advID,
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
                                            adsPage.adsPage.first.idDescription ?? '',
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
// ads number ........................
                              ],
                            ),
                          ],
                        ),
                      ),
// ads add timestamp ....................
                      Padding(
                        padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                              child: Text(
                                AppLocalizations.of(context).advPosted,
                                style: GoogleFonts.tajawal(
                                  fontSize: 15,
                                  color: const Color(0xff989696),
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Padding(
                                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                child: Text(
                                  Jiffy(DateTime.parse(
                                              adsPage.adsPage.first.timeAdded ??
                                                  '')
                                          .add(Duration(hours: 3)))
                                      .fromNow(),
                                  style: GoogleFonts.tajawal(
                                    fontSize: 15,
                                    color: const Color(0xff989696),
                                  ),
                                  textAlign: TextAlign.center,
                                )),
                          ],
                        ),
                      ),
// end ads add timestamp ....................
// last update ads timestamp ....................
                      Padding(
                        padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                              child: Text(
                                AppLocalizations.of(context).lastUpdate,
                                style: GoogleFonts.tajawal(
                                  fontSize: 15,
                                  color: const Color(0xff989696),
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Padding(
                                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                child: Text(
                                  Jiffy(DateTime.parse(adsPage
                                                  .adsPage.first.timeUpdated ??
                                              '')
                                          .add(Duration(hours: 3)))
                                      .fromNow(),
                                  style: GoogleFonts.tajawal(
                                    fontSize: 15,
                                    color: const Color(0xff989696),
                                  ),
                                  textAlign: TextAlign.center,
                                )),
                          ],
                        ),
                      ),
// end last update ads timestamp ....................
// description ...................
                      Padding(
                        padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              AppLocalizations.of(context).desc,
                              style: GoogleFonts.tajawal(
                                fontSize: 20,
                                color: const Color(0xff000000),
                              ),
                              textAlign: TextAlign.center,
                            ),
                            adsPage.adsUser.isNotEmpty
                                ? adsPage.adsUser.first.phone == _phone
                                    ? Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 0, 0, 0),
                                        child: (adsPage.busyAdsPage == true)
                                            ? CircularProgressIndicator()
                                            : TextButton(
                                                onPressed: () {
                                                  adsPage.stopVideoAdsPage();
                                                  adsPage.updateAdsAdsPage(
                                                      context,
                                                      adsPage.adsPage.first
                                                          .id_ads);
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
                                      )
                                    : Container()
                                : Container(),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Flexible(
                              child: Text(
                                adsPage.adsPage.first.description ?? '',
                                style: GoogleFonts.tajawal(
                                  fontSize: 17,
                                  color: const Color(0xff000000),
                                ),
                                textAlign: TextAlign.right,
                              ),
                            ),
                          ],
                        ),
                      ),
// end description ...................

//  avatar .............
                      if (adsPage.adsUser.isNotEmpty)
                        if (adsPage.adsUser.first != null)
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(30, 15, 30, 0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      AppLocalizations.of(context)
                                          .advertiserInformation,
                                      style: GoogleFonts.tajawal(
                                        fontSize: 20,
                                        color: const Color(0xff000000),
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                              Provider.of<UserProvider>(context, listen: false)
                                      .wait
                                  ? Padding(
                                      padding: EdgeInsets.all(50),
                                      child: CircularProgressIndicator())
                                  : TextButton(
                                      onPressed: () {
                                        adsPage.stopVideoAdsPage();
                                        Provider.of<UserProvider>(context,
                                                listen: false)
                                            .goToAvatar(context,
                                                adsPage.adsUser.first.phone);
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            10, 0, 10, 0),
                                        child: Container(
                                          width: mediaQuery.size.width,
                                          decoration: BoxDecoration(
                                            color: Colors.grey[200],
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(15),
                                                topRight: Radius.circular(15),
                                                bottomLeft: Radius.circular(15),
                                                bottomRight:
                                                    Radius.circular(15)),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                Column(
                                                  children: [
                                                    adsPage.adsUser.first
                                                                .image !=
                                                            null
                                                        ? Container(
                                                            width: 120.0,
                                                            height: 120.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              shape: BoxShape
                                                                  .circle,
                                                              image:
                                                                  DecorationImage(
                                                                image: NetworkImage(
                                                                    'https://tadawl.com.sa/API/assets/images/avatar/${adsPage.adsUser.first.image}'),
                                                                fit:
                                                                    BoxFit.fill,
                                                              ),
                                                            ),
                                                          )
                                                        : Container(
                                                            width: 120.0,
                                                            height: 120.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              shape: BoxShape
                                                                  .circle,
                                                              image:
                                                                  DecorationImage(
                                                                image: const AssetImage(
                                                                    'assets/images/avatar.png'),
                                                                fit: BoxFit
                                                                    .contain,
                                                              ),
                                                            ),
                                                          ),
                                                    if (Provider.of<
                                                                UserProvider>(
                                                            context,
                                                            listen: false)
                                                        .estimates
                                                        .isNotEmpty)
                                                      TextButton(
                                                        onPressed: () {
                                                          adsPage
                                                              .stopVideoAdsPage();
                                                          Navigator.pushNamed(
                                                              context,
                                                              '/main/estimate_user',
                                                              arguments: {
                                                                'phone': adsPage
                                                                        .adsUser
                                                                        .first
                                                                        .phone ??
                                                                    _phone,
                                                              });
                                                        },
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: <Widget>[
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .fromLTRB(
                                                                      0,
                                                                      0,
                                                                      15,
                                                                      0),
                                                              child: Text(
                                                                Provider.of<UserProvider>(
                                                                            context,
                                                                            listen:
                                                                                false)
                                                                        .estimates
                                                                        .isNotEmpty
                                                                    ? '(${Provider.of<UserProvider>(context, listen: false).countEstimates()})'
                                                                    : '0',
                                                                style:
                                                                    GoogleFonts
                                                                        .tajawal(
                                                                  fontSize: 15,
                                                                  color: const Color(
                                                                      0xff000000),
                                                                ),
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                              ),
                                                            ),
                                                            if (Provider.of<
                                                                        UserProvider>(
                                                                    context,
                                                                    listen:
                                                                        false)
                                                                .sumEstimates
                                                                .isNotEmpty)
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .fromLTRB(
                                                                        0,
                                                                        0,
                                                                        0,
                                                                        0),
                                                                child:
                                                                    RatingBar(
                                                                  rating: (double.parse(Provider.of<UserProvider>(context, listen: false)
                                                                              .sumEstimates
                                                                              .first
                                                                              .sum_estimates) /
                                                                          double.parse(
                                                                              '${Provider.of<UserProvider>(context, listen: false).countEstimates()}'))
                                                                      .toDouble(),
                                                                  icon: Icon(
                                                                    Icons.star,
                                                                    size: 15,
                                                                    color: Colors
                                                                        .grey,
                                                                  ),
                                                                  starCount: 5,
                                                                  spacing: 1.0,
                                                                  size: 15,
                                                                  isIndicator:
                                                                      true,
                                                                  allowHalfRating:
                                                                      true,
                                                                  color: Colors
                                                                      .amber,
                                                                ),
                                                              )
                                                            else
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .fromLTRB(
                                                                        0,
                                                                        0,
                                                                        0,
                                                                        0),
                                                                child:
                                                                    RatingBar(
                                                                  rating: 3,
                                                                  icon: Icon(
                                                                    Icons.star,
                                                                    size: 15,
                                                                    color: Colors
                                                                        .grey,
                                                                  ),
                                                                  starCount: 5,
                                                                  spacing: 1.0,
                                                                  size: 15,
                                                                  isIndicator:
                                                                      true,
                                                                  allowHalfRating:
                                                                      true,
                                                                  color: Colors
                                                                      .amber,
                                                                ),
                                                              ),
                                                          ],
                                                        ),
                                                      )
                                                    else
                                                      TextButton(
                                                        onPressed: () {
                                                          adsPage
                                                              .stopVideoAdsPage();
                                                          Navigator.pushNamed(
                                                              context,
                                                              '/main/estimate_user',
                                                              arguments: {
                                                                'phone': adsPage
                                                                        .adsUser
                                                                        .first
                                                                        .phone ??
                                                                    _phone,
                                                              });
                                                        },
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: <Widget>[
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .fromLTRB(
                                                                      0,
                                                                      0,
                                                                      15,
                                                                      0),
                                                              child: Text(
                                                                '(0)',
                                                                style:
                                                                    GoogleFonts
                                                                        .tajawal(
                                                                  fontSize: 10,
                                                                  color: const Color(
                                                                      0xff989696),
                                                                ),
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .fromLTRB(
                                                                      0,
                                                                      0,
                                                                      0,
                                                                      0),
                                                              child: RatingBar(
                                                                rating: 3,
                                                                icon: Icon(
                                                                  Icons.star,
                                                                  size: 15,
                                                                  color: Colors
                                                                      .grey,
                                                                ),
                                                                starCount: 5,
                                                                spacing: 1.0,
                                                                size: 15,
                                                                isIndicator:
                                                                    true,
                                                                allowHalfRating:
                                                                    true,
                                                                color: Colors
                                                                    .amber,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                  ],
                                                ),
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      children: <Widget>[
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .fromLTRB(
                                                                  5, 0, 5, 0),
                                                          child: Text(
                                                            adsPage
                                                                    .adsUser
                                                                    .first
                                                                    .username ??
                                                                'UserName',
                                                            style: GoogleFonts
                                                                .tajawal(
                                                              fontSize: 15,
                                                              color: const Color(
                                                                  0xff00cccc),
                                                            ),
                                                            textAlign: TextAlign
                                                                .center,
                                                          ),
                                                        ),
                                                        Icon(
                                                          Icons
                                                              .account_circle_rounded,
                                                          color:
                                                              Color(0xff00cccc),
                                                          size: 40,
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      width: 40,
                                                      height: 40,
                                                    ),
                                                    Row(
                                                      children: [
                                                        if (adsPage.adsUser
                                                                .first.phone !=
                                                            _phone)
                                                          TextButton(
                                                            onPressed: () {
                                                              adsPage
                                                                  .stopVideoAdsPage();
                                                              Provider.of<UserProvider>(context, listen: false).setRecAvatarUserName(adsPage
                                                                  .adsUser
                                                                  .first
                                                                  .username);
                                                              Navigator.pushNamed(
                                                                  context,
                                                                  '/main/discussion_main',
                                                                  arguments: {
                                                                    'phone_user': adsPage
                                                                        .adsUser
                                                                        .first
                                                                        .phone,
                                                                  });
                                                            },
                                                            child: Container(
                                                              width: mediaQuery
                                                                      .size
                                                                      .width *
                                                                  0.15,
                                                              height: 35.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10.0),
                                                                border: Border.all(
                                                                    color: const Color(
                                                                        0xff00cccc),
                                                                    width: 1),
                                                                color: const Color(
                                                                    0xffffffff),
                                                              ),
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Icon(
                                                                    Icons
                                                                        .comment_rounded,
                                                                    color: Color(
                                                                        0xff00cccc),
                                                                    size: 35,
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        if (adsPage.adsUser
                                                                .first.phone !=
                                                            _phone)
                                                          TextButton(
                                                            onPressed: () {
                                                              if (adsPage
                                                                      .videoControllerAdsPage !=
                                                                  null) {
                                                                adsPage
                                                                    .stopVideoAdsPage();
                                                              }
                                                              Provider.of<UserProvider>(
                                                                      context,
                                                                      listen:
                                                                          false)
                                                                  .callNumber(
                                                                      context,
                                                                  adsPage.adsUser.first.phone);
                                                            },
                                                            child: Container(
                                                              width: mediaQuery
                                                                      .size
                                                                      .width *
                                                                  0.15,
                                                              height: 35.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10.0),
                                                                border: Border.all(
                                                                    color: const Color(
                                                                        0xff3f9d28),
                                                                    width: 1),
                                                                color: const Color(
                                                                    0xffffffff),
                                                              ),
                                                              child: Align(
                                                                alignment:
                                                                    Alignment
                                                                        .center,
                                                                child: Icon(
                                                                  Icons
                                                                      .phone_enabled,
                                                                  color: Color(
                                                                      0xff3f9d28),
                                                                  size: 35,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                            ],
                          )
                        else
                          Container(),
// end avatar .............

//  statistics ads ........................
                      if (adsPage.adsUser.isNotEmpty)
                        if (adsPage.adsUser.first.phone == _phone)
                          Padding(
                            padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  AppLocalizations.of(context).advertisingStats,
                                  style: GoogleFonts.tajawal(
                                    fontSize: 20,
                                    color: const Color(0xff000000),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                      if (adsPage.adsUser.isNotEmpty)
                        if (adsPage.adsUser.first.phone == _phone)
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                              child: Container(
                                width: mediaQuery.size.width,
                                height: 300,
                                child: Card(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Text(
                                          AppLocalizations.of(context)
                                              .advertisingStats,
                                          style: GoogleFonts.tajawal(
                                            fontSize: 15,
                                            color: const Color(0xff00cccc),
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        Expanded(
                                          child: adsPage.adsViews.isNotEmpty
                                              ? ViewsChart(
                                                  data: adsPage.adsViews,
                                                )
                                              : ViewsChart(
                                                  data: dataa,
                                                ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
//  end statistics ads ........................
//  network coverage ...................
                      Padding(
                        padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              AppLocalizations.of(context).mapsNetwork,
                              style: GoogleFonts.tajawal(
                                fontSize: 20,
                                color: const Color(0xff000000),
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: _launchSTC,
                            child: Container(
                              width: mediaQuery.size.width * 0.2,
                              height: 35.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                border: Border.all(
                                    color: const Color(0xff00cccc), width: 1),
                                color: const Color(0xffffffff),
                                image: DecorationImage(
                                  image:
                                      const AssetImage('assets/images/stc.png'),
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: _launchZain,
                            child: Container(
                              width: mediaQuery.size.width * 0.2,
                              height: 35.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                border: Border.all(
                                    color: const Color(0xff00cccc), width: 1),
                                color: const Color(0xffffffff),
                                image: DecorationImage(
                                  image: const AssetImage(
                                      'assets/images/zain.png'),
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
// end network coverage ...................
//  location .....................
                      Padding(
                        padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              AppLocalizations.of(context).locServ,
                              style: GoogleFonts.tajawal(
                                fontSize: 20,
                                color: const Color(0xff000000),
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                      if (adsPage.adsPage.isNotEmpty)
                        InkWell(
                          onTap: () {
                            adsPage.stopVideoAdsPage();
                            _openMap(double.parse(adsPage.adsPage.first.lat),
                                double.parse(adsPage.adsPage.first.lng));
                            //MapUtils.openMap();
                          },
                          child: Container(
                            width: mediaQuery.size.width,
                            height: 300,
                            child: Stack(
                              children: <Widget>[
                                GoogleMap(
                                  initialCameraPosition: CameraPosition(
                                      target: LatLng(
                                          double.parse(
                                              adsPage.adsPage.first.lat),
                                          double.parse(
                                              adsPage.adsPage.first.lng)),
                                      zoom: 15),
                                  mapType: MapType.normal,
                                  onMapCreated: _onMapCreated,
                                  myLocationEnabled: false,
                                  myLocationButtonEnabled: false,
                                  rotateGesturesEnabled: false,
                                  scrollGesturesEnabled: false,
                                  zoomControlsEnabled: false,
                                  zoomGesturesEnabled: false,
                                ),
                                Center(
                                  child: Icon(
                                    Icons.my_location_rounded,
                                    color: Color(0xff00cccc),
                                    size: 40,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      else
                        Container(),
// end location .....................
// qr share ..........................................
                      SizedBox(
                        height: 40.0,
                      ),
                      InkWell(
                        onTap: _launchQRLink,
                        child: QrImage(
                          //plce where the QR Image will be shown
                          data: adsPage.qrData,
                          //padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                          size: 150.0,
                        ),
                      ),
                      SizedBox(
                        height: 40.0,
                      ),

                      Padding(
                        padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                              onPressed: () {
                                adsPage.stopVideoAdsPage();
                                Share.share('${adsPage.qrData}');
                              },

                              child: Container(
                                height: 35.0,
                                padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(0.0),
                                  border: Border.all(
                                      color: Colors.grey,
                                      width: 1
                                  ),
                                  color: Color(0xffffffff),
                                ),
                                child: Center(
                                  child: Text(
                                    '${adsPage.qrData}',
                                    style: GoogleFonts.tajawal(
                                      fontSize: 12,
                                      color: Colors.grey,
                                    ),
                                    textAlign: TextAlign.right,
                                  ),
                                ),
                              ),
                            ),
                            TextButton(
                              child: Icon(
                                Icons.share,
                                color: Colors.grey,
                                size: 40,
                              ),
                              onPressed: () {
                                adsPage.stopVideoAdsPage();
                                Share.share('${adsPage.qrData}');
                              },
                            ),
                          ],
                        ),
                      ),
// end qr share ..........................................
//  similar ads ..............
                      Padding(
                        padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              AppLocalizations.of(context).similarAds,
                              style: GoogleFonts.tajawal(
                                fontSize: 20,
                                color: const Color(0xff000000),
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: mediaQuery.size.width,
                        child: SingleChildScrollView(
                          physics: NeverScrollableScrollPhysics(),
                          child: Column(
                            children: [
                              if (adsPage.adsSimilar.isNotEmpty)
                                for (int i = 0;
                                    i < adsPage.countAdsSimilar();
                                    i++)
                                  TextButton(
                                    onPressed: () {
                                      adsPage.stopVideoAdsPage();
                                      adsPage.getAdsPageList(context,
                                          adsPage.adsSimilar[i].idDescription);
                                      adsPage.getImagesAdsPageList(context,
                                          adsPage.adsSimilar[i].idDescription);
                                      adsPage.getUserAdsPageInfo(context,
                                          adsPage.adsSimilar[i].idDescription);
                                      adsPage.getAdsVRInfo(context,
                                          adsPage.adsSimilar[i].idDescription);
                                      adsPage.getBFAdsPageList(context,
                                          adsPage.adsSimilar[i].idDescription);
                                      adsPage.getQFAdsPageList(context,
                                          adsPage.adsSimilar[i].idDescription);
                                      adsPage.getViewsChartInfo(context,
                                          adsPage.adsSimilar[i].idDescription);
                                      adsPage.getNavigationAdsPageList(context);
                                      adsPage.setIdDescription(
                                          adsPage.adsSimilar[i].idDescription);
                                      adsPage.getSimilarAdsList(context, adsPage.adsSimilar[i].idCategory, adsPage.adsSimilar[i].idDescription);

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
                                            color: Color(0xffcccccc),
                                            offset: const Offset(
                                              0.0,
                                              0.0,
                                            ),
                                            blurRadius: 3.0,
                                            spreadRadius: 1.0,
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
                                          Container(
                                            width: 180.0,
                                            height: 150.0,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: NetworkImage(
                                                    'https://tadawl.com.sa/API/assets/images/ads/' +
                                                            adsPage
                                                                .adsSimilar[i]
                                                                .ads_image ??
                                                        ''),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    if (adsPage.adsSimilar[i]
                                                            .idSpecial ==
                                                        '1')
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .fromLTRB(
                                                                10, 0, 5, 0),
                                                        child: Icon(
                                                          Icons.verified,
                                                          color:
                                                              Color(0xffe6e600),
                                                          size: 30,
                                                        ),
                                                      ),
                                                    Text(
                                                      adsPage
                                                          .adsSimilar[i].title,
                                                      style:
                                                          GoogleFonts.tajawal(
                                                        fontSize: 20,
                                                        color: const Color(
                                                            0xff000000),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      adsPage
                                                          .adsSimilar[i].price,
                                                      style:
                                                          GoogleFonts.tajawal(
                                                        fontSize: 15,
                                                        color: const Color(
                                                            0xff00cccc),
                                                      ),
                                                      textAlign:
                                                          TextAlign.right,
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets
                                                          .fromLTRB(0, 0, 5, 0),
                                                      child: Text(
                                                        AppLocalizations.of(
                                                                context)
                                                            .rial,
                                                        style:
                                                            GoogleFonts.tajawal(
                                                          fontSize: 15,
                                                          color: const Color(
                                                              0xff00cccc),
                                                        ),
                                                        textAlign:
                                                            TextAlign.right,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      adsPage
                                                          .adsSimilar[i].space,
                                                      style:
                                                          GoogleFonts.tajawal(
                                                        fontSize: 15,
                                                        color: const Color(
                                                            0xff000000),
                                                      ),
                                                      textAlign:
                                                          TextAlign.right,
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets
                                                          .fromLTRB(0, 0, 5, 0),
                                                      child: Text(
                                                        AppLocalizations.of(
                                                                context)
                                                            .m2,
                                                        style:
                                                            GoogleFonts.tajawal(
                                                          fontSize: 15,
                                                          color: const Color(
                                                              0xff000000),
                                                        ),
                                                        textAlign:
                                                            TextAlign.right,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          10, 0, 5, 0),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      if (adsPage.adsSimilar[i]
                                                          .video.isNotEmpty)
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .fromLTRB(
                                                                  0, 0, 5, 0),
                                                          child: Icon(
                                                            Icons
                                                                .videocam_outlined,
                                                            color: Color(
                                                                0xff00cccc),
                                                            size: 30,
                                                          ),
                                                        ),
                                                      if (adsPage.adsSimilar[i]
                                                                  .ads_city !=
                                                              null ||
                                                          adsPage.adsSimilar[i]
                                                                  .ads_neighborhood !=
                                                              null)
                                                        Text(
                                                          '${adsPage.adsSimilar[i].ads_city} - ${adsPage.adsSimilar[i].ads_neighborhood}',
                                                          style: GoogleFonts
                                                              .tajawal(
                                                            fontSize: 10,
                                                            color: const Color(
                                                                0xff000000),
                                                          ),
                                                          textAlign:
                                                              TextAlign.right,
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
                        ),
                      ),
// end similar ads ..............
                    ],
                  )
                else
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Center(
                      child: SizedBox(
                        width: 30,
                        height: 30,
                        child: CircularProgressIndicator(
                          backgroundColor: Color(0xff00cccc),
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Color(0xffffffff)),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          bottomNavigationBar: SizedBox(
            height: 65,
            child: Container(
              width: mediaQuery.size.width,
              height: mediaQuery.size.height,
              decoration: BoxDecoration(
                color: const Color(0xff00cccc),
                border: Border.all(width: 1.0, color: const Color(0xff00cccc)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  children: [
                    if (adsPage.adsNavigation.isNotEmpty)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          for (var i = 0; i < adsPage.adsNavigation.length; i++)
                            if (adsPage.adsNavigation[i].idDescription ==
                                    adsPage.idDescription &&
                                adsPage.adsNavigation[i].idDescription !=
                                    adsPage.adsNavigation.first.idDescription)
                              Container(
                                width: 50.0,
                                child: InkWell(
                                  onTap: () {
                                    adsPage.stopVideoAdsPage();

                                    adsPage.getAdsPageList(
                                        context,
                                        adsPage.adsNavigation[i - 1]
                                            .idDescription);
                                    adsPage.getImagesAdsPageList(
                                        context,
                                        adsPage.adsNavigation[i - 1]
                                            .idDescription);
                                    adsPage.getUserAdsPageInfo(
                                        context,
                                        adsPage.adsNavigation[i - 1]
                                            .idDescription);
                                    adsPage.getAdsVRInfo(
                                        context,
                                        adsPage.adsNavigation[i - 1]
                                            .idDescription);
                                    adsPage.getBFAdsPageList(
                                        context,
                                        adsPage.adsNavigation[i - 1]
                                            .idDescription);
                                    adsPage.getQFAdsPageList(
                                        context,
                                        adsPage.adsNavigation[i - 1]
                                            .idDescription);
                                    adsPage.getViewsChartInfo(
                                        context,
                                        adsPage.adsNavigation[i - 1]
                                            .idDescription);
                                    adsPage.getNavigationAdsPageList(context);
                                    adsPage.setIdDescription(adsPage
                                        .adsNavigation[i - 1].idDescription);
                                    adsPage.getSimilarAdsList(context, adsPage.adsNavigation[i - 1].idCategory, adsPage.adsNavigation[i - 1].idDescription);

                                    Future.delayed(Duration(seconds: 0), () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => AdPage()),
                                      );
                                    });
                                  },
                                  child: Icon(
                                    Icons.arrow_back_ios,
                                    color: Color(0xffffffff),
                                    size: 30,
                                  ),
                                ),
                              ),
                          for (var i = 0; i < adsPage.adsNavigation.length; i++)
                            if (adsPage.adsNavigation[i].idDescription ==
                                    adsPage.idDescription &&
                                adsPage.adsNavigation[i].idDescription !=
                                    adsPage.adsNavigation.last.idDescription)
                              Container(
                                width: 50.0,
                                child: InkWell(
                                  onTap: () {
                                    adsPage.stopVideoAdsPage();

                                    adsPage.getAdsPageList(
                                        context,
                                        adsPage.adsNavigation[i + 1]
                                            .idDescription);
                                    adsPage.getImagesAdsPageList(
                                        context,
                                        adsPage.adsNavigation[i + 1]
                                            .idDescription);
                                    adsPage.getUserAdsPageInfo(
                                        context,
                                        adsPage.adsNavigation[i + 1]
                                            .idDescription);
                                    adsPage.getAdsVRInfo(
                                        context,
                                        adsPage.adsNavigation[i + 1]
                                            .idDescription);
                                    adsPage.getBFAdsPageList(
                                        context,
                                        adsPage.adsNavigation[i + 1]
                                            .idDescription);
                                    adsPage.getQFAdsPageList(
                                        context,
                                        adsPage.adsNavigation[i + 1]
                                            .idDescription);
                                    adsPage.getViewsChartInfo(
                                        context,
                                        adsPage.adsNavigation[i + 1]
                                            .idDescription);
                                    adsPage.getNavigationAdsPageList(context);
                                    adsPage.setIdDescription(adsPage
                                        .adsNavigation[i + 1].idDescription);
                                    adsPage.getSimilarAdsList(context, adsPage.adsNavigation[i + 1].idCategory, adsPage.adsNavigation[i + 1].idDescription);

                                    Future.delayed(Duration(seconds: 0), () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => AdPage()),
                                      );
                                    });
                                  },
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    color: Color(0xffffffff),
                                    size: 30,
                                  ),
                                ),
                              ),
                        ],
                      )
                    else
                      Container(),
                  ],
                ),
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
