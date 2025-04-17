import 'package:flutter/material.dart';
import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:sola_web/Screens/Desktop/user_account/user_profile.dart';

import '../../../main.dart';
import '../../../utils/global.dart';
import '../../footer.dart';
import 'custom_support.dart';
import 'user_courses.dart';
import 'user_event.dart';
import 'user_inbox.dart';
import 'user_logout.dart';
import 'user_resources.dart';
import 'view_user_course.dart';

class UserAccountControl extends StatefulWidget {
  const UserAccountControl({super.key});

  @override
  State<UserAccountControl> createState() => UserAccountControlState();
}

class UserAccountControlState extends State<UserAccountControl> {
  @override
  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context).size;
    return Scaffold(
      // body: ListView(
      //   children: [
      //     myWidgets.title(width: screen.width, tab: "auth"),
      //     Row(
      //       crossAxisAlignment: CrossAxisAlignment.start,
      //       // mainAxisSize: MainAxisSize.min,
      //       children: [
      //         build_left_nav_bar(),
      //         Expanded(
      //           child: build_body(),
      //           // child: Container(),
      //         ),
      //       ],
      //     ),
      //     const Footer(),
      //   ],
      // ),
      body: SizedBox(
        // color: background_color,
        width: screen.width,
        height: screen.height,
        child: Column(
          children: [
            myWidgets.title(width: screen.width, tab: "auth"),
            Expanded(
              child: ListView(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                          height: screen.height, child: build_left_nav_bar()),
                      Expanded(
                        child: build_body(),
                      ),
                    ],
                  ),
                  const Footer(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  dynamic res;

  build_body() {
    if (selected_tab == 'courses') {
      return UserCourse(navigateTo: (pageData) {
        setState(() {
          selected_tab = pageData['page'];
          res = pageData['data'];
        });
      });
    } else if (selected_tab == 'view_course') {
      return ViewUserCourse(
        res: res,
        navigateTo: (pageData) {
          setState(() {
            selected_tab = pageData['page'];
          });
        },
      );
    } else if (selected_tab == 'resources') {
      return UserResources(
        isSmallScreen: false,
      );
    } else if (selected_tab == 'events') {
      return const UserEvents();
    } else if (selected_tab == 'inbox') {
      return const UserInbox();
    } else if (selected_tab == 'profile') {
      return UserProfile(navigateTo: (pageData) {
        setState(() {
          selected_tab = pageData['page'];
        });
      });
    } else if (selected_tab == 'support') {
      return const CustomerSupport();
    } else if (selected_tab == 'logout') {
      return Logout(navigateTo: (pageData) {
        setState(() {
          selected_tab = pageData['page'];
        });
      });
    } else {
      return const SizedBox();
    }
  }

  String selected_tab = 'courses';

  Widget build_left_nav_bar() {
    double navWidthSize = 300;
    Color sideBarColor = const Color.fromRGBO(254, 234, 203, 1);
    return Container(
      width: navWidthSize,
      // height: MediaQuery.of(context).size.height - 65,
      decoration: BoxDecoration(
        color: sideBarColor,
      ),
      child: ListView(
        children: [
          buildUserHeader(navWidthSize),
          Column(
            // mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 30),
              InkWell(
                onTap: () {
                  setState(() {
                    selected_tab = "courses";
                  });
                },
                child: Container(
                  width: double.maxFinite,
                  margin: const EdgeInsets.only(bottom: 15),
                  height: 60,
                  alignment: Alignment.center,
                  color: selected_tab == "courses"
                      ? constants.yellow
                      : sideBarColor,
                  child: Text(
                    "Courses",
                    style: TextStyle(
                      fontSize: constants.fontsize20,
                      fontFamily: constants.w400,
                      color: selected_tab == "courses"
                          ? Colors.white
                          : Colors.black,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    selected_tab = "resources";
                  });
                },
                child: Container(
                  width: double.maxFinite,
                  margin: const EdgeInsets.only(bottom: 15),
                  height: 60,
                  alignment: Alignment.center,
                  color: selected_tab == "resources"
                      ? constants.yellow
                      : sideBarColor,
                  child: Text(
                    "Resources",
                    style: TextStyle(
                      fontSize: constants.fontsize20,
                      fontFamily: constants.w400,
                      color: selected_tab == "resources"
                          ? Colors.white
                          : Colors.black,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    selected_tab = "events";
                  });
                },
                child: Container(
                  width: double.maxFinite,
                  margin: const EdgeInsets.only(bottom: 15),
                  height: 60,
                  alignment: Alignment.center,
                  color: selected_tab == "events"
                      ? constants.yellow
                      : sideBarColor,
                  child: Text(
                    "Events",
                    style: TextStyle(
                      fontSize: constants.fontsize20,
                      fontFamily: constants.w400,
                      color: selected_tab == "events"
                          ? Colors.white
                          : Colors.black,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    selected_tab = "inbox";
                  });
                },
                child: Container(
                  width: double.maxFinite,
                  margin: const EdgeInsets.only(bottom: 15),
                  height: 60,
                  alignment: Alignment.center,
                  color:
                      selected_tab == "inbox" ? constants.yellow : sideBarColor,
                  child: Text(
                    "Inbox",
                    style: TextStyle(
                      fontSize: constants.fontsize20,
                      fontFamily: constants.w400,
                      color:
                          selected_tab == "inbox" ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    selected_tab = "support";
                  });
                },
                child: Container(
                  width: double.maxFinite,
                  margin: const EdgeInsets.only(bottom: 15),
                  height: 60,
                  alignment: Alignment.center,
                  color: selected_tab == "support"
                      ? constants.yellow
                      : sideBarColor,
                  child: Text(
                    "Support",
                    style: TextStyle(
                      fontSize: constants.fontsize20,
                      fontFamily: constants.w400,
                      color: selected_tab == "support"
                          ? Colors.white
                          : Colors.black,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    selected_tab = "logout";
                  });
                },
                child: Container(
                  width: double.maxFinite,
                  margin: const EdgeInsets.only(bottom: 15),
                  height: 60,
                  alignment: Alignment.center,
                  color: selected_tab == "logout"
                      ? constants.yellow
                      : sideBarColor,
                  child: Text(
                    "Log Out",
                    style: TextStyle(
                      fontSize: constants.fontsize20,
                      fontFamily: constants.w400,
                      color: selected_tab == "logout"
                          ? Colors.white
                          : Colors.black,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 50),
            ],
          ),
        ],
      ),
    );
  }

  Container buildUserHeader(double navWidthSize) {
    return Container(
      width: navWidthSize - 50,
      // margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        // color: Colors.white,
      ),
      child: Column(
        children: [
          SizedBox(
            height: 140,
            width: 140,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: FastCachedImage(
                height: 140,
                width: 140,
                url: getX.read(v.USER_IMAGE),
                // url: img_url,
                // url: "https://res.cloudinary.com/dnylnyntb/image/upload/v1710889251/product-image/kpfoujz1f5ntdi7x4tgj.jpg",
                fit: BoxFit.cover,
                fadeInDuration: const Duration(seconds: 1),
                errorBuilder: (context, exception, stacktrace) {
                  return Image.asset(
                    "./assets/images/profile.png",
                    height: 140,
                    width: 140,
                  );
                },
                loadingBuilder: (context, progress) {
                  return const Center(child: CircularProgressIndicator());
                },
              ),
            ),
          ),
          Text(
            getX.read(v.FULLNAME),
            style: TextStyle(
              fontSize: constants.fontsize20,
              fontFamily: constants.w500,
              color: Colors.black87,
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                selected_tab = "profile";
              });
            },
            child: Text(
              'Edit Profile',
              style: TextStyle(
                fontSize: constants.fontsize16,
                fontFamily: constants.w700,
                color: constants.lightPurple,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
