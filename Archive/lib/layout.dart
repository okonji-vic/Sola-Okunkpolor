import 'package:flutter/material.dart';
import 'package:sola_web/main.dart';
import 'package:sola_web/widgets/large_screen.dart';
import 'package:sola_web/widgets/responsiveness.dart';
import 'package:sola_web/widgets/small_screen.dart';

class SiteLayout extends StatelessWidget {
  // final int screen;
  int screen;
  // final bool isLoggedIn;
  dynamic res;
  // bool isLoggedIn;
  // String searchWord;
  // String location;
  // String category;
  // String tab;
  // dynamic item;
  // bool chatSelected;
  // String otherUserId;
  // String otherUsername;
  // String otherUserImg;
  // String adId;
  // String adTitle;
  // String convID;
  // String link;

  SiteLayout({
    Key? key,
    required this.screen,
    required this.res,
    // this.isLoggedIn = false,
    // this.searchWord = "",
    // this.location = "All Nigeria",
    // this.category = "",
    // this.tab = "Account Information",
    // this.item,
    // this.chatSelected = false,
    // this.otherUserId = "",
    // this.otherUsername = "",
    // this.otherUserImg = "",
    // this.adId = "",
    // this.adTitle = "",
    // this.convID = "none",
    // this.link = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;

    return Scaffold(
      body: ResponsiveWidget( 
        largeScreen: LargeScreen(
          screen: screen,
          res: res,
          // screen: arguments["screen"] ?? 0,
          // isLoggedIn: arguments["isLoggedIn"] ?? false,
          // searchWord: arguments["searchWord"] ?? "",
          // location: arguments["location"] ?? "",
          // category: arguments["category"] ?? "",
          // tab: arguments["tab"] ?? "Account information",
          // item: arguments["item"] ?? "",
          // chatSelected: arguments["chatSelected"] ?? false,
          // otherUserId: arguments["otherUserId"] ?? "",
          // otherUsername: arguments["otherUsername"] ?? "",
          // otherUserImg: arguments["otherUserImg"] ?? "",
          // adId: arguments["adId"] ?? "",
          // adTitle: arguments["adTitle"] ?? "",
          // convID: arguments["convID"] ?? "none",
          // link: arguments["link"] ?? "",
        ),
        smallScreen: SmallScreen(
          screen: screen,
          res: res,
          // screen: arguments["screen"] ?? 0,
          // isLoggedIn: arguments["isLoggedIn"] ?? false,
          // searchWord: arguments["searchWord"] ?? "",
          // location: arguments["location"] ?? "",
          // category: arguments["category"] ?? "",
          // tab: arguments["tab"] ?? "Account information",
          // item: arguments["item"] ?? "",
          // chatSelected: arguments["chatSelected"] ?? false,
          // otherUserId: arguments["otherUserId"] ?? "",
          // otherUsername: arguments["otherUsername"] ?? "",
          // otherUserImg: arguments["otherUserImg"] ?? "",
          // adId: arguments["adId"] ?? "",
          // adTitle: arguments["adTitle"] ?? "",
          // convID: arguments["convID"] ?? "none",
          // link: arguments["link"] ?? "",
        ),
      ),
    );
  }
}
