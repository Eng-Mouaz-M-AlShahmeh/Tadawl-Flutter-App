/*
Developed by: Eng Mouaz M. Al-Shahmeh
*/
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:tadawl_app/provider/ads_provider.dart';

class AqarVR extends StatelessWidget {
  AqarVR({
    Key key,
  }) : super(key: key);

  final GlobalKey<FormState> _aqarVRKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Consumer<AdsProvider>(builder: (context, aqarVR, child) {
      var mediaQuery = MediaQuery.of(context);
      Widget _buildIDNumber() {
        return TextFormField(
          decoration: InputDecoration(
              labelText: AppLocalizations.of(context).enterIDSaq),
          style: GoogleFonts.tajawal(
            fontSize: 8,
            color: const Color(0xffababab),
          ),
          keyboardType: TextInputType.number,
          validator: (String value) {
            if (value.isEmpty) {
              aqarVR.setButtonClickedAqarVR(null);
              return AppLocalizations.of(context).reqIDSaq;
            }
            return null;
          },
          onSaved: (String value) {
            aqarVR.setIdentityNumber(value);
          },
        );
      }

      Widget _buildSaqNumber() {
        return TextFormField(
          decoration: InputDecoration(
              labelText: AppLocalizations.of(context).enterSaqNumber),
          style: GoogleFonts.tajawal(
            fontSize: 10,
            color: const Color(0xffababab),
          ),
          keyboardType: TextInputType.number,
          validator: (String value) {
            if (value.isEmpty) {
              aqarVR.setButtonClickedAqarVR(null);
              return AppLocalizations.of(context).reqSaqNumber;
            }
            return null;
          },
          onSaved: (String value) {
            aqarVR.setSaqNumber(value);
          },
        );
      }



      return Scaffold(
        backgroundColor: const Color(0xffffffff),
        body: SingleChildScrollView(
          child: Form(
            key: _aqarVRKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        Container(
                          width: mediaQuery.size.width,
                          height: 100.0,
                          decoration: BoxDecoration(
                            color: const Color(0xff00cccc),
                          ),
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(50, 0, 15, 5),
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
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(15, 0, 15, 5),
                                  child: Text(
                                    AppLocalizations.of(context).reVR,
                                    style: GoogleFonts.tajawal(
                                      fontSize: 20,
                                      color: const Color(0xffffffff),
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        AppLocalizations.of(context).rule35,
                        style: GoogleFonts.tajawal(
                          fontSize: 15,
                          color: const Color(0xff989696),
                        ),
                        textAlign: TextAlign.right,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        AppLocalizations.of(context).saqNumber,
                        style: GoogleFonts.tajawal(
                          fontSize: 11,
                          color: const Color(0xff000000),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: Container(
                            width: mediaQuery.size.width * 0.5,
                            height: 50,
                            child: _buildSaqNumber()),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        AppLocalizations.of(context).saqImage,
                        style: GoogleFonts.tajawal(
                          fontSize: 11,
                          color: const Color(0xff000000),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            TextButton(
                              onPressed: () {
                                aqarVR.getImageAqarVR();
                              },
                              child: Container(
                                width: mediaQuery.size.width * 0.5,
                                height: mediaQuery.size.height * 0.3,
                                child: Center(
                                  child: aqarVR.imageAqarVR == null
                                      ? Container(
                                          width: mediaQuery.size.width * 0.6,
                                          height: mediaQuery.size.height * 0.25,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: const AssetImage(
                                                  'assets/images/img4.png'),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        )
                                      : Container(
                                          width: mediaQuery.size.width * 0.6,
                                          height: mediaQuery.size.height * 0.3,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image:
                                                  FileImage(aqarVR.imageAqarVR),
                                              fit: BoxFit.cover,
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
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        AppLocalizations.of(context).idType,
                        style: GoogleFonts.tajawal(
                          fontSize: 11,
                          color: const Color(0xff000000),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: Container(
                          width: mediaQuery.size.width,
                          height: 50,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ToggleButtons(
                                children: <Widget>[
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(5, 0, 5, 0),
                                    child: Text(
                                      AppLocalizations.of(context).commRec,
                                      style: GoogleFonts.tajawal(
                                        fontSize: 10,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(5, 0, 5, 0),
                                    child: Text(
                                      AppLocalizations.of(context)
                                          .accommodation,
                                      style: GoogleFonts.tajawal(fontSize: 10),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(5, 0, 5, 0),
                                    child: Text(
                                      AppLocalizations.of(context)
                                          .nationalIdentity,
                                      style: GoogleFonts.tajawal(
                                        fontSize: 10,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                                onPressed: (int index) {
                                  aqarVR.updateIdentityType(index);
                                },
                                isSelected: aqarVR.list_id_type,
                                color: const Color(0xff00cccc),
                                selectedColor: const Color(0xffffffff),
                                fillColor: const Color(0xff00cccc),
                                borderColor: const Color(0xff00cccc),
                                selectedBorderColor: const Color(0xff00cccc),
                                borderWidth: 1,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          AppLocalizations.of(context).idSaq,
                          style: GoogleFonts.tajawal(
                            fontSize: 8,
                            color: const Color(0xff000000),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: Container(
                            width: mediaQuery.size.width * 0.6,
                            height: 50,
                            child: _buildIDNumber()),
                      ),
                    ],
                  ),
                ),
                if (aqarVR.buttonClickedAqarVR == null)
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 30),
                    child: TextButton(
                      onPressed: () async {
                        aqarVR.setButtonClickedAqarVR(1);
                        if (!_aqarVRKey.currentState.validate()) {
                          return;
                        }
                        _aqarVRKey.currentState.save();
                        if (aqarVR.imageAqarVR == null) {
                          await Fluttertoast.showToast(
                              msg: 'صورة الصك مطلوبة',
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 15.0);
                          aqarVR.setButtonClickedAqarVR(null);
                        } else {
                          await aqarVR.sendInfoAqarVR(
                              context,
                              aqarVR.identity_number,
                              aqarVR.saq_number,
                              aqarVR.identity_type,
                              aqarVR.idDescription,
                              aqarVR.imageAqarVR);
                        }
                      },
                      child: Container(
                        width: 150,
                        height: 40.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                              color: const Color(0xff00cccc), width: 1),
                          color: const Color(0xffffffff),
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            AppLocalizations.of(context).reqVR,
                            style: GoogleFonts.tajawal(
                              fontSize: 15,
                              color: const Color(0xff00cccc),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                if (aqarVR.buttonClickedAqarVR == 1)
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 30),
                    child: Container(
                      width: 150,
                      height: 40.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(
                            color: const Color(0xff989898), width: 1),
                        color: const Color(0xffffffff),
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          AppLocalizations.of(context).reqVR,
                          style: GoogleFonts.tajawal(
                            fontSize: 15,
                            color: const Color(0xff989898),
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
