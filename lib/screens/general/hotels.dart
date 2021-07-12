/*
Developed by: Eng Mouaz M. Al-Shahmeh
*/
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';

class ConstructionContracting extends StatelessWidget {
  ConstructionContracting({
    Key key,
  }) : super(key: key);

  void launchWhatsApp() async {
    final link = WhatsAppUnilink(
      phoneNumber: '+966552525000',
      text: 'تطبيق تداول العقاري، بشأن خدمة خدمة الفنادق والشقق المفروشة',
    );
    await launch('$link');
  }

  @override
  Widget build(BuildContext context) {
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
          AppLocalizations.of(context).contractConstruction,
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
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(5, 20, 5, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      AppLocalizations.of(context).hotelDesc,
                      style: GoogleFonts.tajawal(
                        fontSize: 15,
                        color: const Color(0xff000000),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    width: 500,
                    height: 520,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      image: DecorationImage(
                        image: const AssetImage('assets/images/hotel.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                    child: TextButton(
                      onPressed: launchWhatsApp,
                      child: Container(
                        width: 100,
                        height: 50.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                              color: const Color(0xff00cccc), width: 1),
                          color: const Color(0xffffffff),
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            AppLocalizations.of(context).contactUs,
                            style: GoogleFonts.tajawal(
                              fontSize: 20,
                              color: const Color(0xff00cccc),
                            ),
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
      bottomNavigationBar: Container(
        width: mediaQuery.size.width,
        height: 50.0,
        decoration: BoxDecoration(
          color: const Color(0xff00cccc),
        ),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [],
          ),
        ),
      ),
    );
  }
}
