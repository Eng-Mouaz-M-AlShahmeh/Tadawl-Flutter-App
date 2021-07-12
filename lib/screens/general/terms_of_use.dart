
/*
Developed by: Eng Mouaz M. Al-Shahmeh
*/
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:tadawl_app/provider/general_provider.dart';

class TermsOfUse extends StatelessWidget {
  TermsOfUse({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<GeneralProvider>(builder: (context, terms, child) {
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
            AppLocalizations.of(context).usageTerms,
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
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 5),
                      child: Text(
                        'اتفاقية شروط استخدام موقع تطبيق تداول العقاري',
                        style: GoogleFonts.tajawal(
                          fontSize: 15,
                          color: const Color(0xff00cccc),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child: Text(
                          'أهلا بك في تطبيق تداول العقاري باستعمالك لهذا التطبيق، فإنك توافق على أن تتقيد وتلتزم بالشروط والأحكام التالية لذا، يرجى منك الاطلاع على هذه الأحكام بدقة. أن كنت لا توافق على هذه الأحكام، فعليك ألا تتطلع على المعلومات المتوفرة في التطبيق',
                          style: GoogleFonts.tajawal(
                            fontSize: 15,
                            color: const Color(0xff000000),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                ExpansionPanelList(
                  expansionCallback: (int index, bool isExpanded) {
                    terms.setExpanded(index, isExpanded);
                  },
                  children: terms.data.map<ExpansionPanel>((Item item) {
                    return ExpansionPanel(
                        headerBuilder: (BuildContext context, bool isExpanded) {
                          return ListTile(
                            title: Text(
                              item.headerValue,
                              style: GoogleFonts.tajawal(
                                fontSize: 15,
                                color: const Color(0xff00cccc),
                              ),
                            ),
                          );
                        },
                        body: ListTile(
                          title: Text(
                            item.expandedValue,
                            style: GoogleFonts.tajawal(
                              fontSize: 15,
                              color: const Color(0xff000000),
                            ),
                          ),
                        ),
                        isExpanded: item.isExpanded);
                  }).toList(),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
