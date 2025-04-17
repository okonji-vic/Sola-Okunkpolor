import 'package:flutter/material.dart';
import 'package:sola_web/screens/Mobile/aboutPage.dart';
import 'package:sola_web/screens/Mobile/auth/signup.dart';
import 'package:sola_web/screens/Mobile/coachingPage.dart';
import 'package:sola_web/screens/Mobile/consulting.dart';
import 'package:sola_web/screens/Mobile/coursesPage.dart';
import 'package:sola_web/screens/Mobile/eventsPage.dart';
import 'package:sola_web/screens/Mobile/gallery_mobile.dart';
import 'package:sola_web/screens/Mobile/homepage.dart';
import 'package:sola_web/screens/Mobile/shop.dart';
import 'package:sola_web/screens/Mobile/trainingPage.dart';

import '../Screens/Mobile/Auth/login.dart';
import '../Screens/Mobile/build_blog_card.dart';
import '../Screens/Mobile/user_account/user_account_control.dart';
import '../Screens/Mobile/view_blog_mobile.dart';
import '../screens/Mobile/blog_mobile.dart';

class SmallScreen extends StatelessWidget {
  final int screen;
  dynamic res;
  // final bool isLoggedIn;
  // String? searchWord;
  // String? location;
  // String? category;
  // dynamic item;
  // String? tab;
  // bool? chatSelected;
  // String? otherUserId;
  // String? otherUsername;
  // String? otherUserImg;
  // String? adId;
  // String? adTitle;
  // String? convID;
  // String? link;

  SmallScreen({
    Key? key,
    required this.screen,
    required this.res,
    // required this.isLoggedIn,
    // this.searchWord,
    // this.location,
    // this.category,
    // this.item,
    // this.tab,
    // this.chatSelected,
    // this.otherUserId,
    // this.otherUsername,
    // this.otherUserImg,
    // this.adId,
    // this.adTitle,
    // this.convID,
    // this.link,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [
      const MobileHomePage(), //0
      const MobileAboutPage(), //1
      const MobileTrainingPage(), //2
      const MobileCoachingPage(), //3
      const MobileConsultingPage(), //4
      const MobileCoursesPage(), //5
      const MobileEventsPage(), //6
      const MobileShopPage(), //7
      const MobileLogin(), //8
      const MobileSignUp(), //9
      const MobileGallery(), //10
      const MobileBlog(), //11
      MobileViewBlogs(), //12
      const SizedBox(), //13
      const UserAccountControlMobile(), //14
      // MobileHomePage(isLoggedIn: isLoggedIn),
      // const MobileLogin(),
      // const MobileSignUp(),
      // const MobileForgotPassword(),
      // MobileSellItem(isLoggedIn: isLoggedIn),
      // MobileEditAd(isLoggedIn: isLoggedIn, ad: item),
      // MobileSellerPage(isLoggedIn: isLoggedIn, item: item),
      // MobileSearchPage(searchWord: searchWord!, location: location!, isLoggedIn: isLoggedIn),
      // MobileCategoryPage(isLoggedIn: isLoggedIn, category: category!),
      // MobileViewAdPage(isLoggedIn: isLoggedIn, item: item),
      // MobileProfile(
      //   isLoggedIn: isLoggedIn,
      //   tab: tab!,
      //   chatSelected: chatSelected!,
      //   convID: convID!,
      //   adId: adId,
      //   adTitle: adTitle,
      //   otherUserId: otherUserId,
      //   otherUsername: otherUsername,
      //   otherUserImg: otherUserImg,
      // ),
      // MobileQuickLink(link: link!, isLoggedIn: isLoggedIn)
    ];
    return screens[screen];
  }
}
