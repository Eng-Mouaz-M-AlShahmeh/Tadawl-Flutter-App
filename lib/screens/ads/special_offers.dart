/*
Developed by: Eng Mouaz M. Al-Shahmeh
*/
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tadawl_app/provider/ads_provider.dart';
import 'package:tadawl_app/screens/ads/ad_page.dart';

class SpecialOffers extends StatelessWidget {
  SpecialOffers({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AdsProvider>(builder: (context, specialAds, child) {
      var mediaQuery = MediaQuery.of(context);
      //specialAds.getAdsSpecialList(context);
      //specialAds.randomPosition(50);

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
            AppLocalizations.of(context).specialOffers +
                ' (${specialAds.countAdsSpecial()}) ',
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
              Container(
                width: mediaQuery.size.width,
                height: mediaQuery.size.height,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      if (specialAds.adsSpecial.isNotEmpty)
                        for (int i = 0; i < specialAds.countAdsSpecial(); i++)

                          //specialAds.wait?
                         // Padding(
                         //   padding: const EdgeInsets.all(20.0),
                          //  child: Center(child: CircularProgressIndicator()),
                         // ):

                          TextButton(
                            onPressed: () {
                              //specialAds.setIdWaitState(i);
                              specialAds.setWaitState(true);
                              specialAds.getAdsPageList(context,
                                  specialAds.adsSpecial[i].idDescription);
                              specialAds.getImagesAdsPageList(context,
                                  specialAds.adsSpecial[i].idDescription);
                              specialAds.getUserAdsPageInfo(context,
                                  specialAds.adsSpecial[i].idDescription);
                              specialAds.getAdsVRInfo(context,
                                  specialAds.adsSpecial[i].idDescription);
                              specialAds.getBFAdsPageList(context,
                                  specialAds.adsSpecial[i].idDescription);
                              specialAds.getQFAdsPageList(context,
                                  specialAds.adsSpecial[i].idDescription);
                              specialAds.getViewsChartInfo(context,
                                  specialAds.adsSpecial[i].idDescription);
                              specialAds.getNavigationAdsPageList(context);
                              specialAds.setIdDescription(specialAds.adsSpecial[i].idDescription);
                              specialAds.getSimilarAdsList(context, specialAds.adsSpecial[i].idCategory, specialAds.adsSpecial[i].idDescription);
                              Future.delayed(Duration(seconds: 0), () {
                               Navigator.push(
                                  context,
                                 MaterialPageRoute(
                                     builder: (context) => AdPage()),
                               );
                               //specialAds.setWaitState(false);
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
                                                      specialAds.adsSpecial[i]
                                                          .ads_image ??
                                                  ''),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(
                                          specialAds.randdLeft,
                                          specialAds.randdTop,
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
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            if (specialAds
                                                    .adsSpecial[i].idSpecial ==
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
                                              specialAds.adsSpecial[i].title,
                                              style: GoogleFonts.tajawal(
                                                fontSize: 20,
                                                color: const Color(0xff000000),
                                              ),
                                              textAlign: TextAlign.right,
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Text(
                                              specialAds.adsSpecial[i].price,
                                              style: GoogleFonts.tajawal(
                                                fontSize: 15,
                                                color: const Color(0xff00cccc),
                                              ),
                                              textAlign: TextAlign.right,
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
                                                textAlign: TextAlign.right,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Text(
                                              specialAds.adsSpecial[i].space,
                                              style: GoogleFonts.tajawal(
                                                fontSize: 15,
                                                color: const Color(0xff000000),
                                              ),
                                              textAlign: TextAlign.right,
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
                                              if (specialAds.adsSpecial[i].video
                                                  .isNotEmpty)
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
                                              if (specialAds.adsSpecial[i]
                                                          .ads_city !=
                                                      null ||
                                                  specialAds.adsSpecial[i]
                                                          .ads_neighborhood !=
                                                      null)
                                                Text(
                                                  '${specialAds.adsSpecial[i].ads_city} - ${specialAds.adsSpecial[i].ads_neighborhood}',
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
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
