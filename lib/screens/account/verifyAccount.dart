/*
Developed by: Eng Mouaz M. Al-Shahmeh
*/
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:tadawl_app/provider/user_provider.dart';
import 'package:tadawl_app/screens/account/update_my_information.dart';

class VerifyAccount extends StatelessWidget {
  VerifyAccount({
    Key key,
  }) : super(key: key);

  final GlobalKey<FormState> _formVerAccountKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(builder: (context, verifyAcc, child) {
      var mediaQuery = MediaQuery.of(context);

      verifyAcc.getSession();
      var _phone = verifyAcc.phone;

      Widget _buildNewPass() {
        return TextFormField(
          decoration:
              InputDecoration(labelText: AppLocalizations.of(context).newPass),
          style: GoogleFonts.tajawal(
            fontSize: 15,
            color: const Color(0xff989696),
          ),
          keyboardType: TextInputType.visiblePassword,
          validator: (String value) {
            if (value.isEmpty) {
              return AppLocalizations.of(context).reqNewPass;
            } else if (value.length < 8) {
              return AppLocalizations.of(context).reqPassless8;
            }
            return null;
          },
          onSaved: (String value) {
            verifyAcc.setNewPass(value);
          },
        );
      }

      Widget _buildReNewPass() {
        return TextFormField(
          decoration: InputDecoration(
              labelText: AppLocalizations.of(context).confirmNewPass),
          style: GoogleFonts.tajawal(
            fontSize: 15,
            color: const Color(0xff989696),
          ),
          keyboardType: TextInputType.visiblePassword,
          validator: (String value) {
            if (value.isEmpty) {
              return AppLocalizations.of(context).reqConfirmNewPass;
            } else if (value.length < 8) {
              return AppLocalizations.of(context).reqPassless8;
            } //else if (value != verifyAcc.newPass) {
             // return AppLocalizations.of(context).notMatch;
           // }
            return null;
          },
          onSaved: (String value) {
            verifyAcc.setReNewPass(value);
          },
        );
      }

      return Scaffold(
        backgroundColor: const Color(0xffffffff),
        body: Container(
          child: Form(
            key: _formVerAccountKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  if (verifyAcc.current_stage == null)
                    Column(
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              15, 0, 15, 5),
                                          child: Text(
                                            AppLocalizations.of(context)
                                                .verAccount,
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                              child: SizedBox(
                                width: mediaQuery.size.width * 0.7,
                                height: 70,
                                child: TextFormField(
                                  decoration: InputDecoration(
                                      labelText:
                                          AppLocalizations.of(context).enterVR),
                                  style: GoogleFonts.tajawal(
                                    fontSize: 15,
                                    color: const Color(0xff989696),
                                  ),
                                  keyboardType: TextInputType.number,
                                  validator: (String value) {
                                    if (value.isEmpty) {
                                      return AppLocalizations.of(context).reqVR;
                                    }
                                    return null;
                                  },
                                  onSaved: (String value) {
                                    verifyAcc.setVerCode(value);
                                  },
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                              child: Icon(
                                Icons.verified_user_rounded,
                                color: Color(0xff00cccc),
                                size: 40,
                              ),
                            ),
                          ],
                        ),
                        TextButton(
                          onPressed: () async {
                            if (!_formVerAccountKey.currentState.validate()) {
                              return;
                            }
                            _formVerAccountKey.currentState.save();
                            var url =
                                'https://www.tadawl.com.sa/API/api_app/login/verifyAccount.php';
                            var response = await http.post(url, body: {
                              'phone': _phone,
                              'verCode': verifyAcc.verificationCode,
                            });
                            var data = json.decode(response.body);
                            if (data == 'error') {
                              await Fluttertoast.showToast(
                                  msg: 'رقم الجوال غير موجود',
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 15.0);
                            } else if (data == 'false') {
                              await Fluttertoast.showToast(
                                  msg: 'كود التفعيل غير صحيح',
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 15.0);
                            } else if (data == 'successful') {
                              await Fluttertoast.showToast(
                                  msg: 'تم تفعيل الحساب',
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.green,
                                  textColor: Colors.white,
                                  fontSize: 15.0);

                              verifyAcc.setCurrentStage(2);
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                            child: Container(
                              width: mediaQuery.size.width * 0.8,
                              height: 50.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                color: const Color(0xff00cccc),
                                border: Border.all(
                                    width: 1.0, color: const Color(0xff00cccc)),
                              ),
                              child: Center(
                                child: Text(
                                    AppLocalizations.of(context).verAccount,
                                    style: GoogleFonts.tajawal(
                                      fontSize: 20,
                                      color: const Color(0xffffffff),
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  else if (verifyAcc.current_stage == 2)
                    Column(
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              15, 0, 15, 5),
                                          child: Text(
                                            AppLocalizations.of(context)
                                                .configNewPass,
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
                          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              SizedBox(
                                width: mediaQuery.size.width * 0.7,
                                child: _buildNewPass(),
                              ),
                              Icon(
                                Icons.vpn_key_rounded,
                                color: Color(0xff00cccc),
                                size: 40,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              SizedBox(
                                width: mediaQuery.size.width * 0.7,
                                child: _buildReNewPass(),
                              ),
                              Icon(
                                Icons.vpn_key_outlined,
                                color: Color(0xff00cccc),
                                size: 40,
                              ),
                            ],
                          ),
                        ),
                        TextButton(
                          onPressed: () async {
                            if (!_formVerAccountKey.currentState.validate()) {
                              return;
                            }
                            _formVerAccountKey.currentState.save();
                            var url =
                                'https://www.tadawl.com.sa/API/api_app/login/config_pass.php';
                            var response = await http.post(url, body: {
                              'phone': _phone,
                              'password': verifyAcc.newPass,
                              'rePassword': verifyAcc.reNewPass,
                            });
                            var data = json.decode(response.body);
                            if (data == 'nomatch') {
                              await Fluttertoast.showToast(
                                  msg: 'كلمة المرور والتأكيد غير متطابقان',
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 15.0);
                            }

                            else if (data == 'error') {
                              await Fluttertoast.showToast(
                                  msg: 'رقم الجوال غير موجود',
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 15.0);
                            } else if (data == 'successful') {
                              await Fluttertoast.showToast(
                                  msg: 'تم تسجيل الدخول بنجاح',
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.green,
                                  textColor: Colors.white,
                                  fontSize: 15.0);

                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        UpdateMyInformation()),
                              );
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                            child: Container(
                              width: mediaQuery.size.width * 0.8,
                              height: 50.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                color: const Color(0xff00cccc),
                                border: Border.all(
                                    width: 1.0, color: const Color(0xff00cccc)),
                              ),
                              child: Center(
                                child: Text(
                                    AppLocalizations.of(context).continuee,
                                    style: GoogleFonts.tajawal(
                                      fontSize: 20,
                                      color: const Color(0xffffffff),
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
