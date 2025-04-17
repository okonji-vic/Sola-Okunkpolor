import 'package:flutter/material.dart';
import 'package:sola_web/screens/Desktop/auth/login.dart';
import 'package:sola_web/screens/Desktop/coachingPage.dart';
import 'package:sola_web/screens/Desktop/consulting.dart';
import 'package:sola_web/screens/Desktop/coursesPage.dart';
import 'package:sola_web/screens/Desktop/eventsPage.dart';
import 'package:sola_web/screens/Desktop/gallery_desktop.dart';
import 'package:sola_web/screens/Desktop/homepage.dart';
import 'package:sola_web/screens/Desktop/shop.dart';
import 'package:sola_web/screens/Desktop/trainingPage.dart';

import '../Screens/Desktop/aboutPage.dart';
import '../Screens/Desktop/user_account/user_account_control.dart';
import '../Screens/Desktop/view_blog.dart';
import '../screens/Desktop/auth/signup.dart';
import '../screens/Desktop/blog.dart';
import '../screens/Desktop/book_consultation.dart';

class LargeScreen extends StatelessWidget {
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

  LargeScreen({
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
      const DesktopHomePage(), //0
      const DesktopAboutPage(), //1
      const DesktopTrainingPage(), //2
      const DesktopCoachingPage(), //3
      const DesktopConsultingPage(), //4
      const DesktopCoursesPage(), //5
      const DesktopEventsPage(), //6
      const DesktopShopPage(), //7
      const DesktopSignUp(), //8
      const DesktopLogin(), //9
      const GalleryDesktop(), //10
      const BlogDesktop(), //11
      const ViewBlogs(), //12
      const BookConsultationDesktop(), //13 //issue here with another Consultation page
      const UserAccountControl(), //14 //issue here with another Consultation page
      // const DesktopLogin(),//1
      // const DesktopSignUp(),//2
      // const DesktopForgotPassword(),//3
      // DesktopSellItem(isLoggedIn: isLoggedIn),//4
      // DesktopEditAd(isLoggedIn: isLoggedIn, ad: item),//5
      // DesktopSellerPage(isLoggedIn: isLoggedIn, item: item),//6
      // DesktopSearchPage(searchWord: searchWord!, location: location!, isLoggedIn: isLoggedIn),//7
      // DesktopCategoryPage(isLoggedIn: isLoggedIn, category: category!),//8
      // DesktopViewAdPage(isLoggedIn: isLoggedIn, item: item),//9
      // DesktopProfile(
      //   isLoggedIn: isLoggedIn,
      //   tab: tab!,
      //   chatSelected: chatSelected!,
      //   convID: convID!,
      //   adId: adId,
      //   adTitle: adTitle,
      //   otherUserId: otherUserId,
      //   otherUsername: otherUsername,
      //   otherUserImg: otherUserImg,
      // ),//10
      // DesktopQuickLink(link: link!, isLoggedIn: isLoggedIn)//11
    ];
    return screens[screen];
  }
}
