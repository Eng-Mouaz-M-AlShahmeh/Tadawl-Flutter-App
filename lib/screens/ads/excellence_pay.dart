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

class ExcellencePay extends StatelessWidget {
  ExcellencePay({
    Key key,
  }) : super(key: key);

  Map data = {};
  var id_ads;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<AdsModel> ads = [];
  List AdsData = [];
  var selectedAd;
  var currentStage, cvvNumber, cardNumber, month, year;
  var group = 1;
  final GlobalKey<FormState> _excellenceKey = GlobalKey<FormState>();
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

    data = ModalRoute.of(context).settings.arguments;
    id_ads = data['id_ads'];
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
      body: Form(
        key: _excellenceKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          AppLocalizations.of(context).selectedAdvertisement,
                          style: GoogleFonts.tajawal(
                            fontSize: 20,
                            color: const Color(0xff000000),
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (ads.isNotEmpty)
                    for (int i = 0; i < ads.length; i++)
                      if (id_ads == ads[i].id_ads)
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: mediaQuery.size.width,
                            height: 150.0,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xffffd633),
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
                                    padding: EdgeInsets.fromLTRB(
                                        randdLeft, randdTop, 5, 5),
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
                                    if (ads[i].idSpecial == '1')
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            10, 5, 10, 5),
                                        child: Icon(
                                          Icons.verified,
                                          color: Color(0xffe6e600),
                                          size: 30,
                                        ),
                                      ),
                                    if (ads[i].video.isNotEmpty)
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
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                5, 0, 5, 0),
                                            child: Text(
                                              ads[i].title,
                                              style: GoogleFonts.tajawal(
                                                fontSize: 15,
                                                color: const Color(0xff00cccc),
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                0, 0, 0, 0),
                                            child: Text(
                                              ads[i].price,
                                              style: GoogleFonts.tajawal(
                                                fontSize: 15,
                                                color: const Color(0xff00cccc),
                                              ),
                                              // textAlign: TextAlign.right,
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
                                            padding: const EdgeInsets.fromLTRB(
                                                0, 0, 0, 0),
                                            child: Text(
                                              ads[i].space,
                                              style: GoogleFonts.tajawal(
                                                fontSize: 15,
                                                color: const Color(0xff000000),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                0, 0, 0, 0),
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
                                        padding: const EdgeInsets.fromLTRB(
                                            5, 0, 10, 0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            if (ads[i].ads_city != null ||
                                                ads[i].ads_neighborhood != null)
                                              Text(
                                                '${ads[i].ads_city} - ${ads[i].ads_neighborhood}',
                                                style: GoogleFonts.tajawal(
                                                  fontSize: 8,
                                                  color:
                                                      const Color(0xff000000),
                                                ),
                                                // textAlign: TextAlign.right,
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
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Center(
                          child: CircularProgressIndicator(
                        backgroundColor: Color(0xff00cccc),
                        valueColor:
                            AlwaysStoppedAnimation<Color>(Color(0xffffffff)),
                      )),
                    ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                          child: Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.0),
                              color: const Color(0xff00cccc),
                              border: Border.all(
                                width: 1.0,
                                color: const Color(0xff00cccc),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                '2',
                                style: GoogleFonts.tajawal(
                                  fontSize: 13,
                                  color: const Color(0xffffffff),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Text(
                          AppLocalizations.of(context).chooseLevelDistinction,
                          style: GoogleFonts.tajawal(
                            fontSize: 15,
                            color: const Color(0xff000000),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Radio(
                            activeColor: const Color(0xff00cccc),
                            value: 1,
                            groupValue: group,
                            onChanged: (T) {
                              setState(() {
                                group = T;
                              });
                            }),
                        Text(
                          AppLocalizations.of(context).citywide,
                          style: GoogleFonts.tajawal(
                            fontSize: 15,
                            color: const Color(0xff8d8d8d),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Radio(
                            activeColor: const Color(0xff00cccc),
                            value: 2,
                            groupValue: group,
                            onChanged: (T) {
                              setState(() {
                                group = T;
                              });
                            }),
                        Text(
                          AppLocalizations.of(context).neighborhoodLevel,
                          style: GoogleFonts.tajawal(
                            fontSize: 15,
                            color: const Color(0xff8d8d8d),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                          child: Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.0),
                              color: const Color(0xff00cccc),
                              border: Border.all(
                                width: 1.0,
                                color: const Color(0xff00cccc),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                '3',
                                style: GoogleFonts.tajawal(
                                  fontSize: 13,
                                  color: const Color(0xffffffff),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Text(
                          AppLocalizations.of(context).paymentInformation,
                          style: GoogleFonts.tajawal(
                            fontSize: 15,
                            color: const Color(0xff000000),
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
                          'السعر: 500 ريال/ 10 أيام',
                          style: GoogleFonts.tajawal(
                            fontSize: 13,
                            color: const Color(0xff00cccc),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              AppLocalizations.of(context).enterCoupon,
                              style: GoogleFonts.tajawal(
                                fontSize: 13,
                                color: const Color(0xff989696),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          child: SizedBox(
                            width: 120,
                            height: 30,
                            child: TextFormField(
                              decoration: InputDecoration(
                                labelText: AppLocalizations.of(context).coupon,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  borderSide: BorderSide(),
                                ),
                              ),
                              style: GoogleFonts.tajawal(
                                fontSize: 10,
                                color: const Color(0xff989696),
                              ),
                              keyboardType: TextInputType.number,
                              validator: (String value) {
                                if (value.isEmpty) {
                                  return AppLocalizations.of(context).reqCoupon;
                                }
                                return null;
                              },
                              onSaved: (String value) {
                                cvvNumber = value;
                              },
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Container(
                            width: 60,
                            height: 40.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: const Color(0xff00cccc),
                            ),
                            child: Center(
                              child: Text(
                                AppLocalizations.of(context).apply,
                                style: GoogleFonts.tajawal(
                                  fontSize: 15,
                                  color: const Color(0xffffffff),
                                ),
                                // textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: 80.0,
                          height: 60.0,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image:
                                  const AssetImage('assets/images/img18.png'),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        Container(
                          width: 80.0,
                          height: 60.0,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: const AssetImage('assets/images/img6.png'),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        Container(
                          width: 80.0,
                          height: 60.0,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image:
                                  const AssetImage('assets/images/img19.png'),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
                    child: Container(
                      width: mediaQuery.size.width * 0.9,
                      height: 230.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: const Color(0xffeeeeee),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.fromLTRB(35, 10, 35, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  AppLocalizations.of(context).cardNumber,
                                  style: GoogleFonts.tajawal(
                                    fontSize: 12,
                                    color: const Color(0xff000000),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(35, 0, 35, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Icon(
                                  Icons.credit_card_rounded,
                                  color: const Color(0xff989696),
                                  size: 50,
                                ),
                                SizedBox(
                                  width: mediaQuery.size.width * 0.5,
                                  height: 40,
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      labelText: AppLocalizations.of(context)
                                          .cardNumber,
                                      fillColor: Colors.white,
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                        borderSide: BorderSide(),
                                      ),
                                    ),
                                    style: GoogleFonts.tajawal(
                                      fontSize: 10,
                                      color: const Color(0xff989696),
                                    ),
                                    keyboardType: TextInputType.number,
                                    minLines: 1,
                                    maxLines: 1,
                                    validator: (String value) {
                                      if (value.isEmpty) {
                                        return AppLocalizations.of(context)
                                            .reqCardNumber;
                                      }
                                      return null;
                                    },
                                    onSaved: (String value) {
                                      cardNumber = value;
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(35, 15, 35, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  AppLocalizations.of(context).endDate,
                                  style: GoogleFonts.tajawal(
                                    fontSize: 12,
                                    color: const Color(0xff000000),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(35, 0, 35, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  child: SizedBox(
                                    width: 50,
                                    height: 40,
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                        labelText:
                                            AppLocalizations.of(context).month,
                                        fillColor: Colors.white,
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          borderSide: BorderSide(),
                                        ),
                                      ),
                                      style: GoogleFonts.tajawal(
                                        fontSize: 10,
                                        color: const Color(0xff989696),
                                      ),
                                      keyboardType: TextInputType.number,
                                      validator: (String value) {
                                        if (value.isEmpty) {
                                          return AppLocalizations.of(context)
                                              .reqMonth;
                                        }
                                        return null;
                                      },
                                      onSaved: (String value) {
                                        month = value;
                                      },
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(5, 0, 5, 0),
                                  child: Text(
                                    '/',
                                    style: GoogleFonts.tajawal(
                                      fontSize: 12,
                                      color: const Color(0xff989696),
                                    ),
                                  ),
                                ),
                                Container(
                                  child: SizedBox(
                                    width: 50,
                                    height: 40,
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                        labelText:
                                            AppLocalizations.of(context).year,
                                        fillColor: Colors.white,
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          borderSide: BorderSide(),
                                        ),
                                      ),
                                      style: GoogleFonts.tajawal(
                                        fontSize: 10,
                                        color: const Color(0xff989696),
                                      ),
                                      keyboardType: TextInputType.number,
                                      validator: (String value) {
                                        if (value.isEmpty) {
                                          return AppLocalizations.of(context)
                                              .reqYear;
                                        }
                                        return null;
                                      },
                                      onSaved: (String value) {
                                        year = value;
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(35, 15, 35, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  AppLocalizations.of(context).cvv,
                                  style: GoogleFonts.tajawal(
                                    fontSize: 12,
                                    color: const Color(0xff000000),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(35, 0, 35, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  child: SizedBox(
                                    width: 70,
                                    height: 40,
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                        labelText:
                                            AppLocalizations.of(context).cvv,
                                        fillColor: Colors.white,
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          borderSide: BorderSide(),
                                        ),
                                      ),
                                      style: GoogleFonts.tajawal(
                                        fontSize: 10,
                                        color: const Color(0xff989696),
                                      ),
                                      keyboardType: TextInputType.number,
                                      validator: (String value) {
                                        if (value.isEmpty) {
                                          return AppLocalizations.of(context)
                                              .reqCvv;
                                        }
                                        return null;
                                      },
                                      onSaved: (String value) {
                                        cvvNumber = value;
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      if (!_excellenceKey.currentState.validate()) {
                        return;
                      }
                      _excellenceKey.currentState.save();
                      //Send to API
                    },
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 15, 0, 30),
                      child: Container(
                        width: mediaQuery.size.width * 0.3,
                        height: 40.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: const Color(0xffffffff),
                          border: Border.all(
                              width: 1.0, color: const Color(0xff3f9d28)),
                        ),
                        child: Center(
                          child: Text(
                            AppLocalizations.of(context).send,
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
            ],
          ),
        ),
      ),
    );
  }
}
*/