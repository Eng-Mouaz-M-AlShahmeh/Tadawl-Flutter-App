/*
Developed by: Eng Mouaz M. Al-Shahmeh
*/

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tadawl_app/provider/general_provider.dart';
import 'package:tadawl_app/provider/l10n/l10n.dart';
import 'package:tadawl_app/provider/region_provider.dart';
import 'package:tadawl_app/screens/account/estimateUser.dart';
import 'package:tadawl_app/screens/ads/aqar_vr.dart';
import 'package:tadawl_app/screens/ads/payment_of_fees.dart';
import 'package:tadawl_app/screens/ads/update_details.dart';
import 'package:tadawl_app/screens/ads/update_images_video.dart';
import 'package:tadawl_app/screens/ads/update_location.dart';
import 'package:tadawl_app/screens/general/home.dart';
import 'package:tadawl_app/mainWidgets/open_images.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tadawl_app/provider/NotificationProvider.dart';
import 'package:tadawl_app/provider/locale_provider.dart';
import 'package:tadawl_app/provider/cache_markers_provider.dart';
import 'package:tadawl_app/provider/ads_provider.dart';
import 'package:tadawl_app/provider/request_provider.dart';
import 'package:tadawl_app/provider/user_provider.dart';
import 'package:tadawl_app/screens/account/discussion_main.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

SharedPreferences localStorage;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: [
          ChangeNotifierProvider<LocaleProvider>(
              create: (_) => LocaleProvider()),
          ChangeNotifierProvider<CacheMarkerModel>(
              create: (_) => CacheMarkerModel()),
          ChangeNotifierProvider<AdsProvider>(create: (context) => AdsProvider()),
          ChangeNotifierProvider<UserProvider>(create: (context) => UserProvider()),
          ChangeNotifierProvider<RequestProvider>(
              create: (_) => RequestProvider()),
          ChangeNotifierProvider<RegionProvider>(
              create: (_) => RegionProvider()),
          ChangeNotifierProvider<NotificationProvider>(
              create: (_) => NotificationProvider()),
          ChangeNotifierProvider<GeneralProvider>(
              create: (_) => GeneralProvider()),
        ],
        builder: (context, child) {
          final provider = Provider.of<LocaleProvider>(context);
          return MaterialApp(
            routes: {
              '/main/discussion_main': (context) => Discussion(),
              '/main/payment_of_fees': (context) => PaymentOfFees(),
              '/main/open_images': (context) => OpenImages(),
              '/main/update_ads_img_ved': (context) => UpdateImgVed(),
              '/main/update_location': (context) => UpdateLocation(),
              '/main/update_datails': (context) => UpdateDetails(),
              '/main/aqar_vr': (context) => AqarVR(),
              '/main/estimate_user': (context) => Estimate(),
            },
            // ignore: missing_return
            localeListResolutionCallback: (locales, supportedLocales) {
              for (var i = 0; i < locales.length; i++) {
                if (provider.locale == null) {
                  return Locale('ar', 'SA');
                }
              }
            },
            locale: provider.locale,
            supportedLocales: L10n.all,
            localizationsDelegates: [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            debugShowCheckedModeBanner: false,
            title: 'Tadawl App',
            home: Home(),
          );
        },
      );
}
