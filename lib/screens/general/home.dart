/*
Developed by: Eng Mouaz M. Al-Shahmeh
*/
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:tadawl_app/provider/NotificationProvider.dart';
import 'package:tadawl_app/provider/ads_provider.dart';
import 'package:tadawl_app/provider/user_provider.dart';
import 'package:tadawl_app/screens/ads/main_page.dart';

class Home extends StatelessWidget {
  Home({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Provider.of<AdsProvider>(context, listen: false).getLoc();
    Provider.of<AdsProvider>(context, listen: false).initStateSelected();
    Provider.of<AdsProvider>(context, listen: false).setMenuMainFilterAds(2);
    Provider.of<AdsProvider>(context, listen: false).getAdsList(
        context, null, null, null, null, null, null, null, null, null, null, null,
        null, null, null, null, null, null, null, null, null, null, null, null,
        null, null, null, null, null, null, null, null, null, null, null, null,
        null, null);
    Provider.of<AdsProvider>(context, listen: false)
        .getAdsSpecialList(context);
    Provider.of<AdsProvider>(context, listen: false).getTodayAdsList(context);
    Provider.of<AdsProvider>(context, listen: false).clearMenuFilter(context);
    Provider.of<AdsProvider>(context, listen: false).randomPosition(50);
    Provider.of<AdsProvider>(context, listen: false).getCategoryeInfoAddAds(context);
    Provider.of<AdsProvider>(context, listen: false).getMenuList(
        context, null, null, null, null, null, null, null, null, null, null, null,
        null, null, null, null, null, null, null, null, null, null, null, null,
        null, null, null, null, null, null, null, null, null, null, null, null,
        null, null);
    Provider.of<UserProvider>(context, listen: false).getOfficeList(context);

    Provider.of<UserProvider>(context, listen: false).getUsersList(context, Provider.of<UserProvider>(context, listen: false).phone);

    Provider.of<AdsProvider>(context, listen: false).getTodayAdsList(context);

    Provider.of<UserProvider>(context, listen: false).getUserAdsFavList(context, Provider.of<UserProvider>(context, listen: false).phone);

    Provider.of<NotificationProvider>(context, listen: false)
        .getNotificationsList(
        context, Provider.of<UserProvider>(context, listen: false).phone);

    Provider.of<UserProvider>(context, listen: false).getSession();

    Provider.of<UserProvider>(context, listen: false).initStateSelected();

    Future.delayed(Duration(seconds: 1), () {
      Provider.of<UserProvider>(context, listen: false).getConvInfo(context);
    });

    Future.delayed(Duration(seconds: 5), () {
      Provider.of<NotificationProvider>(context, listen: false)
          .showNotification(context,
          Provider.of<UserProvider>(context, listen: false).phone);
    });

    return Scaffold(
        backgroundColor: const Color(0xff1f2835),
        body: AnimatedSplashScreen(
          duration: 2500,
          splash: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: ExactAssetImage('assets/images/logo.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          nextScreen: MainPage(),
          splashTransition: SplashTransition.fadeTransition,
          splashIconSize: 200,
          backgroundColor: const Color(0xff1f2835),
        ));
  }
}
