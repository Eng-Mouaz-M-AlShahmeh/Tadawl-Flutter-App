/*
Developed by: Eng Mouaz M. Al-Shahmeh
*/
import 'package:flutter/material.dart';
import 'package:pinch_zoom_image_last/pinch_zoom_image_last.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tadawl_app/provider/ads_provider.dart';

class OpenImages extends StatelessWidget {
  OpenImages({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AdsProvider>(builder: (context, images, child) {

      //images.randomPosition(300);

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
            AppLocalizations.of(context).adsImages,
            style: GoogleFonts.tajawal(
              fontSize: 20,
              color: const Color(0xffffffff),
            ),
            textAlign: TextAlign.center,
          ),
          backgroundColor: Color(0xff00cccc),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              if (images.image.isNotEmpty)
                Column(
                  children: [
                    for (var i = 0; i < images.image.length; i++)
                      Column(
                        children: [
                          Stack(children: [
                            PinchZoomImage(
                              image: Image.network(
                                'https://tadawl.com.sa/API/assets/images/ads/${images.image[i].ads_image}',
                                width: MediaQuery.of(context).size.width,
                                fit: BoxFit.cover,
                              ),
                              zoomedBackgroundColor:
                                  Color.fromRGBO(240, 240, 240, 1.0),
                              hideStatusBarWhileZooming: true,
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(
                                  images.randdLeft, images.randdTop, 5, 5),
                              child: Opacity(
                                opacity: 0.7,
                                child: Container(
                                  width: 60.0,
                                  height: 60.0,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: const NetworkImage(
                                          'https://tadawl.com.sa/API/assets/images/logo22.png'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ]),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                          ),
                        ],
                      ),
                  ],
                )
              else
                Container(),
            ],
          ),
        ),
      );
    });
  }
}
