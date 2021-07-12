/*
Developed by: Eng Mouaz M. Al-Shahmeh
*/
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';
import 'package:url_launcher/url_launcher.dart';

class ExclusiveMarketing extends StatelessWidget {
  ExclusiveMarketing({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          AppLocalizations.of(context).exclusiveMarketingCond,
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
              padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      AppLocalizations.of(context).exclusiveMarketingCondDesc,
                      style: GoogleFonts.tajawal(
                        fontSize: 18,
                        color: const Color(0xff000000),
                      ),
                      textAlign: TextAlign.justify,
                      textDirection: TextDirection.rtl,
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    AppLocalizations.of(context).watsappUs,
                    style: GoogleFonts.tajawal(
                      fontSize: 15,
                      color: const Color(0xff000000),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  TextButton(
                    onPressed: launchWhatsApp,
                    child: Container(
                      width: 30.0,
                      height: 30.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: const AssetImage('assets/images/img15.png'),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: launchWhatsApp,
                    child: Text(
                      '0552525000 ',
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

            Padding(
              padding: const EdgeInsets.fromLTRB(0, 40, 0, 30),
              child: TextButton(
                onPressed: launchWhatsApp,
                child: Container(
                  width: 100,
                  height: 50.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    border:
                    Border.all(color: const Color(0xff00cccc), width: 1),
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
    );
  }
}

void launchWhatsApp() async {
  final link = WhatsAppUnilink(
    phoneNumber: '+966552525000',
    text: 'تطبيق تداول العقاري، بشأن خدمة التسويق الحصري',
  );
  await launch('$link');
}
