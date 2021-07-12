/*
Developed by: Eng Mouaz M. Al-Shahmeh
*/
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tadawl_app/provider/ads_provider.dart';
import 'package:tadawl_app/screens/ads/ad_page.dart';

class TodayAds extends StatelessWidget {
  TodayAds({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AdsProvider>(builder: (context, todayAds, child) {
      var mediaQuery = MediaQuery.of(context);
      //todayAds.getTodayAdsList(context);
      //todayAds.randomPosition(50);

      return Scaffold(
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
            AppLocalizations.of(context).todayAds +
                ' (${todayAds.countTodayAds()}) ',
            style: GoogleFonts.tajawal(
              fontSize: 20,
              color: const Color(0xffffffff),
            ),
            textAlign: TextAlign.center,
          ),
          backgroundColor: Color(0xff00cccc),
        ),
        backgroundColor: const Color(0xffffffff),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(5, 15, 5, 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ToggleButtons(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            AppLocalizations.of(context).riyadh,
                            style: GoogleFonts.tajawal(
                              fontSize: 13,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            AppLocalizations.of(context).makkah,
                            style: GoogleFonts.tajawal(
                              fontSize: 13,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            AppLocalizations.of(context).esternRegion,
                            style: GoogleFonts.tajawal(
                              fontSize: 13,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            AppLocalizations.of(context).rest,
                            style: GoogleFonts.tajawal(
                              fontSize: 13,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                      onPressed: (int index) {
                        todayAds.updateSelected5(context, index);
                      },
                      isSelected: todayAds.isSelected5,
                      color: const Color(0xff00cccc),
                      selectedColor: const Color(0xffffffff),
                      fillColor: const Color(0xff00cccc),
                      borderColor: const Color(0xff00cccc),
                      borderWidth: 1,
                    ),
                  ],
                ),
              ),
              Container(
                width: mediaQuery.size.width,
                height: mediaQuery.size.height * 0.75,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      if (todayAds.filterCity == null ||
                          todayAds.filterCity == 1)
                        Column(
                          children: [
                            if (todayAds.todayAds.isNotEmpty)
                              for (int i = 0; i < todayAds.countTodayAds(); i++)
                                if (todayAds.todayAds[i].ads_city == 'الرياض')
                                  TextButton(
                                    onPressed: () {
                                      todayAds.getAdsPageList(context,
                                          todayAds.todayAds[i].idDescription);
                                      todayAds.getImagesAdsPageList(context,
                                          todayAds.todayAds[i].idDescription);
                                      todayAds.getUserAdsPageInfo(context,
                                          todayAds.todayAds[i].idDescription);
                                      todayAds.getAdsVRInfo(context,
                                          todayAds.todayAds[i].idDescription);
                                      todayAds.getBFAdsPageList(context,
                                          todayAds.todayAds[i].idDescription);
                                      todayAds.getQFAdsPageList(context,
                                          todayAds.todayAds[i].idDescription);
                                      todayAds.getViewsChartInfo(context,
                                          todayAds.todayAds[i].idDescription);
                                      todayAds
                                          .getNavigationAdsPageList(context);
                                      todayAds.setIdDescription(todayAds.todayAds[i].idDescription);
                                      todayAds.getSimilarAdsList(context, todayAds.todayAds[i].idCategory, todayAds.todayAds[i].idDescription);

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
                                                              todayAds
                                                                  .todayAds[i]
                                                                  .ads_image ??
                                                          ''),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  todayAds.randdLeft,
                                                  todayAds.randdTop,
                                                  5,
                                                  5),
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
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    if (todayAds.todayAds[i]
                                                            .idSpecial ==
                                                        '1')
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .fromLTRB(
                                                                5, 0, 10, 0),
                                                        child: Icon(
                                                          Icons.verified,
                                                          color:
                                                              Color(0xffe6e600),
                                                          size: 30,
                                                        ),
                                                      ),
                                                    Text(
                                                      todayAds
                                                          .todayAds[i].title,
                                                      style:
                                                          GoogleFonts.tajawal(
                                                        fontSize: 20,
                                                        color: const Color(
                                                            0xff000000),
                                                      ),
                                                      textAlign:
                                                          TextAlign.right,
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    Text(
                                                      todayAds
                                                          .todayAds[i].price,
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
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    Text(
                                                      todayAds
                                                          .todayAds[i].space,
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
                                                          5, 0, 10, 0),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      if (todayAds.todayAds[i]
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
                                                      if (todayAds.todayAds[i]
                                                                  .ads_city !=
                                                              null ||
                                                          todayAds.todayAds[i]
                                                                  .ads_neighborhood !=
                                                              null)
                                                        Text(
                                                          '${todayAds.todayAds[i].ads_city} - ${todayAds.todayAds[i].ads_neighborhood}',
                                                          style: GoogleFonts
                                                              .tajawal(
                                                            fontSize: 8,
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
                                  ),

                            if (todayAds.countAdsRiyadh > 0) Container()
                            else Center(child: Text(
                              AppLocalizations.of(context).noAdsAvailable,
                              style: GoogleFonts
                                  .tajawal(
                                fontSize: 12,
                                color: const Color(
                                    0xff000000),
                              ),
                            ),),

                          ],
                        )
                      else if (todayAds.filterCity == 2)
                        Column(
                          children: [
                            if (todayAds.todayAds.isNotEmpty)
                              for (int i = 0; i < todayAds.countTodayAds(); i++)
                                if (todayAds.todayAds[i].ads_city == 'مكة')
                                  TextButton(
                                    onPressed: () {
                                      todayAds.getAdsPageList(context,
                                          todayAds.todayAds[i].idDescription);
                                      todayAds.getImagesAdsPageList(context,
                                          todayAds.todayAds[i].idDescription);
                                      todayAds.getUserAdsPageInfo(context,
                                          todayAds.todayAds[i].idDescription);
                                      todayAds.getAdsVRInfo(context,
                                          todayAds.todayAds[i].idDescription);
                                      todayAds.getBFAdsPageList(context,
                                          todayAds.todayAds[i].idDescription);
                                      todayAds.getQFAdsPageList(context,
                                          todayAds.todayAds[i].idDescription);
                                      todayAds.getViewsChartInfo(context,
                                          todayAds.todayAds[i].idDescription);
                                      todayAds
                                          .getNavigationAdsPageList(context);
                                      todayAds.setIdDescription(todayAds.todayAds[i].idDescription);
                                      todayAds.getSimilarAdsList(context, todayAds.todayAds[i].idCategory, todayAds.todayAds[i].idDescription);

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
                                                              todayAds
                                                                  .todayAds[i]
                                                                  .ads_image ??
                                                          ''),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  todayAds.randdLeft,
                                                  todayAds.randdTop,
                                                  5,
                                                  5),
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
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    if (todayAds.todayAds[i]
                                                            .idSpecial ==
                                                        '1')
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .fromLTRB(
                                                                5, 0, 10, 0),
                                                        child: Icon(
                                                          Icons.verified,
                                                          color:
                                                              Color(0xffe6e600),
                                                          size: 30,
                                                        ),
                                                      ),
                                                    Text(
                                                      todayAds
                                                          .todayAds[i].title,
                                                      style:
                                                          GoogleFonts.tajawal(
                                                        fontSize: 20,
                                                        color: const Color(
                                                            0xff000000),
                                                      ),
                                                      textAlign:
                                                          TextAlign.right,
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    Text(
                                                      todayAds
                                                          .todayAds[i].price,
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
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    Text(
                                                      todayAds
                                                          .todayAds[i].space,
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
                                                          5, 0, 10, 0),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      if (todayAds.todayAds[i]
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
                                                      if (todayAds.todayAds[i]
                                                                  .ads_city !=
                                                              null ||
                                                          todayAds.todayAds[i]
                                                                  .ads_neighborhood !=
                                                              null)
                                                        Text(
                                                          '${todayAds.todayAds[i].ads_city} - ${todayAds.todayAds[i].ads_neighborhood}',
                                                          style: GoogleFonts
                                                              .tajawal(
                                                            fontSize: 8,
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
                                  ),

                            if (todayAds.countAdsMekkah > 0) Container()
                            else Center(child: Text(
                              AppLocalizations.of(context).noAdsAvailable,
                              style: GoogleFonts
                                  .tajawal(
                                fontSize: 12,
                                color: const Color(
                                    0xff000000),
                              ),
                            ),),

                          ],
                        )
                      else if (todayAds.filterCity == 3)
                        Column(
                          children: [
                            if (todayAds.todayAds.isNotEmpty)
                              for (int i = 0; i < todayAds.countTodayAds(); i++)
                                if (todayAds.todayAds[i].ads_city == 'الدمام')
                                  TextButton(
                                    onPressed: () {
                                      todayAds.getAdsPageList(context,
                                          todayAds.todayAds[i].idDescription);
                                      todayAds.getImagesAdsPageList(context,
                                          todayAds.todayAds[i].idDescription);
                                      todayAds.getUserAdsPageInfo(context,
                                          todayAds.todayAds[i].idDescription);
                                      todayAds.getAdsVRInfo(context,
                                          todayAds.todayAds[i].idDescription);
                                      todayAds.getBFAdsPageList(context,
                                          todayAds.todayAds[i].idDescription);
                                      todayAds.getQFAdsPageList(context,
                                          todayAds.todayAds[i].idDescription);
                                      todayAds.getViewsChartInfo(context,
                                          todayAds.todayAds[i].idDescription);
                                      todayAds
                                          .getNavigationAdsPageList(context);
                                      todayAds.setIdDescription(todayAds.todayAds[i].idDescription);
                                      todayAds.getSimilarAdsList(context, todayAds.todayAds[i].idCategory, todayAds.todayAds[i].idDescription);


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
                                                              todayAds
                                                                  .todayAds[i]
                                                                  .ads_image ??
                                                          ''),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  todayAds.randdLeft,
                                                  todayAds.randdTop,
                                                  5,
                                                  5),
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
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    if (todayAds.todayAds[i]
                                                            .idSpecial ==
                                                        '1')
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .fromLTRB(
                                                                5, 0, 10, 0),
                                                        child: Icon(
                                                          Icons.verified,
                                                          color:
                                                              Color(0xffe6e600),
                                                          size: 30,
                                                        ),
                                                      ),
                                                    Text(
                                                      todayAds
                                                          .todayAds[i].title,
                                                      style:
                                                          GoogleFonts.tajawal(
                                                        fontSize: 20,
                                                        color: const Color(
                                                            0xff000000),
                                                      ),
                                                      textAlign:
                                                          TextAlign.right,
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      todayAds
                                                          .todayAds[i].price,
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
                                                      todayAds
                                                          .todayAds[i].space,
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
                                                          5, 0, 10, 0),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      if (todayAds.todayAds[i]
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
                                                      if (todayAds.todayAds[i]
                                                                  .ads_city !=
                                                              null ||
                                                          todayAds.todayAds[i]
                                                                  .ads_neighborhood !=
                                                              null)
                                                        Text(
                                                          '${todayAds.todayAds[i].ads_city} - ${todayAds.todayAds[i].ads_neighborhood}',
                                                          style: GoogleFonts
                                                              .tajawal(
                                                            fontSize: 8,
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
                                  ),

                            if (todayAds.countAdsDammam > 0) Container()
                            else Center(child: Text(
                              AppLocalizations.of(context).noAdsAvailable,
                              style: GoogleFonts
                                  .tajawal(
                                fontSize: 12,
                                color: const Color(
                                    0xff000000),
                              ),
                            ),),

                          ],
                        )
                      else if (todayAds.filterCity == 4)
                        Column(
                          children: [
                            if (todayAds.todayAds.isNotEmpty)
                              for (int i = 0; i < todayAds.countTodayAds(); i++)
                                if (todayAds.todayAds[i].ads_city != 'الدمام' &&
                                    todayAds.todayAds[i].ads_city != 'مكة' &&
                                    todayAds.todayAds[i].ads_city != 'الرياض')
                                  TextButton(
                                    onPressed: () {
                                      todayAds.getAdsPageList(context,
                                          todayAds.todayAds[i].idDescription);
                                      todayAds.getImagesAdsPageList(context,
                                          todayAds.todayAds[i].idDescription);
                                      todayAds.getUserAdsPageInfo(context,
                                          todayAds.todayAds[i].idDescription);
                                      todayAds.getAdsVRInfo(context,
                                          todayAds.todayAds[i].idDescription);
                                      todayAds.getBFAdsPageList(context,
                                          todayAds.todayAds[i].idDescription);
                                      todayAds.getQFAdsPageList(context,
                                          todayAds.todayAds[i].idDescription);
                                      todayAds.getViewsChartInfo(context,
                                          todayAds.todayAds[i].idDescription);
                                      todayAds
                                          .getNavigationAdsPageList(context);
                                      todayAds.setIdDescription(todayAds.todayAds[i].idDescription);
                                      todayAds.getSimilarAdsList(context, todayAds.todayAds[i].idCategory, todayAds.todayAds[i].idDescription);

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
                                                              todayAds
                                                                  .todayAds[i]
                                                                  .ads_image ??
                                                          ''),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  todayAds.randdLeft,
                                                  todayAds.randdTop,
                                                  5,
                                                  5),
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
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    if (todayAds.todayAds[i]
                                                            .idSpecial ==
                                                        '1')
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .fromLTRB(
                                                                5, 0, 10, 0),
                                                        child: Icon(
                                                          Icons.verified,
                                                          color:
                                                              Color(0xffe6e600),
                                                          size: 30,
                                                        ),
                                                      ),
                                                    Text(
                                                      todayAds
                                                          .todayAds[i].title,
                                                      style:
                                                          GoogleFonts.tajawal(
                                                        fontSize: 20,
                                                        color: const Color(
                                                            0xff000000),
                                                      ),
                                                      textAlign:
                                                          TextAlign.right,
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    Text(
                                                      todayAds
                                                          .todayAds[i].price,
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
                                                      todayAds
                                                          .todayAds[i].space,
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
                                                          5, 0, 10, 0),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      if (todayAds.todayAds[i]
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
                                                      if (todayAds.todayAds[i]
                                                                  .ads_city !=
                                                              null ||
                                                          todayAds.todayAds[i]
                                                                  .ads_neighborhood !=
                                                              null)
                                                        Text(
                                                          '${todayAds.todayAds[i].ads_city} - ${todayAds.todayAds[i].ads_neighborhood}',
                                                          style: GoogleFonts
                                                              .tajawal(
                                                            fontSize: 8,
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
                                  ),

                            if (todayAds.countAdsRest > 0) Container()
                            else Center(child: Text(
                              AppLocalizations.of(context).noAdsAvailable,
                              style: GoogleFonts
                                  .tajawal(
                                fontSize: 12,
                                color: const Color(
                                    0xff000000),
                              ),
                            ),),


                          ],
                        ),


                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
