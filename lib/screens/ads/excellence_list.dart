/*
Developed by: Eng Mouaz M. Al-Shahmeh
*/
/*import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tadawl_app/models/AdsModel.dart';
import 'package:tadawl_app/provider.api/ApiFunctions.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tadawl_app/provider/user_provider.dart';

class ExcellenceList extends StatelessWidget {
  ExcellenceList({
    Key key,
  }) : super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<AdsModel> ads = [];
  List AdsData = [];
  void getAdsInfo() async {
    Future.delayed(Duration(milliseconds: 0), () {
      Api(_scaffoldKey).getUserAdsFunc(context, _phone).then((value) {
        AdsData = value;
        AdsData.forEach((element) {
          setState(() {
            ads.add(AdsModel(
              idDescription: element['id_description'],
              id_ads: element['id_ads'],
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
            ));
          });
        });
      });
    });
  }

  void updateAds(String id_ads) async {
    Future.delayed(Duration(milliseconds: 0), () {
      Api(_scaffoldKey).updateAdsFunc(context, id_ads);
    });
  }

  Random random = Random();
  static double randdTop = 50;
  static double randdLeft = 50;
  void randomPosition(int number) {
    var randomLeft = random.nextInt(number);
    var randomTop = random.nextInt(number);
    var randLeft = randomLeft.toDouble();
    var randTop = randomTop.toDouble();
    setState(() {
      randdTop = randTop;
      randdLeft = randLeft;
    });
  }

  @override
  void initState() {
    super.initState();
    getAdsInfo();
    randomPosition(50);
  }

  @override
  Widget build(BuildContext context) {

    Provider.of<UserProvider>(context, listen: false).getSession();
    var _phone = Provider.of<UserProvider>(context, listen: false).phone;

    var mediaQuery = MediaQuery.of(context);
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
          AppLocalizations.of(context).excellenceServices,
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
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 15, 30, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                        color: const Color(0xff00cccc),
                        border: Border.all(
                          width: 0.5,
                          color: const Color(0xff00cccc),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          '1',
                          style: GoogleFonts.tajawal(
                            fontSize: 20,
                            color: const Color(0xffffffff),
                          ),
                          textAlign: TextAlign.center,
                          textDirection: TextDirection.rtl,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    AppLocalizations.of(context).chooseYourDesiredAdToStandOut,
                    style: GoogleFonts.tajawal(
                      fontSize: 15,
                      color: const Color(0xff000000),
                    ),
                  ),
                ],
              ),
            ),
            if (ads.isNotEmpty)
              for (int i = 0; i < ads.length; i++)
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/main/excellence_pay',
                        arguments: {
                          'id_ads': ads[i].id_ads,
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
                          blurRadius: 0.0,
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
                                            ads[i].ads_image ??
                                        ''),
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsets.fromLTRB(randdLeft, randdTop, 5, 5),
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              if (ads[i].idSpecial == '1')
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(5, 5, 5, 5),
                                  child: Icon(
                                    Icons.verified,
                                    color: Color(0xffe6e600),
                                    size: 30,
                                  ),
                                ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                                child: TextButton(
                                  onPressed: () {
                                    updateAds(ads[i].id_ads);
                                  },
                                  child: Container(
                                    width: mediaQuery.size.width * 0.15,
                                    height: 35.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5.0),
                                      border: Border.all(
                                          width: 1.0,
                                          color: const Color(0xff3f9d28)),
                                    ),
                                    child: Center(
                                      child: Text(
                                        AppLocalizations.of(context).updateAds,
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
                              if (ads[i].video.isNotEmpty)
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(5, 5, 5, 4),
                                  child: Icon(
                                    Icons.videocam_outlined,
                                    color: Color(0xff00cccc),
                                    size: 30,
                                  ),
                                ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                    child: Text(
                                      ads[i].title,
                                      style: GoogleFonts.tajawal(
                                        fontSize: 11,
                                        color: const Color(0xff000000),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                    child: Text(
                                      ads[i].price,
                                      style: GoogleFonts.tajawal(
                                        fontSize: 15,
                                        color: const Color(0xff00cccc),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                    child: Text(
                                      AppLocalizations.of(context).rial,
                                      style: GoogleFonts.tajawal(
                                        fontSize: 15,
                                        color: const Color(0xff00cccc),
                                      ),
                                      //textAlign: TextAlign.right,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                    child: Text(
                                      ads[i].space,
                                      style: GoogleFonts.tajawal(
                                        fontSize: 15,
                                        color: const Color(0xff000000),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                    child: Text(
                                      AppLocalizations.of(context).m2,
                                      style: GoogleFonts.tajawal(
                                        fontSize: 15,
                                        color: const Color(0xff000000),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    if (ads[i].ads_city != null ||
                                        ads[i].ads_neighborhood != null)
                                      Text(
                                        '${ads[i].ads_city} - ${ads[i].ads_neighborhood}',
                                        style: GoogleFonts.tajawal(
                                          fontSize: 8,
                                          color: const Color(0xff000000),
                                        ),
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
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Center(
                    child: CircularProgressIndicator(
                  backgroundColor: Color(0xff00cccc),
                  valueColor: AlwaysStoppedAnimation<Color>(Color(0xffffffff)),
                )),
              ),
          ],
        ),
      ),
    );
  }
}
*/