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

class MyAds extends StatelessWidget {
  MyAds({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(builder: (context, myAds, child) {
      var mediaQuery = MediaQuery.of(context);
      myAds.getSession();
      //var _phone = myAds.phone;
      //myAds.getUserAdsList(context, _phone);
      //Provider.of<AdsProvider>(context, listen: false).randomPosition(50);

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
            AppLocalizations.of(context).myAds + ' (${myAds.countUserAds()}) ',
            style: GoogleFonts.tajawal(
              fontSize: 20,
              color: const Color(0xffffffff),
            ),
            textAlign: TextAlign.center,
          ),
          backgroundColor: Color(0xff00cccc),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
            child: Column(
              children: [
                if (myAds.userAds.isNotEmpty)
                  for (int i = 0; i < myAds.countUserAds(); i++)
                   // myAds.wait?
                    //Padding(
                    //  padding: const EdgeInsets.all(20.0),
                   //   child: Center(child: CircularProgressIndicator()),
                   // ):
                    TextButton(
                      onPressed: () {
                        //myAds.setWaitState(true);
                        Provider.of<AdsProvider>(context, listen: false)
                            .getAdsPageList(
                                context, myAds.userAds[i].idDescription);
                        Provider.of<AdsProvider>(context, listen: false)
                            .getImagesAdsPageList(
                                context, myAds.userAds[i].idDescription);
                        Provider.of<AdsProvider>(context, listen: false)
                            .getUserAdsPageInfo(
                                context, myAds.userAds[i].idDescription);
                        Provider.of<AdsProvider>(context, listen: false)
                            .getAdsVRInfo(
                                context, myAds.userAds[i].idDescription);
                        Provider.of<AdsProvider>(context, listen: false)
                            .getBFAdsPageList(
                                context, myAds.userAds[i].idDescription);
                        Provider.of<AdsProvider>(context, listen: false)
                            .getQFAdsPageList(
                                context, myAds.userAds[i].idDescription);
                        Provider.of<AdsProvider>(context, listen: false)
                            .getViewsChartInfo(
                                context, myAds.userAds[i].idDescription);
                        Provider.of<AdsProvider>(context, listen: false)
                            .getNavigationAdsPageList(context);
                        Provider.of<AdsProvider>(context, listen: false)
                            .setIdDescription(myAds.userAds[i].idDescription);

                        Provider.of<AdsProvider>(context, listen: false).getSimilarAdsList(context, myAds.userAds[i].idCategory, myAds.userAds[i].idDescription);

                        Future.delayed(Duration(seconds: 0), () {
                       Navigator.push(
                            context,
                           MaterialPageRoute(
                               builder: (context) => AdPage()),
                          );
                      // myAds.setWaitState(false);
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
                                                myAds.userAds[i].ads_image ??
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
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                if (myAds.userAds[i].idSpecial == '1')
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(10, 5, 10, 5),
                                    child: Icon(
                                      Icons.verified,
                                      color: Color(0xffe6e600),
                                      size: 30,
                                    ),
                                  ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 5, 10, 5),
                                  child: (Provider.of<AdsProvider>(context,
                                                      listen: false)
                                                  .busy ==
                                              true &&
                                          Provider.of<AdsProvider>(context,
                                                      listen: false)
                                                  .number ==
                                              i)
                                      ? CircularProgressIndicator()
                                      : TextButton(
                                          onPressed: () {
                                            Provider.of<AdsProvider>(context,
                                                    listen: false)
                                                .setNumber(i);
                                            Provider.of<AdsProvider>(context,
                                                    listen: false)
                                                .updateAds(context,
                                                    myAds.userAds[i].id_ads);
                                          },
                                          child: Container(
                                            width: mediaQuery.size.width * 0.15,
                                            height: 35.0,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                              border: Border.all(
                                                  width: 1.0,
                                                  color:
                                                      const Color(0xff3f9d28)),
                                            ),
                                            child: Center(
                                              child: Text(
                                                AppLocalizations.of(context)
                                                    .updateAds,
                                                style: GoogleFonts.tajawal(
                                                  color:
                                                      const Color(0xff3f9d28),
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ),
                                        ),
                                ),
                                if (myAds.userAds[i].video.isNotEmpty)
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(15, 5, 15, 5),
                                    child: Icon(
                                      Icons.videocam_outlined,
                                      color: Color(0xff00cccc),
                                      size: 30,
                                    ),
                                  ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            5, 0, 5, 0),
                                        child: Text(
                                          myAds.userAds[i].title,
                                          style: GoogleFonts.tajawal(
                                            fontSize: 13,
                                            color: const Color(0xff000000),
                                          ),
                                          textAlign: TextAlign.right,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 0, 0, 0),
                                        child: Text(
                                          myAds.userAds[i].price,
                                          style: GoogleFonts.tajawal(
                                            fontSize: 15,
                                            color: const Color(0xff00cccc),
                                          ),
                                          textAlign: TextAlign.right,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 0, 0, 0),
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
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            5, 0, 15, 0),
                                        child: Text(
                                          myAds.userAds[i].space,
                                          style: GoogleFonts.tajawal(
                                            fontSize: 15,
                                            color: const Color(0xff000000),
                                          ),
                                          textAlign: TextAlign.right,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            5, 0, 5, 0),
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
                                        if (myAds.userAds[i].ads_city != null ||
                                            myAds.userAds[i].ads_neighborhood !=
                                                null)
                                          Text(
                                            '${myAds.userAds[i].ads_city} - ${myAds.userAds[i].ads_neighborhood}',
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
                  Container(),
              ],
            ),
          ),
        ),
      );
    });
  }
}
