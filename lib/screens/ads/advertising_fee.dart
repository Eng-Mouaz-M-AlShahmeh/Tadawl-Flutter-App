/*
Developed by: Eng Mouaz M. Al-Shahmeh
*/
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tadawl_app/provider/ads_provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AdvertisingFee extends StatelessWidget {
  AdvertisingFee({
    Key key,
  }) : super(key: key);

  void launchWhatsApp() async {
    final link = WhatsAppUnilink(
      phoneNumber: '+966552525000',
      text: 'حلول التسويق للمطورين العقاريين',
    );
    await launch('$link');
  }

  void launchWhatsApp2() async {
    final link = WhatsAppUnilink(
      phoneNumber: '+966552525000',
      text: 'خدمات التسويق الحصري',
    );
    await launch('$link');
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AdsProvider>(builder: (context, advFee, child) {

      //advFee.initStateSelected();
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
            AppLocalizations.of(context).advFees,
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
                padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ToggleButtons(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                          child: Text(
                            AppLocalizations.of(context).officesMarketers,
                            style: GoogleFonts.tajawal(
                              fontSize: 15,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                          child: Text(
                            AppLocalizations.of(context).owner,
                            style: GoogleFonts.tajawal(
                              fontSize: 15,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                          child: Text(
                            AppLocalizations.of(context).leaseContracts,
                            style: GoogleFonts.tajawal(
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                      onPressed: (int index) {
                        advFee.updateSelected1(index);
                      },
                      isSelected: advFee.isSelected1,
                      color: const Color(0xff8d8d8d),
                      selectedColor: const Color(0xffffffff),
                      fillColor: const Color(0xff3f9d28),
                      borderRadius: BorderRadius.circular(0),
                      borderWidth: 1,
                      borderColor: const Color(0xffdddddd),
                      selectedBorderColor: const Color(0xffdddddd),
                    ),
                  ],
                ),
              ),
              if (advFee.selectedNav1 == 0)
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        ToggleButtons(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                              child: Text(
                                AppLocalizations.of(context).basicMembership,
                                style: GoogleFonts.tajawal(
                                  fontSize: 15,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                              child: Text(
                                AppLocalizations.of(context).proMembership,
                                style: GoogleFonts.tajawal(
                                  fontSize: 15,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                              child: Text(
                                AppLocalizations.of(context).specialMembership,
                                style: GoogleFonts.tajawal(
                                  fontSize: 15,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                          onPressed: (int index) {
                            advFee.updateSelected2(index);
                          },
                          isSelected: advFee.isSelected2,
                          color: const Color(0xff8d8d8d),
                          selectedColor: const Color(0xffffffff),
                          fillColor: const Color(0xff00cccc),
                          borderRadius: BorderRadius.circular(30),
                          borderWidth: 1,
                          borderColor: const Color(0xffdddddd),
                          selectedBorderColor: const Color(0xffdddddd),
                        ),
                      ],
                    ),
                    if (advFee.selectedNav2 == 2)
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: mediaQuery.size.width * 0.8,
                                  height: 450.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    color: const Color(0xffececec),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 10, 15, 0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      5, 0, 0, 0),
                                              child: Icon(
                                                Icons.verified_outlined,
                                                color: Color(0xff00cccc),
                                                size: 25,
                                              ),
                                            ),
                                            Text(
                                              AppLocalizations.of(context)
                                                  .rule1,
                                              style: GoogleFonts.tajawal(
                                                fontSize: 10,
                                                color: const Color(0xffa8a8a8),
                                              ),
                                              textAlign: TextAlign.end,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 10, 15, 0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      5, 0, 0, 0),
                                              child: Icon(
                                                Icons.verified_outlined,
                                                color: Color(0xff00cccc),
                                                size: 25,
                                              ),
                                            ),
                                            Container(
                                              child: Flexible(
                                                child: Text(
                                                  AppLocalizations.of(context)
                                                      .rule2,
                                                  style: GoogleFonts.tajawal(
                                                    fontSize: 10,
                                                    color:
                                                        const Color(0xffa8a8a8),
                                                  ),
                                                  textAlign: TextAlign.end,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 10, 15, 0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      5, 0, 0, 0),
                                              child: Icon(
                                                Icons.verified_outlined,
                                                color: Color(0xff00cccc),
                                                size: 25,
                                              ),
                                            ),
                                            Text(
                                              AppLocalizations.of(context)
                                                  .rule3,
                                              style: GoogleFonts.tajawal(
                                                fontSize: 10,
                                                color: const Color(0xffa8a8a8),
                                              ),
                                              textAlign: TextAlign.end,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 10, 15, 0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      5, 0, 0, 0),
                                              child: Icon(
                                                Icons.verified_outlined,
                                                color: Color(0xff00cccc),
                                                size: 25,
                                              ),
                                            ),
                                            Text(
                                              AppLocalizations.of(context)
                                                  .rule4,
                                              style: GoogleFonts.tajawal(
                                                fontSize: 10,
                                                color: const Color(0xffa8a8a8),
                                              ),
                                              textAlign: TextAlign.end,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 10, 15, 0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      5, 0, 0, 0),
                                              child: Icon(
                                                Icons.verified_outlined,
                                                color: Color(0xff00cccc),
                                                size: 25,
                                              ),
                                            ),
                                            Text(
                                              AppLocalizations.of(context)
                                                  .rule5,
                                              style: GoogleFonts.tajawal(
                                                fontSize: 10,
                                                color: const Color(0xffa8a8a8),
                                              ),
                                              textAlign: TextAlign.end,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 10, 15, 0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      5, 0, 0, 0),
                                              child: Icon(
                                                Icons.verified_outlined,
                                                color: Color(0xff00cccc),
                                                size: 25,
                                              ),
                                            ),
                                            Text(
                                              AppLocalizations.of(context)
                                                  .rule6,
                                              style: GoogleFonts.tajawal(
                                                fontSize: 10,
                                                color: const Color(0xffa8a8a8),
                                              ),
                                              textAlign: TextAlign.end,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 10, 15, 0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      5, 0, 0, 0),
                                              child: Icon(
                                                Icons.verified_outlined,
                                                color: Color(0xff00cccc),
                                                size: 25,
                                              ),
                                            ),
                                            Text(
                                              AppLocalizations.of(context)
                                                  .rule7,
                                              style: GoogleFonts.tajawal(
                                                fontSize: 10,
                                                color: const Color(0xffa8a8a8),
                                              ),
                                              textAlign: TextAlign.end,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 10, 0, 0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      5, 0, 0, 0),
                                              child: Text(
                                                '2500',
                                                style: GoogleFonts.tajawal(
                                                  fontSize: 20,
                                                  color:
                                                      const Color(0xff00cccc),
                                                ),
                                              ),
                                            ),
                                            Text(
                                              AppLocalizations.of(context).rial,
                                              style: GoogleFonts.tajawal(
                                                fontSize: 20,
                                                color: const Color(0xff00cccc),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 10, 0, 0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              AppLocalizations.of(context)
                                                  .annual,
                                              style: GoogleFonts.tajawal(
                                                fontSize: 13,
                                                color: const Color(0xffa8a8a8),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 10, 0, 0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            TextButton(
                                              onPressed: () {
                                                Navigator.pushNamed(context,
                                                    '/main/payment_of_fees',
                                                    arguments: {
                                                      'price': '2500',
                                                      'type': 'العضوية المميزة',
                                                    });
                                              },
                                              child: Container(
                                                width: 140,
                                                height: 50.0,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                  border: Border.all(
                                                      color: const Color(
                                                          0xff00cccc),
                                                      width: 2),
                                                  color:
                                                      const Color(0xffffffff),
                                                ),
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    AppLocalizations.of(context)
                                                        .subscribe,
                                                    style: GoogleFonts.tajawal(
                                                      fontSize: 20,
                                                      color: const Color(
                                                          0xff00cccc),
                                                    ),
                                                  ),
                                                ),
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
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: mediaQuery.size.width * 0.8,
                                    height: 150.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      color: const Color(0xffececec),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        TextButton(
                                          onPressed: launchWhatsApp,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        5, 0, 5, 0),
                                                child: Icon(
                                                  Icons.emoji_objects_rounded,
                                                  color: Color(0xffffd633),
                                                  size: 25,
                                                ),
                                              ),
                                              Flexible(
                                                child: Text(
                                                  AppLocalizations.of(context)
                                                      .marketingSol,
                                                  style: GoogleFonts.tajawal(
                                                    fontSize: 13,
                                                    color:
                                                        const Color(0xffa8a8a8),
                                                  ),
                                                  textAlign: TextAlign.right,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        TextButton(
                                          onPressed: launchWhatsApp,
                                          child: Container(
                                            width: 100,
                                            height: 40.0,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              border: Border.all(
                                                  color:
                                                      const Color(0xff3f9d28),
                                                  width: 2),
                                              color: const Color(0xffffffff),
                                            ),
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: Text(
                                                AppLocalizations.of(context)
                                                    .clickHere,
                                                style: GoogleFonts.tajawal(
                                                  fontSize: 15,
                                                  color:
                                                      const Color(0xff3f9d28),
                                                ),
                                              ),
                                            ),
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
                    if (advFee.selectedNav2 == 1)
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: mediaQuery.size.width * 0.8,
                                  height: 450.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    color: const Color(0xffececec),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 10, 15, 0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      5, 0, 0, 0),
                                              child: Icon(
                                                Icons.verified_outlined,
                                                color: Color(0xff00cccc),
                                                size: 25,
                                              ),
                                            ),
                                            Text(
                                              AppLocalizations.of(context)
                                                  .rule8,
                                              style: GoogleFonts.tajawal(
                                                fontSize: 10,
                                                color: const Color(0xffa8a8a8),
                                              ),
                                              textAlign: TextAlign.end,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 10, 15, 0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      5, 0, 0, 0),
                                              child: Icon(
                                                Icons.verified_outlined,
                                                color: Color(0xff00cccc),
                                                size: 25,
                                              ),
                                            ),
                                            Container(
                                              child: Flexible(
                                                child: Text(
                                                  AppLocalizations.of(context)
                                                      .rule9,
                                                  style: GoogleFonts.tajawal(
                                                    fontSize: 10,
                                                    color:
                                                        const Color(0xffa8a8a8),
                                                  ),
                                                  textAlign: TextAlign.end,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 10, 15, 0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      5, 0, 0, 0),
                                              child: Icon(
                                                Icons.verified_outlined,
                                                color: Color(0xff00cccc),
                                                size: 25,
                                              ),
                                            ),
                                            Text(
                                              AppLocalizations.of(context)
                                                  .rule10,
                                              style: GoogleFonts.tajawal(
                                                fontSize: 10,
                                                color: const Color(0xffa8a8a8),
                                              ),
                                              textAlign: TextAlign.end,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 10, 15, 0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      5, 0, 0, 0),
                                              child: Icon(
                                                Icons.verified_outlined,
                                                color: Color(0xff00cccc),
                                                size: 25,
                                              ),
                                            ),
                                            Text(
                                              AppLocalizations.of(context)
                                                  .rule11,
                                              style: GoogleFonts.tajawal(
                                                fontSize: 10,
                                                color: const Color(0xffa8a8a8),
                                              ),
                                              textAlign: TextAlign.end,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 10, 15, 0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      5, 0, 0, 0),
                                              child: Icon(
                                                Icons.verified_outlined,
                                                color: Color(0xff00cccc),
                                                size: 25,
                                              ),
                                            ),
                                            Text(
                                              AppLocalizations.of(context)
                                                  .rule12,
                                              style: GoogleFonts.tajawal(
                                                fontSize: 10,
                                                color: const Color(0xffa8a8a8),
                                              ),
                                              textAlign: TextAlign.end,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 10, 15, 0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      5, 0, 0, 0),
                                              child: Icon(
                                                Icons.verified_outlined,
                                                color: Color(0xff00cccc),
                                                size: 25,
                                              ),
                                            ),
                                            Text(
                                              AppLocalizations.of(context)
                                                  .rule13,
                                              style: GoogleFonts.tajawal(
                                                fontSize: 10,
                                                color: const Color(0xffa8a8a8),
                                              ),
                                              textAlign: TextAlign.end,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 10, 15, 0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      5, 0, 0, 0),
                                              child: Icon(
                                                Icons.verified_outlined,
                                                color: Color(0xff00cccc),
                                                size: 25,
                                              ),
                                            ),
                                            Text(
                                              AppLocalizations.of(context)
                                                  .rule14,
                                              style: GoogleFonts.tajawal(
                                                fontSize: 10,
                                                color: const Color(0xffa8a8a8),
                                              ),
                                              textAlign: TextAlign.end,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 10, 0, 0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      5, 0, 0, 0),
                                              child: Text(
                                                '1900',
                                                style: GoogleFonts.tajawal(
                                                  fontSize: 20,
                                                  color:
                                                      const Color(0xff00cccc),
                                                ),
                                              ),
                                            ),
                                            Text(
                                              AppLocalizations.of(context).rial,
                                              style: GoogleFonts.tajawal(
                                                fontSize: 20,
                                                color: const Color(0xff00cccc),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 10, 0, 0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              AppLocalizations.of(context)
                                                  .annual,
                                              style: GoogleFonts.tajawal(
                                                fontSize: 13,
                                                color: const Color(0xffa8a8a8),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 10, 0, 0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            TextButton(
                                              onPressed: () {
                                                Navigator.pushNamed(context,
                                                    '/main/payment_of_fees',
                                                    arguments: {
                                                      'price': '1900',
                                                      'type':
                                                          'العضوية الاحترافية',
                                                    });
                                              },
                                              child: Container(
                                                width: 140,
                                                height: 50.0,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                  border: Border.all(
                                                      color: const Color(
                                                          0xff00cccc),
                                                      width: 2),
                                                  color:
                                                      const Color(0xffffffff),
                                                ),
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    AppLocalizations.of(context)
                                                        .subscribe,
                                                    style: GoogleFonts.tajawal(
                                                      fontSize: 20,
                                                      color: const Color(
                                                          0xff00cccc),
                                                    ),
                                                  ),
                                                ),
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
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: mediaQuery.size.width * 0.8,
                                    height: 150.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      color: const Color(0xffececec),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        TextButton(
                                          onPressed: launchWhatsApp,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        5, 0, 5, 0),
                                                child: Icon(
                                                  Icons.emoji_objects_rounded,
                                                  color: Color(0xffffd633),
                                                  size: 25,
                                                ),
                                              ),
                                              Flexible(
                                                child: Text(
                                                  AppLocalizations.of(context)
                                                      .marketingSol,
                                                  style: GoogleFonts.tajawal(
                                                    fontSize: 13,
                                                    color:
                                                        const Color(0xffa8a8a8),
                                                  ),
                                                  textAlign: TextAlign.right,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        TextButton(
                                          onPressed: launchWhatsApp,
                                          child: Container(
                                            width: 100,
                                            height: 40.0,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              border: Border.all(
                                                  color:
                                                      const Color(0xff3f9d28),
                                                  width: 2),
                                              color: const Color(0xffffffff),
                                            ),
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: Text(
                                                AppLocalizations.of(context)
                                                    .clickHere,
                                                style: GoogleFonts.tajawal(
                                                  fontSize: 15,
                                                  color:
                                                      const Color(0xff3f9d28),
                                                ),
                                              ),
                                            ),
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
                    if (advFee.selectedNav2 == 0)
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: mediaQuery.size.width * 0.8,
                                  height: 300.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    color: const Color(0xffececec),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 10, 15, 0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Icon(
                                              Icons.verified_outlined,
                                              color: Color(0xff00cccc),
                                              size: 30,
                                            ),
                                            Text(
                                              AppLocalizations.of(context)
                                                  .rule15,
                                              style: GoogleFonts.tajawal(
                                                fontSize: 13,
                                                color: const Color(0xffa8a8a8),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 10, 15, 0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Icon(
                                              Icons.verified_outlined,
                                              color: Color(0xff00cccc),
                                              size: 30,
                                            ),
                                            Container(
                                              child: Flexible(
                                                child: Text(
                                                  AppLocalizations.of(context)
                                                      .rule16,
                                                  style: GoogleFonts.tajawal(
                                                    fontSize: 13,
                                                    color:
                                                        const Color(0xffa8a8a8),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 10, 0, 0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      5, 0, 0, 0),
                                              child: Text(
                                                '750',
                                                style: GoogleFonts.tajawal(
                                                  fontSize: 20,
                                                  color:
                                                      const Color(0xff00cccc),
                                                ),
                                              ),
                                            ),
                                            Text(
                                              AppLocalizations.of(context).rial,
                                              style: GoogleFonts.tajawal(
                                                fontSize: 20,
                                                color: const Color(0xff00cccc),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 10, 0, 0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              AppLocalizations.of(context)
                                                  .annual,
                                              style: GoogleFonts.tajawal(
                                                fontSize: 13,
                                                color: const Color(0xffa8a8a8),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 10, 0, 0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            TextButton(
                                              onPressed: () {
                                                Navigator.pushNamed(context,
                                                    '/main/payment_of_fees',
                                                    arguments: {
                                                      'price': '750',
                                                      'type':
                                                          'العضوية الأساسية',
                                                    });
                                              },
                                              child: Container(
                                                width: 140,
                                                height: 50.0,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                  border: Border.all(
                                                      color: const Color(
                                                          0xff00cccc),
                                                      width: 2),
                                                  color:
                                                      const Color(0xffffffff),
                                                ),
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    AppLocalizations.of(context)
                                                        .subscribe,
                                                    style: GoogleFonts.tajawal(
                                                      fontSize: 20,
                                                      color: const Color(
                                                          0xff00cccc),
                                                    ),
                                                  ),
                                                ),
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
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: mediaQuery.size.width * 0.8,
                                    height: 150.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      color: const Color(0xffececec),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        TextButton(
                                          onPressed: launchWhatsApp,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        5, 0, 5, 0),
                                                child: Icon(
                                                  Icons.emoji_objects_rounded,
                                                  color: Color(0xffffd633),
                                                  size: 25,
                                                ),
                                              ),
                                              Flexible(
                                                child: Text(
                                                  AppLocalizations.of(context)
                                                      .marketingSol,
                                                  style: GoogleFonts.tajawal(
                                                    fontSize: 13,
                                                    color:
                                                        const Color(0xffa8a8a8),
                                                  ),
                                                  textAlign: TextAlign.right,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        TextButton(
                                          onPressed: launchWhatsApp,
                                          child: Container(
                                            width: 100,
                                            height: 40.0,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              border: Border.all(
                                                  color:
                                                      const Color(0xff3f9d28),
                                                  width: 2),
                                              color: const Color(0xffffffff),
                                            ),
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: Text(
                                                AppLocalizations.of(context)
                                                    .clickHere,
                                                style: GoogleFonts.tajawal(
                                                  fontSize: 15,
                                                  color:
                                                      const Color(0xff3f9d28),
                                                ),
                                              ),
                                            ),
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
                  ],
                ),
              if (advFee.selectedNav1 == 1)
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 250.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: const Color(0xffffffff),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(5, 0, 5, 0),
                                  child: Container(
                                    width: mediaQuery.size.width * 0.4,
                                    height: 250.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      color: const Color(0xffececec),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              0, 10, 15, 0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        5, 0, 0, 0),
                                                child: Icon(
                                                  Icons.verified_outlined,
                                                  color: Color(0xff00cccc),
                                                  size: 25,
                                                ),
                                              ),
                                              Text(
                                                AppLocalizations.of(context)
                                                    .rentalFees,
                                                style: GoogleFonts.tajawal(
                                                  fontSize: 10,
                                                  color:
                                                      const Color(0xffa8a8a8),
                                                ),
                                                textAlign: TextAlign.end,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              0, 10, 15, 0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        5, 0, 0, 0),
                                                child: Icon(
                                                  Icons.verified_outlined,
                                                  color: Color(0xff00cccc),
                                                  size: 25,
                                                ),
                                              ),
                                              Container(
                                                child: Flexible(
                                                  child: Text(
                                                    AppLocalizations.of(context)
                                                        .rule17,
                                                    style: GoogleFonts.tajawal(
                                                      fontSize: 10,
                                                      color: const Color(
                                                          0xffa8a8a8),
                                                    ),
                                                    textAlign: TextAlign.end,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              0, 10, 0, 0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        5, 0, 0, 0),
                                                child: Text(
                                                  '60',
                                                  style: GoogleFonts.tajawal(
                                                    fontSize: 20,
                                                    color:
                                                        const Color(0xff00cccc),
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                AppLocalizations.of(context)
                                                    .rial,
                                                style: GoogleFonts.tajawal(
                                                  fontSize: 20,
                                                  color:
                                                      const Color(0xff00cccc),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              0, 10, 0, 0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.pushNamed(context,
                                                      '/main/payment_of_fees',
                                                      arguments: {
                                                        'price': '60',
                                                        'type': 'رسوم التأجير',
                                                      });
                                                },
                                                child: Container(
                                                  width: 100,
                                                  height: 40.0,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    border: Border.all(
                                                        color: const Color(
                                                            0xff00cccc),
                                                        width: 2),
                                                    color:
                                                        const Color(0xffffffff),
                                                  ),
                                                  child: Align(
                                                    alignment: Alignment.center,
                                                    child: Text(
                                                      AppLocalizations.of(
                                                              context)
                                                          .payFees,
                                                      style:
                                                          GoogleFonts.tajawal(
                                                        fontSize: 15,
                                                        color: const Color(
                                                            0xff00cccc),
                                                      ),
                                                    ),
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
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(5, 0, 5, 0),
                                  child: Container(
                                    width: mediaQuery.size.width * 0.4,
                                    height: 250.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      color: const Color(0xffececec),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              0, 10, 15, 0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        5, 0, 0, 0),
                                                child: Icon(
                                                  Icons.verified_outlined,
                                                  color: Color(0xff00cccc),
                                                  size: 25,
                                                ),
                                              ),
                                              Text(
                                                AppLocalizations.of(context)
                                                    .sellingFees,
                                                style: GoogleFonts.tajawal(
                                                  fontSize: 10,
                                                  color:
                                                      const Color(0xffa8a8a8),
                                                ),
                                                textAlign: TextAlign.end,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              0, 10, 15, 0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        5, 0, 0, 0),
                                                child: Icon(
                                                  Icons.verified_outlined,
                                                  color: Color(0xff00cccc),
                                                  size: 25,
                                                ),
                                              ),
                                              Container(
                                                child: Flexible(
                                                  child: Text(
                                                    AppLocalizations.of(context)
                                                        .rule18,
                                                    style: GoogleFonts.tajawal(
                                                      fontSize: 10,
                                                      color: const Color(
                                                          0xffa8a8a8),
                                                    ),
                                                    textAlign: TextAlign.end,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              0, 10, 0, 0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        5, 0, 0, 0),
                                                child: Text(
                                                  '475',
                                                  style: GoogleFonts.tajawal(
                                                    fontSize: 20,
                                                    color:
                                                        const Color(0xff00cccc),
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                AppLocalizations.of(context)
                                                    .rial,
                                                style: GoogleFonts.tajawal(
                                                  fontSize: 20,
                                                  color:
                                                      const Color(0xff00cccc),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              0, 10, 0, 0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.pushNamed(context,
                                                      '/main/payment_of_fees',
                                                      arguments: {
                                                        'price': '475',
                                                        'type': 'رسوم البيع',
                                                      });
                                                },
                                                child: Container(
                                                  width: 100,
                                                  height: 40.0,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    border: Border.all(
                                                        color: const Color(
                                                            0xff00cccc),
                                                        width: 2),
                                                    color:
                                                        const Color(0xffffffff),
                                                  ),
                                                  child: Align(
                                                    alignment: Alignment.center,
                                                    child: Text(
                                                      AppLocalizations.of(
                                                              context)
                                                          .payFees,
                                                      style:
                                                          GoogleFonts.tajawal(
                                                        fontSize: 15,
                                                        color: const Color(
                                                            0xff00cccc),
                                                      ),
                                                    ),
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
                              ],
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: mediaQuery.size.width * 0.8,
                              height: 170.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: const Color(0xffffffff),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 10, 10, 0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              5, 0, 0, 0),
                                          child: Icon(
                                            Icons.error_outlined,
                                            color: Color(0xffffd633),
                                            size: 25,
                                          ),
                                        ),
                                        Text(
                                          AppLocalizations.of(context)
                                              .explanatoryPoints,
                                          style: GoogleFonts.tajawal(
                                            fontSize: 15,
                                            color: const Color(0xff000000),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(5, 10, 5, 0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              5, 0, 5, 0),
                                          child: Text(
                                            '-',
                                            style: GoogleFonts.tajawal(
                                              fontSize: 10,
                                              color: const Color(0xffa8a8a8),
                                            ),
                                            textAlign: TextAlign.end,
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                            AppLocalizations.of(context).rule19,
                                            style: GoogleFonts.tajawal(
                                              fontSize: 10,
                                              color: const Color(0xffa8a8a8),
                                            ),
                                            // textAlign: TextAlign.end,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(5, 10, 5, 0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              5, 0, 5, 0),
                                          child: Text(
                                            '-',
                                            style: GoogleFonts.tajawal(
                                              fontSize: 10,
                                              color: const Color(0xffa8a8a8),
                                            ),
                                            textAlign: TextAlign.end,
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                            AppLocalizations.of(context).rule20,
                                            style: GoogleFonts.tajawal(
                                              fontSize: 10,
                                              color: const Color(0xffa8a8a8),
                                            ),
                                            // textAlign: TextAlign.end,
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
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: mediaQuery.size.width * 0.8,
                              height: 120.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: const Color(0xffececec),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  TextButton(
                                    onPressed: launchWhatsApp2,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              10, 0, 5, 0),
                                          child: Icon(
                                            Icons.emoji_objects_rounded,
                                            color: Color(0xffffd633),
                                            size: 30,
                                          ),
                                        ),
                                        Flexible(
                                          child: Text(
                                            AppLocalizations.of(context).xMark,
                                            style: GoogleFonts.tajawal(
                                              fontSize: 13,
                                              color: const Color(0xffa8a8a8),
                                            ),
                                            textAlign: TextAlign.right,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: launchWhatsApp2,
                                    child: Container(
                                      width: 100,
                                      height: 40.0,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        border: Border.all(
                                            color: const Color(0xff3f9d28),
                                            width: 2),
                                        color: const Color(0xffffffff),
                                      ),
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          AppLocalizations.of(context)
                                              .clickHere,
                                          style: GoogleFonts.tajawal(
                                            fontSize: 15,
                                            color: const Color(0xff3f9d28),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(30, 10, 30, 30),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                AppLocalizations.of(context).rule21,
                                style: GoogleFonts.tajawal(
                                  fontSize: 10,
                                  color: const Color(0xffa8a8a8),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              if (advFee.selectedNav1 == 2)
                Container(
                  height: 200.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: const Color(0xffffffff),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: Container(
                          width: mediaQuery.size.width * 0.4,
                          height: 180.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: const Color(0xffececec),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(5, 0, 0, 0),
                                      child: Text(
                                        '250',
                                        style: GoogleFonts.tajawal(
                                          fontSize: 20,
                                          color: const Color(0xff00cccc),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      AppLocalizations.of(context).rial,
                                      style: GoogleFonts.tajawal(
                                        fontSize: 20,
                                        color: const Color(0xff00cccc),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      AppLocalizations.of(context)
                                          .commercialContract,
                                      style: GoogleFonts.tajawal(
                                        fontSize: 15,
                                        color: const Color(0xffa8a8a8),
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pushNamed(
                                            context, '/main/payment_of_fees',
                                            arguments: {
                                              'price': '250',
                                              'type': 'العقد التجاري',
                                            });
                                      },
                                      child: Container(
                                        width: 100,
                                        height: 40.0,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          border: Border.all(
                                              color: const Color(0xff00cccc),
                                              width: 2),
                                          color: const Color(0xffffffff),
                                        ),
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            AppLocalizations.of(context)
                                                .payFees,
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
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: Container(
                          width: mediaQuery.size.width * 0.4,
                          height: 180.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: const Color(0xffececec),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(5, 0, 0, 0),
                                      child: Text(
                                        '200',
                                        style: GoogleFonts.tajawal(
                                          fontSize: 20,
                                          color: const Color(0xff00cccc),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      AppLocalizations.of(context).rial,
                                      style: GoogleFonts.tajawal(
                                        fontSize: 20,
                                        color: const Color(0xff00cccc),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      AppLocalizations.of(context)
                                          .housingContract,
                                      style: GoogleFonts.tajawal(
                                        fontSize: 15,
                                        color: const Color(0xffa8a8a8),
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pushNamed(
                                            context, '/main/payment_of_fees',
                                            arguments: {
                                              'price': '200',
                                              'type': 'العقد السكني',
                                            });
                                      },
                                      child: Container(
                                        width: 100,
                                        height: 40.0,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          border: Border.all(
                                              color: const Color(0xff00cccc),
                                              width: 2),
                                          color: const Color(0xffffffff),
                                        ),
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            AppLocalizations.of(context)
                                                .payFees,
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
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      );
    });
  }
}
