// import 'dart:html';

import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:sola_web/layout.dart';
import 'package:sola_web/utils/constants.dart';
import 'package:sola_web/utils/db.dart';
import 'package:sola_web/utils/functions.dart';
import 'package:sola_web/utils/routes.dart';
import 'package:url_strategy/url_strategy.dart';

// var screen = MediaQuery.of(context).size;

// flutter build web --web-renderer html

void main() async {
  await GetStorage.init();
  await FastCachedImageConfig.init(clearCacheAfter: const Duration(days: 15));

  setPathUrlStrategy();
  runApp(const MyApp());
}

Routes route = Routes();
Constants constants = Constants();
Database db = Database();
MobileWidgets myMobileWidgets = MobileWidgets();
DesktopWidgets myWidgets = DesktopWidgets();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return OverlaySupport.global(
      child: MaterialApp(
        title: 'Sola Okunkpolor',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          fontFamily: 'Nunito-Regular',
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        // home: CartWidget()
        initialRoute: route.homePage,
        routes: {
          route.homePage: (context) => SiteLayout(screen: 0, res: ""),
          route.aboutPage: (context) => SiteLayout(screen: 1, res: ""),
          route.trainingPage: (context) => SiteLayout(screen: 2, res: ""),
          route.coachingPage: (context) => SiteLayout(screen: 3, res: ""),
          route.consultingPage: (context) => SiteLayout(screen: 4, res: ""),
          route.coursesPage: (context) => SiteLayout(screen: 5, res: ""),
          route.eventsPage: (context) => SiteLayout(screen: 6, res: ""),
          route.shopPage: (context) => SiteLayout(screen: 7, res: ""),
          route.signupPage: (context) => SiteLayout(screen: 8, res: ""),
          route.loginPage: (context) => SiteLayout(screen: 9, res: ""),
          route.galleryPage: (context) => SiteLayout(screen: 10, res: ""),
          route.blogPage: (context) => SiteLayout(screen: 11, res: ""),
          route.viewBlogPage: (context) => SiteLayout(screen: 12, res: ""),
          route.bookConsultation: (context) => SiteLayout(screen: 13, res: ""),
          route.userAccountControl: (context) =>
              SiteLayout(screen: 14, res: ""),
        },
      ),
    );
  }
}
