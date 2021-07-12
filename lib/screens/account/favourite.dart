/*
Developed by: Eng Mouaz M. Al-Shahmeh
*/
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tadawl_app/provider/ads_provider.dart';
import 'package:tadawl_app/provider/user_provider.dart';
import 'package:tadawl_app/screens/ads/ad_page.dart';

class Favourite extends StatelessWidget {
  Favourite({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(builder: (context, adsFav, child) {
      Provider.of<AdsProvider>(context, listen: false).randomPosition(50);
      var mediaQuery = MediaQuery.of(context);
      adsFav.getSession();
      //var _phone = adsFav.phone;
      //adsFav.getUserAdsFavList(context, _phone);
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
            AppLocalizations.of(context).favourite,
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
              if (adsFav.userAdsFav.isNotEmpty)
                for (int i = 0; i < adsFav.countUserAdsFav(); i++)
                  if (adsFav.userAdsFav[i].isFav == '1')
                    TextButton(
                      onPressed: () {
                        Provider.of<AdsProvider>(context, listen: false)
                            .getAdsPageList(
                                context, adsFav.userAdsFav[i].idDescription);
                        Provider.of<AdsProvider>(context, listen: false)
                            .getImagesAdsPageList(
                                context, adsFav.userAdsFav[i].idDescription);
                        Provider.of<AdsProvider>(context, listen: false)
                            .getUserAdsPageInfo(
                                context, adsFav.userAdsFav[i].idDescription);
                        Provider.of<AdsProvider>(context, listen: false)
                            .getAdsVRInfo(
                                context, adsFav.userAdsFav[i].idDescription);
                        Provider.of<AdsProvider>(context, listen: false)
                            .getBFAdsPageList(
                                context, adsFav.userAdsFav[i].idDescription);
                        Provider.of<AdsProvider>(context, listen: false)
                            .getQFAdsPageList(
                                context, adsFav.userAdsFav[i].idDescription);
                        Provider.of<AdsProvider>(context, listen: false)
                            .getViewsChartInfo(
                                context, adsFav.userAdsFav[i].idDescription);
                        Provider.of<AdsProvider>(context, listen: false)
                            .getNavigationAdsPageList(context);
                        Provider.of<AdsProvider>(context, listen: false)
                            .setIdDescription(adsFav.userAdsFav[i].idDescription);
                        Provider.of<AdsProvider>(context, listen: false).getSimilarAdsList(context, adsFav.userAdsFav[i].idCategory, adsFav.userAdsFav[i].idDescription);


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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                                adsFav
                                                    .userAdsFav[i].ads_image ??
                                            ''),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(
                                    Provider.of<AdsProvider>(context,
                                            listen: false)
                                        .randdLeft,
                                    Provider.of<AdsProvider>(context,
                                            listen: false)
                                        .randdTop,
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
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      if (adsFav.userAdsFav[i].idSpecial == '1')
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              5, 0, 10, 0),
                                          child: Icon(
                                            Icons.verified,
                                            color: Color(0xffe6e600),
                                            size: 30,
                                          ),
                                        ),
                                      Text(
                                        adsFav.userAdsFav[i].title,
                                        style: GoogleFonts.tajawal(
                                          fontSize: 20,
                                          color: const Color(0xff000000),
                                        ),
                                        textAlign: TextAlign.right,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        adsFav.userAdsFav[i].price,
                                        style: GoogleFonts.tajawal(
                                          fontSize: 15,
                                          color: const Color(0xff00cccc),
                                        ),
                                        textAlign: TextAlign.right,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 0, 5, 0),
                                        child: Text(
                                          AppLocalizations.of(context).rial,
                                          style: GoogleFonts.tajawal(
                                            fontSize: 15,
                                            color: const Color(0xff00cccc),
                                          ),
                                          textAlign: TextAlign.right,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        adsFav.userAdsFav[i].space,
                                        style: GoogleFonts.tajawal(
                                          fontSize: 15,
                                          color: const Color(0xff000000),
                                        ),
                                        textAlign: TextAlign.right,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 0, 5, 0),
                                        child: Text(
                                          AppLocalizations.of(context).m2,
                                          style: GoogleFonts.tajawal(
                                            fontSize: 15,
                                            color: const Color(0xff000000),
                                          ),
                                          textAlign: TextAlign.right,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(5, 0, 10, 0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        if (adsFav
                                            .userAdsFav[i].video.isNotEmpty)
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                0, 0, 5, 0),
                                            child: Icon(
                                              Icons.videocam_outlined,
                                              color: Color(0xff00cccc),
                                              size: 30,
                                            ),
                                          ),
                                        if (adsFav.userAdsFav[i].ads_city !=
                                                null ||
                                            adsFav.userAdsFav[i]
                                                    .ads_neighborhood !=
                                                null)
                                          Text(
                                            '${adsFav.userAdsFav[i].ads_city} - ${adsFav.userAdsFav[i].ads_neighborhood}',
                                            style: GoogleFonts.tajawal(
                                              fontSize: 8,
                                              color: const Color(0xff000000),
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
                    Container()
              else
                Container(),
            ],
          ),
        ),
      );
    });
  }
}
