import 'package:flutter/material.dart';
import 'package:fast_cached_network_image/fast_cached_network_image.dart';

import '../../../main.dart';
import '../../../utils/functions.dart';
import '../../../utils/global.dart';
import '../../Desktop/user_account/custom_support.dart';
import '../../Desktop/user_account/user_event.dart';
import '../../Desktop/user_account/user_inbox.dart';
import '../../Desktop/user_account/user_logout.dart';
import '../../Desktop/user_account/user_profile.dart';
import '../../Desktop/user_account/user_resources.dart';
import '../../footer.dart';
import 'user_course_mobile.dart';
import 'view_user_course.dart';

class UserAccountControlMobile extends StatefulWidget {
  const UserAccountControlMobile({super.key});

  @override
  State<UserAccountControlMobile> createState() =>
      UserAccountControlMobileState();
}

class UserAccountControlMobileState extends State<UserAccountControlMobile> {
  MobileWidgets myWidgets = MobileWidgets();

  final GlobalKey<ScaffoldState> _key = GlobalKey(); // Create a key

  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context).size;
    return Scaffold(
      key: _key,
      body: ListView(
        children: [
          myWidgets.title(width: screen.width, tab: "user_account_control"),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisSize: MainAxisSize.min,
            children: [
              // build_left_nav_bar(),
              Padding(
                padding: const EdgeInsets.only(left: 18.0, top: 18),
                child: InkWell(
                  onTap: () {
                    _key.currentState!.openDrawer();
                  },
                  child: Image.asset(
                    "assets/images/drawer_icon.png",
                    // fit: BoxFit.cover,
                    height: 18,
                    width: 25,
                  ),
                ),
              ),
              Expanded(
                child: build_body(),
                // child: Container(),
              ),
            ],
          ),
          const Footer(),
        ],
      ),
      drawer: Drawer(
          // Drawer content
          child: build_left_nav_bar()),
    );
  }

  dynamic res;


  build_body() {
    if (selected_tab == 'courses') {
      return UserCourseMobile(navigateTo: (pageData) {
        setState(() {
          selected_tab = pageData['page'];
          res = pageData['data'];

        });
      });
    } else if (selected_tab == 'view_course') {
      return ViewUserCourseMobile(
        res: res,

        navigateTo: (pageData) {
          setState(() {
            selected_tab = pageData['page'];
          });
        },
      );
    } else if (selected_tab == 'resources') {
      return UserResources(
        isSmallScreen: true,
      );
    } else if (selected_tab == 'events') {
      return const UserEvents();
    } else if (selected_tab == 'inbox') {
      return const UserInbox();
    } else if (selected_tab == 'profile') {
      return  UserProfile(
        navigateTo: (pageData) {
          setState(() {
            selected_tab = pageData['page'];
          });
        }
      );
    } else if (selected_tab == 'support') {
      return const CustomerSupport();
    } else if (selected_tab == 'logout') {
      return Logout(
        navigateTo: (pageData) {
          setState(() {
            selected_tab = pageData['page'];
          });
        },
      );
    } else {
      return const SizedBox();
    }
  }

  String selected_tab = 'courses';

  Widget build_left_nav_bar() {
    double navWidthSize = 200;
    Color sideBarColor = const Color.fromRGBO(254, 234, 203, 1);
    return Container(
      width: navWidthSize,
      // height: MediaQuery.of(context).size.height - 65,
      decoration: BoxDecoration(
        color: sideBarColor,
      ),
      child: Column(
        // mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          const SizedBox(height: 40),
          InkWell(
            onTap: () {
              _key.currentState!.closeDrawer();
              setState(() {
                selected_tab = "courses";
              });
            },
            child: Container(
              width: double.maxFinite,
              margin: const EdgeInsets.only(bottom: 5, top: 5),
              padding: const EdgeInsets.only(left: 30),
              height: 30,
              // alignment: Alignment.center,
              color:
                  selected_tab == "courses" ? constants.yellow : sideBarColor,
              child: Text(
                "COURSES",
                style: TextStyle(
                  fontSize: constants.fontsize20,
                  fontFamily: constants.w400,
                  color:
                      selected_tab == "courses" ? Colors.white : Colors.black,
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              _key.currentState!.closeDrawer();

              setState(() {
                selected_tab = "resources";
              });
            },
            child: Container(
              width: double.maxFinite,
              margin: const EdgeInsets.only(bottom: 5, top: 5),
              padding: const EdgeInsets.only(left: 30),
              height: 30,
              // alignment: Alignment.center,
              color:
                  selected_tab == "resources" ? constants.yellow : sideBarColor,
              child: Text(
                "RESOURCES",
                style: TextStyle(
                  fontSize: constants.fontsize20,
                  fontFamily: constants.w400,
                  color:
                      selected_tab == "resources" ? Colors.white : Colors.black,
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                _key.currentState!.closeDrawer();

                selected_tab = "events";
              });
            },
            child: Container(
              width: double.maxFinite,
              margin: const EdgeInsets.only(bottom: 5, top: 5),
              padding: const EdgeInsets.only(left: 30),
              height: 30,
              // alignment: Alignment.center,
              color: selected_tab == "events" ? constants.yellow : sideBarColor,
              child: Text(
                "EVENTS",
                style: TextStyle(
                  fontSize: constants.fontsize20,
                  fontFamily: constants.w400,
                  color: selected_tab == "events" ? Colors.white : Colors.black,
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              _key.currentState!.closeDrawer();

              setState(() {
                selected_tab = "inbox";
              });
            },
            child: Container(
              width: double.maxFinite,
              margin: const EdgeInsets.only(bottom: 5, top: 5),
              padding: const EdgeInsets.only(left: 30),
              height: 30,
              // alignment: Alignment.center,
              color: selected_tab == "inbox" ? constants.yellow : sideBarColor,
              child: Text(
                "INBOX",
                style: TextStyle(
                  fontSize: constants.fontsize20,
                  fontFamily: constants.w400,
                  color: selected_tab == "inbox" ? Colors.white : Colors.black,
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              _key.currentState!.closeDrawer();

              setState(() {
                selected_tab = "support";
              });
            },
            child: Container(
              width: double.maxFinite,
              margin: const EdgeInsets.only(bottom: 5, top: 5),
              padding: const EdgeInsets.only(left: 30),
              height: 30,
              // alignment: Alignment.center,
              color:
                  selected_tab == "support" ? constants.yellow : sideBarColor,
              child: Text(
                "SUPPORT",
                style: TextStyle(
                  fontSize: constants.fontsize20,
                  fontFamily: constants.w400,
                  color:
                      selected_tab == "support" ? Colors.white : Colors.black,
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              _key.currentState!.closeDrawer();

              setState(() {
                selected_tab = "logout";
              });
            },
            child: Container(
              width: double.maxFinite,
              margin: const EdgeInsets.only(bottom: 5, top: 5),
              padding: const EdgeInsets.only(left: 30),
              height: 30,
              // alignment: Alignment.center,
              color: selected_tab == "logout" ? constants.yellow : sideBarColor,
              child: Text(
                "LOG OUT",
                style: TextStyle(
                  fontSize: constants.fontsize20,
                  fontFamily: constants.w400,
                  color: selected_tab == "logout" ? Colors.white : Colors.black,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Divider(),
          const SizedBox(
            height: 10,
          ),
          Center(child: buildUserHeader()),
          const SizedBox(height: 50),
        ],
      ),
    );
  }

  Widget buildUserHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 30,
          width: 30,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: FastCachedImage(
              height: 30,
              width: 30,
              url: getX.read(v.USER_IMAGE),
              // url: img_url,
              // url: "https://res.cloudinary.com/dnylnyntb/image/upload/v1710889251/product-image/kpfoujz1f5ntdi7x4tgj.jpg",
              fit: BoxFit.cover,
              fadeInDuration: const Duration(seconds: 1),
              errorBuilder: (context, exception, stacktrace) {
                return Image.asset(
                  "./assets/images/profile.png",
                  height: 30,
                  width: 30,
                );
              },
              loadingBuilder: (context, progress) {
                return const Center(child: CircularProgressIndicator());
              },
            ),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Text(
          getX.read(v.FULLNAME),
          style: TextStyle(
            fontSize: constants.fontsize20,
            fontFamily: constants.w500,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }
}
