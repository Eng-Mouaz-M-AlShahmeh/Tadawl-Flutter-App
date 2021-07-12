/*
Developed by: Eng Mouaz M. Al-Shahmeh
*/
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tadawl_app/provider/ads_provider.dart';
import 'package:tadawl_app/provider/user_provider.dart';
import 'package:tadawl_app/screens/account/login.dart';
import 'package:tadawl_app/screens/account/transfer_form.dart';

class PaymentOfFees extends StatelessWidget {
  PaymentOfFees({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AdsProvider>(builder: (context, payFee, child) {
      var mediaQuery = MediaQuery.of(context);
      // ignore: omit_local_variable_types
      Map data = {};
      var price, type;
      //String cardNumber, cardName, cvvNumber, year, month;
      Provider.of<UserProvider>(context, listen: false).getSession();
      var _phone = Provider.of<UserProvider>(context, listen: false).phone;
      data = ModalRoute.of(context).settings.arguments;
      price = data['price'];
      type = data['type'];


      //payFee.initStateSelected();

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
            AppLocalizations.of(context).payFees,
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
              Container(
                width: mediaQuery.size.width,
                height: 70.0,
                decoration: BoxDecoration(
                  color: const Color(0xffffffff),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: ToggleButtons(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              AppLocalizations.of(context).transferBank,
                              style: GoogleFonts.tajawal(
                                fontSize: 15,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              AppLocalizations.of(context).onlinePay,
                              style: GoogleFonts.tajawal(
                                fontSize: 15,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                        onPressed: (int index) {
                          payFee.updateSelected3(index);
                        },
                        isSelected: payFee.isSelected3,
                        color: const Color(0xff8d8d8d),
                        selectedColor: const Color(0xffffffff),
                        fillColor: const Color(0xff3f9d28),
                        borderRadius: BorderRadius.circular(5),
                        borderWidth: 2,
                        borderColor: const Color(0xff3f9d28),
                        selectedBorderColor: const Color(0xff3f9d28),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                color: const Color(0xffa8a8a8),
                height: 10,
                thickness: 2,
                indent: 20,
                endIndent: 20,
              ),
              if (payFee.selectedNav3 == 1)
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            AppLocalizations.of(context).cost +
                                ' $price ' +
                                AppLocalizations.of(context).to +
                                ' $type ',
                            style: GoogleFonts.tajawal(
                              fontSize: 13,
                              color: const Color(0xffa8a8a8),
                            ),
                            // textAlign: TextAlign.right,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
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
                                textAlign: TextAlign.right,
                              ),
                            ],
                          ),
                          Container(
                            child: SizedBox(
                              width: 120,
                              height: 30,
                              child: TextFormField(
                                decoration: InputDecoration(
                                  labelText:
                                      AppLocalizations.of(context).coupon,
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
                                    return AppLocalizations.of(context)
                                        .reqCoupon;
                                  }
                                  return null;
                                },
                               // onSaved: (String value) {
                               //   cvvNumber = value;
                               // },
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
                                  textAlign: TextAlign.center,
                                ),
                              ),
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
                            AppLocalizations.of(context).cardNumber,
                            style: GoogleFonts.tajawal(
                              fontSize: 15,
                              color: const Color(0xff000000),
                            ),
                            textAlign: TextAlign.right,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: AppLocalizations.of(context).cardNumber,
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
                        keyboardType: TextInputType.text,
                        minLines: 1,
                        maxLines: 1,
                        validator: (String value) {
                          if (value.isEmpty) {
                            return AppLocalizations.of(context).reqCardNumber;
                          }
                          return null;
                        },
                       // onSaved: (String value) {
                        //  cardNumber = value;
                       // },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            AppLocalizations.of(context).cardNumberName,
                            style: GoogleFonts.tajawal(
                              fontSize: 15,
                              color: const Color(0xff000000),
                            ),
                            textAlign: TextAlign.right,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText:
                              AppLocalizations.of(context).cardNumberName,
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
                        keyboardType: TextInputType.text,
                        minLines: 1,
                        maxLines: 1,
                        validator: (String value) {
                          if (value.isEmpty) {
                            return AppLocalizations.of(context)
                                .reqCardNumberName;
                          }
                          return null;
                        },
                       // onSaved: (String value) {
                       //   cardName = value;
                       // },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      AppLocalizations.of(context).cvv,
                                      style: GoogleFonts.tajawal(
                                        fontSize: 15,
                                        color: const Color(0xff000000),
                                      ),
                                      textAlign: TextAlign.right,
                                    ),
                                  ],
                                ),
                                Container(
                                  child: SizedBox(
                                    width: 120,
                                    height: 50,
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
                                     // onSaved: (String value) {
                                     //   cvvNumber = value;
                                    //  },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    AppLocalizations.of(context).endDate,
                                    style: GoogleFonts.tajawal(
                                      fontSize: 15,
                                      color: const Color(0xff000000),
                                    ),
                                    textAlign: TextAlign.right,
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 0, 10, 0),
                                    child: Container(
                                      child: SizedBox(
                                        width: 50,
                                        height: 50,
                                        child: TextFormField(
                                          decoration: InputDecoration(
                                            labelText:
                                                AppLocalizations.of(context)
                                                    .year,
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
                                              return AppLocalizations.of(
                                                      context)
                                                  .reqYear;
                                            }
                                            return null;
                                          },
                                         // onSaved: (String value) {
                                         //   year = value;
                                         // },
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: SizedBox(
                                      width: 50,
                                      height: 50,
                                      child: TextFormField(
                                        decoration: InputDecoration(
                                          labelText:
                                              AppLocalizations.of(context)
                                                  .month,
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
                                      //  onSaved: (String value) {
                                       //   month = value;
                                       // },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        if (_phone != null) {
                        } else {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Login()),
                          );
                        }
                      },
                      child: Container(
                        width: 70,
                        height: 40.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                              color: const Color(0xff3f9d28), width: 2),
                          color: const Color(0xffffffff),
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            AppLocalizations.of(context).pay,
                            style: GoogleFonts.tajawal(
                              fontSize: 15,
                              color: const Color(0xff3f9d28),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              AppLocalizations.of(context).rule22,
                              style: GoogleFonts.tajawal(
                                fontSize: 13,
                                color: const Color(0xff989696),
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: 99.0,
                            height: 70.0,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image:
                                    const AssetImage('assets/images/img18.png'),
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          Container(
                            width: 99.0,
                            height: 70.0,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image:
                                    const AssetImage('assets/images/img6.png'),
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          Container(
                            width: 99.0,
                            height: 70.0,
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
                  ],
                ),
              if (payFee.selectedNav3 == 0)
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          AppLocalizations.of(context).tadawlAppCC,
                          style: GoogleFonts.tajawal(
                            fontSize: 15,
                            color: const Color(0xff000000),
                          ),
                          textAlign: TextAlign.right,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          AppLocalizations.of(context).bankAccounts,
                          style: GoogleFonts.tajawal(
                            fontSize: 13,
                            color: const Color(0xffa8a8a8),
                          ),
                          textAlign: TextAlign.right,
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          TextButton(
                            onPressed: () {
                              payFee.updateSelectedNav4(1);
                            },
                            child: Container(
                              width: 150.0,
                              height: 81.0,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: payFee.selectedNav4 == 1
                                        ? Color(0xff00cccc)
                                        : Color(0xffa6a6a6),
                                    offset: const Offset(
                                      2.0,
                                      2.0,
                                    ),
                                    blurRadius: 5.0,
                                    spreadRadius: 1.0,
                                  ), //BoxShadow
                                  BoxShadow(
                                    color: Colors.white,
                                    offset: const Offset(0.0, 0.0),
                                    blurRadius: 0.0,
                                    spreadRadius: 0.0,
                                  ), //BoxShadow
                                ],
                                image: DecorationImage(
                                  image: const AssetImage(
                                      'assets/images/ahli.jpg'),
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              payFee.updateSelectedNav4(2);
                            },
                            child: Container(
                              width: 150.0,
                              height: 81.0,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: payFee.selectedNav4 == 2
                                        ? Color(0xff00cccc)
                                        : Color(0xffa6a6a6),
                                    offset: const Offset(
                                      2.0,
                                      2.0,
                                    ),
                                    blurRadius: 5.0,
                                    spreadRadius: 1.0,
                                  ), //BoxShadow
                                  BoxShadow(
                                    color: Colors.white,
                                    offset: const Offset(0.0, 0.0),
                                    blurRadius: 0.0,
                                    spreadRadius: 0.0,
                                  ), //BoxShadow
                                ],
                                image: DecorationImage(
                                  image: const AssetImage(
                                      'assets/images/rajhi.png'),
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (payFee.selectedNav4 == 1)
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  AppLocalizations.of(context).accountNumber,
                                  style: GoogleFonts.tajawal(
                                    fontSize: 13,
                                    color: const Color(0xff8d8d8d),
                                  ),
                                  textAlign: TextAlign.right,
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButton(
                                onPressed: () {
                                  Clipboard.setData(
                                    ClipboardData(text: '01400004728810'),
                                  );
                                },
                                child: Text(
                                  '01400004728810',
                                  style: GoogleFonts.tajawal(
                                    fontSize: 13,
                                    color: const Color(0xff8d8d8d),
                                  ),
                                  textAlign: TextAlign.right,
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  AppLocalizations.of(context).iBANnumber,
                                  style: GoogleFonts.tajawal(
                                    fontSize: 13,
                                    color: const Color(0xff8d8d8d),
                                  ),
                                  textAlign: TextAlign.right,
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButton(
                                onPressed: () {
                                  Clipboard.setData(
                                    ClipboardData(
                                        text: 'SA1810000001400004728810'),
                                  );
                                },
                                child: Text(
                                  'SA1810000001400004728810',
                                  style: GoogleFonts.tajawal(
                                    fontSize: 13,
                                    color: const Color(0xff8d8d8d),
                                  ),
                                  textAlign: TextAlign.right,
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  AppLocalizations.of(context).rule23,
                                  style: GoogleFonts.tajawal(
                                    fontSize: 13,
                                    color: const Color(0xff8d8d8d),
                                  ),
                                  textAlign: TextAlign.right,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    if (payFee.selectedNav4 == 2)
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  AppLocalizations.of(context).accountNumber,
                                  style: GoogleFonts.tajawal(
                                    fontSize: 13,
                                    color: const Color(0xff8d8d8d),
                                  ),
                                  textAlign: TextAlign.right,
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButton(
                                onPressed: () {
                                  Clipboard.setData(
                                    ClipboardData(text: '558608016024859'),
                                  );
                                },
                                child: Text(
                                  '558608016024859',
                                  style: GoogleFonts.tajawal(
                                    fontSize: 13,
                                    color: const Color(0xff8d8d8d),
                                  ),
                                  textAlign: TextAlign.right,
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  AppLocalizations.of(context).iBANnumber,
                                  style: GoogleFonts.tajawal(
                                    fontSize: 13,
                                    color: const Color(0xff8d8d8d),
                                  ),
                                  textAlign: TextAlign.right,
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButton(
                                onPressed: () {
                                  Clipboard.setData(
                                    ClipboardData(
                                        text: 'SA4380000558608016024859'),
                                  );
                                },
                                child: Text(
                                  'SA4380000558608016024859',
                                  style: GoogleFonts.tajawal(
                                    fontSize: 13,
                                    color: const Color(0xff8d8d8d),
                                  ),
                                  textAlign: TextAlign.right,
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  AppLocalizations.of(context).rule23,
                                  style: GoogleFonts.tajawal(
                                    fontSize: 13,
                                    color: const Color(0xff8d8d8d),
                                  ),
                                  textAlign: TextAlign.right,
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
                            width: mediaQuery.size.width * 0.9,
                            height: 120.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: const Color(0xffececec),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(5, 10, 5, 0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            5, 0, 5, 0),
                                        child: Icon(
                                          Icons.emoji_objects_rounded,
                                          color: Color(0xffffd633),
                                          size: 25,
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          AppLocalizations.of(context).rule24,
                                          style: GoogleFonts.tajawal(
                                            fontSize: 11,
                                            color: const Color(0xffa8a8a8),
                                          ),
                                          textAlign: TextAlign.right,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 10, 0, 0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      TextButton(
                                        onPressed: () {
                                          if (_phone != null) {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      TransferForm()),
                                            );
                                          } else {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Login()),
                                            );
                                          }
                                        },
                                        child: Container(
                                          width: 100,
                                          height: 40.0,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            border: Border.all(
                                                color: const Color(0xff3f9d28),
                                                width: 1),
                                            color: const Color(0xffffffff),
                                          ),
                                          child: Align(
                                            alignment: Alignment.center,
                                            child: Center(
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
            ],
          ),
        ),
      );
    });
  }
}
