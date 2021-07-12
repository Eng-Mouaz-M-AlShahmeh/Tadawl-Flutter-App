/*
Developed by: Eng Mouaz M. Al-Shahmeh
*/
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tadawl_app/provider/user_provider.dart';
import 'package:tadawl_app/screens/account/login.dart';
import 'package:tadawl_app/screens/account/verifyAccount.dart';

String pattternPhone =
    r'(^(009665|9665|\+9665|05|5)(5|0|3|6|4|9|1|8|7)([0-9]{7})$)';
RegExp regExpPhone = RegExp(pattternPhone);

class NewAcount extends StatelessWidget {
  NewAcount({
    Key key,
  }) : super(key: key);

  final GlobalKey<FormState> _formNewAccountKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return  Consumer<UserProvider>(builder: (context, newAccount, child) {

      return Scaffold(
        backgroundColor: const Color(0xffffffff),
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: Align(
              alignment: Alignment.topCenter,
              child: Text(
                AppLocalizations
                    .of(context)
                    .newAccount,
                style: GoogleFonts.tajawal(
                  fontSize: 30,
                  color: const Color(0xffffffff),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          leading: Text(''),
          backgroundColor: Color(0xff00cccc),
        ),
        body: Container(
          child: Form(
            key: _formNewAccountKey,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: SizedBox(
                      width: double.infinity,
                      child: Text(
                        AppLocalizations
                            .of(context)
                            .enterMob,
                        style: GoogleFonts.tajawal(
                          fontSize: 20,
                          color: const Color(0xff989696),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: ListTile(
                      leading: Icon(
                        Icons.phone_enabled,
                        color: Color(0xff00cccc),
                        size: 30,
                      ),
                      title: TextFormField(
                        decoration: InputDecoration(
                            labelText: AppLocalizations
                                .of(context)
                                .mobileNumber),
                        style: GoogleFonts.tajawal(
                          fontSize: 15,
                          color: const Color(0xff989696),
                        ),
                        keyboardType: TextInputType.phone,
                        validator: (String value) {
                          if (value.isEmpty) {
                            return AppLocalizations
                                .of(context)
                                .reqMob;
                          } else if (!regExpPhone.hasMatch(value)) {
                            return AppLocalizations
                                .of(context)
                                .reqSaudiMob;
                          }
                          return null;
                        },
                        onSaved: (String value) {
                          newAccount.setNewAccountPhone(value);
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(50, 15, 50, 0),
                    child: Container(
                      width: double.infinity,
                      height: 50.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        color: const Color(0xffffffff),
                        border: Border.all(
                            width: 1.0, color: const Color(0xff00cccc)),
                      ),
                      child: TextButton(
                        child: Center(
                          child: Text(
                            AppLocalizations
                                .of(context)
                                .sendVR,
                            style: GoogleFonts.tajawal(
                              fontSize: 20,
                              color: const Color(0xff00cccc),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        onPressed: () async {
                          if (!_formNewAccountKey.currentState.validate()) {
                            return;
                          }
                          _formNewAccountKey.currentState.save();
                          var url =
                              'https://www.tadawl.com.sa/API/api_app/login/new_account.php';
                          var response = await http.post(url, body: {
                            'phone': newAccount.newAccountPhone,
                          });
                          var data = json.decode(response.body);
                          if (data == 'false') {
                            await Fluttertoast.showToast(
                                msg:
                                'رقم الجوال مسجل مسبقاً، لماذا لا تجرب تسجيل الدخول',
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 15.0);
                          } else if (data == 'succesful') {
                            await Fluttertoast.showToast(
                                msg: 'لقد تم إرسال رمز اتفعيل إلى رقم جوالك',
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.green,
                                textColor: Colors.white,
                                fontSize: 15.0);
                            newAccount..saveSession(newAccount.newAccountPhone);
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => VerifyAccount()),
                            );
                          }
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                    child: SizedBox(
                      width: double.infinity,
                      child: Text(
                        AppLocalizations
                            .of(context)
                            .mobHint,
                        style: GoogleFonts.tajawal(
                          fontSize: 15,
                          color: const Color(0xff6b6b6b),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                    child: SizedBox(
                      width: double.infinity,
                      child: Text(
                        AppLocalizations
                            .of(context)
                            .haveAccount,
                        style: GoogleFonts.tajawal(
                          fontSize: 15,
                          color: const Color(0xff6b6b6b),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(50, 15, 50, 0),
                    child: Container(
                      width: double.infinity,
                      height: 50.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        color: const Color(0xffffffff),
                        border: Border.all(
                            width: 1.0, color: const Color(0xff3f9d28)),
                      ),
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Login()),
                          );
                        },
                        child: Center(
                          child: Text(
                            AppLocalizations
                                .of(context)
                                .login,
                            style: GoogleFonts.tajawal(
                              fontSize: 20,
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
            ),
          ),
        ),
      );
    }
    );
  }
}
