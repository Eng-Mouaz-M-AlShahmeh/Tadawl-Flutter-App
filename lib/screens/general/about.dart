/*
Developed by: Eng Mouaz M. Al-Shahmeh
*/
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:core';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';

class About extends StatelessWidget {
  About({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      appBar: AppBar(
        backgroundColor: Color(0xff00cccc),
        title: Padding(
          padding: const EdgeInsets.fromLTRB(80, 0, 80, 0),
          child: Text(
            AppLocalizations.of(context).about,
            style: GoogleFonts.tajawal(
              fontSize: 20,
              color: const Color(0xffffffff),
            ),
            textAlign: TextAlign.center,
          ),
        ),
        toolbarHeight: 80,
        leading: Text(''),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                  child: Container(
                    width: double.infinity,
                    height: 47.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      border: Border.all(
                          width: 2.0, color: const Color(0xff00cccc)),
                    ),
                    child: Center(
                      child: Text(
                        AppLocalizations.of(context).tadawl,
                        style: GoogleFonts.tajawal(
                          fontSize: 20,
                          color: const Color(0xff00cccc),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(50, 50, 50, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: launchWhatsApp,
                        child: Text(
                          AppLocalizations.of(context).support,
                          style: GoogleFonts.tajawal(
                            fontSize: 20,
                            color: const Color(0xff00cccc),
                          ),
                        ),
                      ),
                      TextButton(
                        child: Icon(
                          Icons.message_rounded,
                          color: Color(0xff00cccc),
                          size: 40,
                        ),
                        onPressed: launchWhatsApp,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: _launchURLTwitter,
                        child: Text(
                          '@TADAWLAPP',
                          style: GoogleFonts.tajawal(
                            fontSize: 20,
                            color: const Color(0xff00cccc),
                          ),
                        ),
                      ),
                      TextButton(
                        child: Container(
                          width: 39.0,
                          height: 33.0,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image:
                                  const AssetImage('assets/images/img20.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        onPressed: _launchURLTwitter,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          Share.share('Tadawl App');
                        },
                        child: Text(
                          AppLocalizations.of(context).shareApp,
                          style: GoogleFonts.tajawal(
                            fontSize: 20,
                            color: const Color(0xff00cccc),
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
                          Share.share('Tadawl App');
                        },
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {
                          launch(_emailLaunchUri.toString());
                        },
                        child: Text(
                          'support@tadawl.com.sa',
                          style: GoogleFonts.tajawal(
                            fontSize: 20,
                            color: const Color(0xff434388),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        child: Container(
                          width: 300.0,
                          height: 300.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: const AssetImage(
                                  'assets/images/imgsnap.jpeg'),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        onPressed: _launchURLSnapchat,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(50, 15, 50, 0),
                  child: Container(
                    width: double.infinity,
                    height: 47.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(0.0),
                      border: Border.all(
                          width: 2.0, color: const Color(0xff3f9d28)),
                    ),
                    child: Center(
                      child: Text(
                        AppLocalizations.of(context).directoryServices,
                        style: GoogleFonts.tajawal(
                          fontSize: 20,
                          color: const Color(0xff3f9d28),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(50, 15, 50, 0),
                  child: Container(
                    width: double.infinity,
                    height: 47.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(0.0),
                      border: Border.all(
                          width: 2.0, color: const Color(0xff3f9d28)),
                    ),
                    child: Center(
                      child: Text(
                        AppLocalizations.of(context).commonQuestions,
                        style: GoogleFonts.tajawal(
                          fontSize: 20,
                          color: const Color(0xff3f9d28),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: Text(
                    AppLocalizations.of(context).tadawl,
                    style: GoogleFonts.tajawal(
                      fontSize: 10,
                      color: const Color(0xff707070),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Text(
                  'v 1.0.0',
                  style: GoogleFonts.tajawal(
                    fontSize: 10,
                    color: const Color(0xff707070),
                  ),
                  textAlign: TextAlign.center,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: Text(
                          AppLocalizations.of(context).developedCompany,
                          style: GoogleFonts.tajawal(
                            fontSize: 13,
                            color: const Color(0xff707070),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      TextButton(
                        child: Container(
                          width: 100.0,
                          height: 30.0,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: const AssetImage(
                                  'assets/images/logoStarsTech.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        onPressed: _launchURLWebsite,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

void _launchURLTwitter() async {
  const url = 'https://twitter.com/TADAWLAPP';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

void _launchURLWebsite() async {
  const url = 'https://www.sta.sa';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

void _launchURLSnapchat() async {
  const url = 'https://www.snapchat.com/add/tadawl_comsa';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

final Uri _emailLaunchUri = Uri(
    scheme: 'mailto',
    path: 'support@tadawl.com.sa',
    queryParameters: {'subject': 'تطبيق تداول العقاري'});
void launchWhatsApp() async {
  final link = WhatsAppUnilink(
    phoneNumber: '+966552525000',
    text: 'تطبيق تداول العقاري - الدعم الفني',
  );
  await launch('$link');
}
